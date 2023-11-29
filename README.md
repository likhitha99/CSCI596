# CSCI596

# HLA Typing Benchmarking Study

## Overview

This repository contains scripts for running the T1K tool and extracting its output into Excel files as part of a benchmarking study on HLA typing using bulk and single-cell RNA-seq data. The study utilizes publicly available datasets and gold standard HLA types determined through various laboratory methods.

## Datasets

### Bulk RNA-Seq Data
- Six publicly available datasets: ERP00194229, SRP29870430, ERP00010131, SRP09956832, SRP19849733, SRP09632934
- 652 samples from lymphoblastoid cell lines (LCLs) and peripheral blood mononuclear cells (PMBCs)
- Samples cover 5 1000-genomes project populations, 4 sequencing platforms, and various read counts and lengths

### scRNA-Seq Data
- Dataset: SRP16221435
- 20 samples from bone marrow mononuclear cells (BMMCs) using 10X Genomics Single Cell 3′ Solution v2

## Data Retrieval

We used the SRA-Toolkit v2.11.0 to download all samples in FASTQ format from the NCBI SRA archive. The retrieval process is detailed in the methods section.

## Data Preparation

We prepared three versions of the RNA-seq samples as inputs to HLA callers:
1. Raw files containing all reads
2. Files containing only reads mapping to chromosome 6
3. Files containing only reads mapping to the classical HLA region of chr6:28510120-33480577

## HLA Definition and Nomenclature

We use the HLA nomenclature system defined by the World Health Organization Committee for Factors of the HLA System in 2010. The system includes a four-part naming system as described in the methods section.

## Gold Standard HLA Types

Gold standard HLA types were determined via laboratory-based methods summarized in Table 1. The types cover various techniques, including PCR-based methods and single-cell RNA-Seq with molecular HLA genotyping.

## T1K Tool

I am responsible for the T1K tool. The repository contains scripts for running the T1K tool and extracting its output into Excel files. For more details about the T1K tool, please refer to our manuscript: [T1K Manuscript](https://www.biorxiv.org/content/10.1101/2023.05.22.541750v2).

## Code

All code related to running the T1K tool and extracting results is available in the 'code' directory. Please refer to individual scripts for specific details.

## Results

Results of the benchmarking study will be made available in the 'results' directory once the analysis is complete.

## Additional Resources

- [Link to CSV files with gold standard HLA types](https://github.com/Mangul-Lab-USC/HLA_benchmark)

## Citation

If you use this dataset or code in your work, please cite our study (citation details will be updated once the study is published).

![image](https://github.com/likhitha99/CSCI596/assets/24885960/9186d6d0-cb2f-49c3-b3a6-faadbc7cbea7)
