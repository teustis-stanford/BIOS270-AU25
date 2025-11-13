# Writeup 1

Name: Tara Eustis
Date: 11/13/25

## Overview:
This Writeup includes the infomation from Setup.md and Environment.md. Questions were also answered in the specific files as well

### Setup.md Contents
Answer the following questions in your `write-up`:
1. How many slurm job will be submitted?

    3 will be submitted, since the array goes from 0-2.

2. What is the purpose of the `if` statement?

    The if statement assigns the data to different slurm jobs.

3. What is the expected output in each `*.out` file?

    It will just look like the echo, where it tells you what value is on each line.

### Environment.md
Example python script output:

<img width="1800" height="1200" alt="image" src="https://github.com/user-attachments/assets/a68180bf-08ed-4c37-af16-0d97e0621fac" />

Example R Script output:

<img width="2099" height="2099" alt="image" src="https://github.com/user-attachments/assets/496c96fe-7408-449d-8b04-4474df9de272" />


- What micromamba command can you use to list all created environemnts?
  
  micromamba info
- What micromamba command can you use to list all packages installed in a specific environment?
  
  micromamba list -n [name_of_env]
- What micromamba command can you use to remove a package?
  
  micromamba remove -n [env_name] [package_name]
- What micromamba command can you use to install a package from a specific channel?
  
  micromamba install -n [env_name] -c [channel] [package]
- What micromamba command can you use to remove an environment?
  
  micromamba env remove -n [env_name]

- What are all the `r-base` and `Bioconductor` packages that were installed in the `bioinfo_example` environment?
*(Hint: You may want to use one of the commands from your answers to the above questions, and combine it with the `grep` command.)*

  micromamba list -n bioinfo_example | grep -E "r-base|bioconductor"
