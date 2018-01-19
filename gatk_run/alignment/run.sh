#!/bin/bash

run_processing(){
   on=${1/.sam/_sorted.bam}
   mn=${1/.sam/.metrics}
   rn=${1/.sam/_rm.bam}
   /home/sunzq/prog/gatk/gatk --java-options -Djava.io.tmpdir=/share/30t-3/tmp SortSam -I=$1 -SO=coordinate -O=$on
   /home/sunzq/prog/gatk/gatk --java-options -Djava.io.tmpdir=/share/30t-3/tmp MarkDuplicates -MAX_FILE_HANDLES 1000 -I=$on -M=$mn -O=$rn
   /home/sunzq/prog/gatk/gatk HaplotypeCaller --input N402_rmdup_sm.bam --output N402_haplotype --reference /share/10t/fangyj/bin/arahy.Tifrunner.gnm1.KYV3.main_genome.fna --TMP_DIR /share/30t-1/tmp --emit-ref-confidence GVCF --sample-name N402 --sample-ploidy 4
}
cd $1
N=6
for i in *_1.fq.gz
do
    mn=${i/_1.fq.gz/_2.fq.gz}
    sm=`echo $i | cut -d"_" -f1`
    pu=`echo $i | cut -d"_" -f4`
    ld=`echo $i | cut -d"_" -f3`
    ((i=i%N)); ((i++==0)) && wait
    /home/sunzq/minimap2/minimap2 -R '@RG\tID:$sm\tLD:$ld\tPL:illumina\tPU:$pu\tSM:$sm' -t 20 -2 -K 2G /share/10t/fangyj/bin/arahy.Tifrunner.gnm1.KYV3.main_genome.fna $i $mn &    
done
