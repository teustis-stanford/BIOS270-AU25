# Writeup 2

Name: Tara Eustis
Date: 11/14/25

## Overview:
This Writeup includes the infomation from Environment.md. Questions were also answered in the specific files as well

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

Docker Image Build:
The code given in Environment.md is backwards for the docker build, it gives ... -t . bioinfo_example which gives and error as docker thinks the current path (.) is the name and bioinfo_example is the directory when it should be the opposite.
<img width="1350" height="442" alt="image" src="https://github.com/user-attachments/assets/9c9cd867-a2ca-466b-8755-50274fa4c553" />

VSCODE Web Porting
This was not too difficult, though I think the directory in the singularity code gave farmshare/users/[SUNNetid] rather than farmshare/user_data/[SUNNetID] which is our actual Scratch folder
<img width="1778" height="1456" alt="image" src="https://github.com/user-attachments/assets/0125114a-be6b-4e76-99f4-8de216d2204b" />
