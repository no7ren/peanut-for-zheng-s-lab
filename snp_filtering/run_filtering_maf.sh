#!/bin/bash

###this is the script to run the filtering for maf 0.01, 0.02, 0.05, 0.10, 0.15, 0.20

vcftools --gzvcf $1 --maf 0.01 --out perc1 &
vcftools --gzvcf $1 --maf 0.02 --out perc2 &
vcftools --gzvcf $1 --maf 0.05 --out perc5 &
vcftools --gzvcf $1 --maf 0.10 --out perc10 &
vcftools --gzvcf $1 --maf 0.15 --out perc15 &
vcftools --gzvcf $1 --maf 0.20 --out perc20 &
