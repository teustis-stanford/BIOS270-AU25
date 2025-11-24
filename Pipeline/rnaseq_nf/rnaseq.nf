// RNA-seq QC → Trim Galore → Salmon + DESeq2 (from CSV samplesheet)
// Expect a CSV with columns: sample,read1,read2,condition
// No intermediate samples.csv is generated; DESeq2 infers quant.sf paths
// from --outdir/<sample>/salmon_outs/quant.sf
nextflow.enable.dsl=2

include { FASTQC } from './modules/qc/fastqc.nf'
include { TRIMGALORE } from './modules/qc/trimgalore.nf'
include { SALMON } from './modules/pseudoalign/salmon.nf'
include { DESEQ2 } from './modules/diffexp/deseq2.nf'


// -------------------- Channels --------------------
def samplesheet_ch = Channel
  .fromPath(params.samplesheet)
  .ifEmpty { error "Missing --samplesheet file: ${params.samplesheet}" }

samples_ch = samplesheet_ch.splitCsv(header:true).map { row ->
    tuple(row.sample.trim(), file(row.read1.trim(), absolute: true), file(row.read2.trim(), absolute:true), row.condition.trim())
}

// -------------------- Workflow --------------------

workflow {
    FASTQC(samples_ch)
    trimmed_ch = TRIMGALORE(samples_ch)

// This is the indexing fucntion we were asked to write
    index_ch = Channel.empty()

    // if params.index exists, use it
    if( params.index && file(params.index).exists() ) {
        println "Using existing Salmon index at: ${params.index}"
        index_ch = Channel.value(params.index)
    }
    // if no params.index but yes params.transcriptome
    else if( params.transcriptome ) {
        index_dir = params.index ? params.index : "${params.outdir}/salmon_index"

        process SALMON_INDEX {
            input:
                path transcriptome_fasta from params.transcriptome

            output:
                path index_dir into salmon_index_ch

            script:
            """
            salmon index -t $transcriptome_fasta -i $index_dir
            """
        }

        index_ch = salmon_index_ch
    }
    // If niether, give error
    else {
        error "You must provide either params.index (existing) or params.transcriptome to build a Salmon index"
    }

    quant_ch   = SALMON(trimmed_ch, params.index)

    if( params.run_deseq ) {
        // Collect all Salmon outputs into a map {sample: quant_path}

        quant_paths_ch = quant_ch
            .map { sample, quant, cond -> "${sample},${quant}" }
            .collectFile(
                name: "quant_paths.csv", 
                newLine: true, 
                seed: "sample,quant_path"  // This adds the header as the first line
            )
        DESEQ2(quant_paths_ch, samplesheet_ch)
    }
}
workflow.onComplete {
    log.info "Pipeline finished. Results in: ${params.outdir}"
}
