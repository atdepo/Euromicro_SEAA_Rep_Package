import pandas as pd
from pydriller import Repository
from tqdm import tqdm

# Load the dataset
file_path = '/Users/broke31/Desktop/Euromicro2024/ole/splitted/over60/well_engineered.csv'
data = pd.read_csv(file_path)

# Function to get the number of contributors for a GitHub repository
def get_number_of_contributors(repo_url):
    try:
        contributors = set()
        for commit in Repository(repo_url).traverse_commits():
            contributors.add(commit.author.email)
        return len(contributors)
    except Exception as e:
        print(f"Error processing {repo_url}: {e}")
        return 0

# Extract GitHub repository URLs from the dataset
repo_urls = data['GitHub Repo'].apply(lambda x: f"https://github.com/{x}")

# Initialize a list to store the number of contributors for each repository
contributors_count = []

# Iterate over each repository and get the number of contributors
for repo_url in tqdm(repo_urls, desc="Processing repositories"):
    contributors_count.append(get_number_of_contributors(repo_url))

# Add the new column to the dataset
data['Contributors'] = contributors_count

# Save the updated dataset to a new CSV file
output_path = 'updated_well_engineered_with_contributors.csv'
data.to_csv(output_path, index=False)

print("Updated dataset with contributors saved to:", output_path)