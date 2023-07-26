## Getting duplicate % from host BAM files:

module load jdk/1.8.0_291 picard/2.27.5

for i in *.bam; do picard MarkDuplicates -I $i -O ${i/.bam/_markDuped.bam} -M ${i/.bam/_duplicates.txt}; done

for i in *.txt; do echo ${i/_G_dups.txt/} >> ehi.tsv && grep 'Unknown' $i | cut -f9 >> percent.tsv; done

paste ehi.tsv percent.tsv > host_duplicates.tsv
