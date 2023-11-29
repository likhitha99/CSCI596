import os
import csv
import re

# Define the column names for the CSV file
column_names = ["ERR", "A", "A.1", "B", "B.1", "C", "C.1", "DQB1", "DQB1.1", "DRB1", "DRB1.1"]

# Create a list to store the results
results = []

# Specify the directory containing the TSV files
tsv_directory = "/project/ypatel_840/chittamp/dottie/T1K/T1K/d6tsv"

# Regular expression pattern to extract the ERR code from the file name
pattern = r"GSM(\d+)"

# Iterate through each TSV file in the directory
for filename in os.listdir(tsv_directory):
    if filename.endswith(".tsv"):
        # Extract the ERR code from the filename
        match = re.search(pattern, filename)
        if match:
            err_code = "GSM" + match.group(1)
        else:
            err_code = ""

        # Initialize variables to store column values
        a_value = ""
        a1_value = ""
        b_value = ""
        b1_value = ""
        c_value = ""
        c1_value = ""
        dqb1_value = ""
        dqb1_1_value = ""
        drb1_value = ""
        drb1_1_value = ""

        # Open the TSV file
        with open(os.path.join(tsv_directory, filename), "r") as tsv_file:
            # Read the lines in the TSV file
            tsv_lines = tsv_file.readlines()

            # Extract the required values from the lines
            for line in tsv_lines:
                columns = line.split("\t")

                if columns[0] == "HLA-A":
                    if len(columns) >= 7:
                        a_value = columns[2]
                        a1_value = columns[5]
                elif columns[0] == "HLA-B":
                    if len(columns) >= 7:
                        b_value = columns[2]
                        b1_value = columns[5]
                elif columns[0] == "HLA-C":
                    if len(columns) >= 7:
                        c_value = columns[2]
                        c1_value = columns[5]
                elif columns[0] == "HLA-DQB1":
                    if len(columns) >= 7:
                        dqb1_value = columns[2]
                        dqb1_1_value = columns[5]
                elif columns[0] == "HLA-DRB1":
                    if len(columns) >= 7:
                        drb1_value = columns[2]
                        drb1_1_value = columns[5]

            # Create a result row
            result_row = [err_code, a_value if a_value else ".", a1_value if a1_value else ".", b_value if b_value else ".", b1_value if b1_value else ".", c_value if c_value else ".", c1_value if c1_value else ".", dqb1_value if dqb1_value else ".", dqb1_1_value if dqb1_1_value else ".", drb1_value if drb1_value else ".", drb1_1_value if drb1_1_value else "."]

            # Add the result row to the list of results
            results.append(result_row)

# Write the results to a CSV file
output_csv_file = "/project/ypatel_840/chittamp/dottie/T1K/T1K/T1K_d5.csv"
with open(output_csv_file, "w", newline="") as csv_file:
    writer = csv.writer(csv_file)
    writer.writerow(column_names)
    writer.writerows(results)

print("Results saved to", output_csv_file)
