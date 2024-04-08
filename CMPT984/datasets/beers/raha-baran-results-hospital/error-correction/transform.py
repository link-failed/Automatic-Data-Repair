import pickle

# Step 1: Deserialize the .dataset file to get the Dataset object
dataset_file_path = 'correction.dataset'
with open(dataset_file_path, 'rb') as file:
    data = pickle.load(file)

# Step 2: Export the desired DataFrame to a CSV file
# Specify the path where you want to save the CSV file
csv_file_path = 'correction.csv'

# Assuming you have the write_csv_dataset method correctly implemented in your Dataset class
# and you want to export the primary 'dataframe' attribute
data.write_csv_dataset(csv_file_path, data.dataframe)

print(f"Dataset exported to CSV file at {csv_file_path}.")
