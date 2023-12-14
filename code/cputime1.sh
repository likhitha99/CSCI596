#!/bin/bash

accession_list_file="/scratch1/rayyala/HLA_data/accession_lists/cpu_mem_list.txt"
output_folder="Optiress"
i=12
while IFS= read -r accession_line
do
    # Remove any leading/trailing whitespace
    accession_line=$(echo "$accession_line" | tr -d '[:space:]')
    i+=1
    # Append the necessary file names to construct input1 and input2
    input1="${accession_line}Aligned.sortedByCoord.out.extracted.1.fq"
    input2="${accession_line}Aligned.sortedByCoord.out.extracted.2.fq"

    echo "Accession line: $accession_line"
    echo "Input 1: $input1"
    echo "Input 2: $input2"

    echo "#!/bin/bash" > "run_${i}.job"
    echo "#SBATCH --partition=epyc-64" >> "run_${i}.job"
    echo "#SBATCH --nodes=1" >> "run_${i}.job"
    echo "#SBATCH --ntasks=1" >> "run_${i}.job"
    echo "#SBATCH --cpus-per-task=1" >> "run_${i}.job"
    echo "#SBATCH --mem=32GB" >> "run_${i}.job"
    echo "#SBATCH --time=48:00:00" >> "run_${i}.job"
    echo "#SBATCH --mail-type=all" >> "run_${i}.job"
    echo "#SBATCH --mail-user=chittamp@usc.edu" >> "run_${i}.job"
    echo "run-t1k -1 $input1 -2 $input2 --preset hla -f hlaidx/hlaidx_rna_seq.fa --od $output_folder --frac 0.20 --crossGeneRate 0.08" > "run_${i}.sh"
    echo "bash run_${i}.sh" >> "run_${i}.job"
    sbatch "run_${i}.job"

done < "$accession_list_file"

