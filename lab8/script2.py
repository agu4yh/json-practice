import json

# Read in the file as JSON
with open('data/schacon.repos.json', 'r') as file:
    data = json.load(file)

# Open and write to the chacon.csv file 
with open('chacon.csv', 'w') as csvfile:

    # Iterate through the first 5 repos
    for repo in data[:5]:
        # Fill the four fields
        name = repo['name']
        html_url = repo['html_url']
        updated_at = repo['updated_at']
        visibility = repo['visibility']

        # Assemble the four fields into a comma-separated line
        csvfile.write(f"{name},{html_url},{updated_at},{visibility}\n")