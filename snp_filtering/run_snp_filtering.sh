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
sudo docker run -it --user $(id -u) -v `pwd`:`pwd` -w `pwd` --rm lethalfang/tabix:1.2.1 bgzip $2
sudo docker run -it --user $(id -u) -v `pwd`:`pwd` -w `pwd` --rm lethalfang/tabix:1.2.1 tabix $2
sudo docker run -it --user $(id -u) -v `pwd`:`pwd` -w `pwd` --rm bcftools:1.6 bcftools index $2.gz
sudo docker run -it --user $(id -u) -v `pwd`:`pwd` -w `pwd` --rm bcftools:1.6 bcftools filter -i 'AD[1-]>$4&&MAF>$3' $2.gz | vcftools --vcf - --max-missing $5 --remove-indels --recode --out $2_filtered
