# filter for no mismatch (but has no header so need to run samtools view -h to get the header separately)
cat <(samtools view -H pol4_mut.bam) <(samtools view -q 20 -@ 20 pol4_mut.bam | awk '$0 ~ "NM:i:0"' ) | samtools view -Sb -@ 20 - > pol4_mut_NM0_Q20.bam

