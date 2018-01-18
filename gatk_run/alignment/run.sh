#!/bin/bash

cd $1
N=6
for i in *_1.fq.gz
do
    mn=${i/_1.fq.gz/_2.fq.gz}
    sm=`echo $i | cut -d"_" -f1`
    pu=`echo $i | cut -d"_" -f4`
    ld=`echo $i | cut -d"_" -f3`
    ((i=i%N)); ((i++==0)) && wait
    /home/sunzq/minimap2/minimap2 -R '@RG\tID:$sm\tLD:$ld\tPL:illumina\tPU:$pu\tSM:$sm' -t 20 -2 -K 2G -/share/10t/fangyj/bin/arahy.Tifrunner.gnm1.KYV3.main_genome.fna $i $mn &    
done
