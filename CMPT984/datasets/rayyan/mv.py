import csv
import random

def randomly_remove_values(input_file, output_file, remove_probability):
    with open(input_file, 'r') as infile, open(output_file, 'w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)
        headers = next(reader)
        writer.writerow(headers)

        for row in reader:
            modified_row = row[:]
            if len(row) >= 3:
                if random.random() < remove_probability:
                    modified_row[1] = ''  # Remove value in the second column
                if random.random() < remove_probability:
                    modified_row[2] = ''  # Remove value in the third column
            writer.writerow(modified_row)

# Example usage:
input_file = 'clean222.csv'  # Change this to your input file name
output_file = '../beers/MV222.csv'  # Change this to your output file name
remove_probability = 0.3  # Probability of removing values (adjust as needed)

randomly_remove_values(input_file, output_file, remove_probability)
