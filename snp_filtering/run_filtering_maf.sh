#!/bin/bash

###this is the script to run the filtering for maf 0.01, 0.02, 0.05, 0.10, 0.15, 0.20
###the paremeter is the indexed vcf file

vcftools --gzvcf $1 --maf 0.01 --remove-indels --out perc1 &
vcftools --gzvcf $1 --maf 0.02 --remove-indels --out perc2 &
vcftools --gzvcf $1 --maf 0.05 --remove-indels --out perc5 &
vcftools --gzvcf $1 --maf 0.10 --remove-indels --out perc10 &
vcftools --gzvcf $1 --maf 0.15 --remove-indels --out perc15 &
vcftools --gzvcf $1 --maf 0.20 --remove-indels --out perc20 &
