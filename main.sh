#!/bin/bash

accession_list_folder="/scratch2/rayyala/read_length_data/chr6_files/d2"
output_folder="output1"
i = 0
for accession_list in "$accession_list_folder"/*.txt
do 	
   
    accession_list_name=$(basename "$accession_list" .txt)
    data_folder=$(echo "$accession_list" |  grep -oP 'd[0-9]+')
    echo "$accession_list"
    echo "value : $data_folder he"
    while IFS= read -r accession_number
    do
        echo "#!/bin/bash" > run_${accession_number}.job
        echo "#SBATCH --nodes=1" >> run_${accession_number}.job
        echo "#SBATCH --ntasks=1" >> run_${accession_number}.job
        echo "#SBATCH --cpus-per-task=5" >> run_${accession_number}.job
        echo "#SBATCH --mem=32GB" >> run_${accession_number}.job
        echo "#SBATCH --time=48:00:00" >> run_${accession_number}.job
	
        input1="/scratch2/rayyala/read_length_data/chr6_files/d2/${accession_number}"
        input2="/scratch2/rayyala/read_length_data/chr6_files/d2/${accession_number}"
	#echo "$input1 anddd $input2"
	echo "run-t1k -1 $input1 -2 $input2 --preset hla -f hlaidx/hlaidx_rna_seq.fa --od output2" > run_${accession_number}.sh
	echo "bash run_${accession_number}.sh" >> run_${accession_number}.job
        sbatch run_${accession_number}.job
    done < "$accession_list"
done

