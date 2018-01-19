#!/bin/bash
###the filtering script for different ad: 5, 7, 10, 12, 15
###the parameter is the indexed vcf file

sudo docker run -it --user $(id -u) -v `pwd`:`pwd` -w `pwd` --rm bcftools:1.6 bcftools filter -i 'AD[1-]>' $1 | vcftools --vcf - --remove-indels --out ad1
