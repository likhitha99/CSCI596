# CSCI596

# HLA Typing Benchmarking Study

![Image Alt Text](https://www.bing.com/th?id=OSK.bfc34f69dc3d74915b3a943ac55afe55&pid=cdx&w=320&h=252&c=7)

## Overview

This repository contains scripts for running the T1K tool and extracting its output into Excel files as part of a benchmarking study on HLA typing using bulk and single-cell RNA-seq data. The study utilizes publicly available datasets and gold standard HLA types determined through various laboratory methods.

## Specific Objectives

1. Evaluate existing HLA typing tools through a comprehensive benchmarking study, utilizing publicly available datasets.
2. Measure and compare the computational expense (CPU time and RAM usage) of each HLA typing tool.
3. Provide insights into the trade-off between accuracy and computational resources for different tools.
4. Identify and highlight tools that demonstrate an optimal balance for large-scale HLA typing studies.

## Current State of Knowledge/Previous Work

Previous studies have explored various HLA typing tools, each with its own strengths and weaknesses. However, a comprehensive benchmarking study, encompassing both bulk and single-cell RNA-seq data and considering computational expenses, is lacking. This study builds upon existing knowledge to provide a more nuanced understanding of the performance of HLA typing tools.

## Techniques to Be Used

The study utilizes publicly available datasets, including bulk RNA-seq and single-cell RNA-seq data. Tools such as the SRA-Toolkit v2.11.0 are employed for data retrieval. The RNA-seq samples are prepared in three versions to assess different input scenarios. The HLA nomenclature system defined by the World Health Organization is used. Computational expense is measured by evaluating CPU time and RAM usage for each HLA typing tool. The T1K tool, developed for this study, is employed, and its scripts are available in the 'code' directory.

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

## Computational Expense

We measured the CPU time and RAM usage of each caller for two samples per dataset to assess computational expensiveness (Fig 3a-b). We find great variation in the computational resources necessary to run the tools, with RAM ranging from the order of 100 kB to 100 GB, and CPU time ranging from approximately 10 minutes to 3 hours. While there is often a trade-off between accuracy and computational resources required by each tool, we observe that RNA2HLA yielded the best balance between high accuracy (93.3%) at low computational expense (average 0.36 GB RAM and 6.9 min CPU time), making it suitable for HLA typing with large-scale studies. In contrast, the best accuracy tool, OptiType, requires an average of 14.2 GB RAM and 45.3 min CPU time per sample.

## Code

All code related to running the T1K tool and extracting results is available in the 'code' directory. Please refer to individual scripts for specific details.

## Results

Results of the benchmarking study will be made available in the 'results' directory once the analysis is complete.

## Additional Resources

- [Link to CSV files with gold standard HLA types](https://github.com/Mangul-Lab-USC/HLA_benchmark)
