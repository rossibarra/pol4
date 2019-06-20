#!/bin/bash -l
#SBATCH -D /home/jri/projects/pol4/
#SBATCH -J alignment
#SBATCH -o /home/jri/projects/pol4/out-%j.txt
#SBATCH -e /home/jri/projects/pol4/error-%j.txt
#SBATCH --mem 48G 
#SBATCH -t 48:40:00
#SBATCH -n 24
#SBATCH -p high2

read1=$1
bamname=$2

module load bwa
module load samtools

bwa mem -t 20 /group/jrigrp/Share/assemblies/Zea_mays.AGPv4.dna.chr.fa $read1 | samtools sort -O 'bam' -T "$bamname".tmp - | tee "$bamname".bam | samtools flagstat - > "$bamname".stats
