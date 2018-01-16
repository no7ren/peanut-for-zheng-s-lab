#!/bin/bash
#####first parameter is the path of the directory you put the vcf file: eg. /mnt/data/test.vcf then put /mnt/data
#####second parameter is the name of vcf file
#####third parameter is the number of minor allele frequency like 0.01, 0.05
#####fourth parameter is the number of allelic depth to filter with. eg. 10 means at least one of the alternate alleles having an AD > 10
#####fifth parameter is the maximum allowed percentage of missing data 
sudo docker build -t bcftools:1.6 .
sudo docker pull biocontainers/vcftools
sudo docker pull lethalfang/tabix:1.2.1
cd $1
sudo docker run -it --user fangyj:fangyj -v `pwd`:`pwd` -w `pwd` --rm lethalfang/tabix:1.2.1 bgzip $2
sudo docker run -it --user fangyj:fnagyj -v `pwd`:`pwd` -w `pwd` --rm bcftools:1.6 index $2.gz
sudo docker run -it --user fangyj:fnagyj -v `pwd`:`pwd` -w `pwd` --rm bcftools:1.6 bcftools view -q $3:minor $2.gz | bcftools filter -i 'AD[1-] > $4' $2.gz | sudo docker run -it --user fangyj:fnagyj -v `pwd`:`pwd` -w `pwd` --rm vcftools vcftools --vcf - --max-missing $5 --remove-indels --out $2_filtered.vcf