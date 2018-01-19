#!/bin/bash

####filtering missing genotype percentage on SNP data only: 10%, 20%, 30%, 40%, 50%
####the paremeter is the path of the indexed vcf file

vcftools --gzvcf $1 --max-missing 0.1 --remove-indels --out perc1_missing &
vcftools --gzvcf $1 --max-missing 0.2 --remove-indels --out perc1_missing &
vcftools --gzvcf $1 --max-missing 0.3 --remove-indels --out perc1_missing &
vcftools --gzvcf $1 --max-missing 0.4 --remove-indels --out perc1_missing &
vcftools --gzvcf $1 --max-missing 0.5 --remove-indels --out perc1_missing &


