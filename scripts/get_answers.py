import os
import json
from pypdf import PdfReader
import re

# Specify the directory you want to work with
directory_path = '.'

# Initialize a dictionary to hold results
results = {}

# Iterate over all files in the directory
for filename in os.listdir(directory_path):
    # Create full path to the file
    file_path = os.path.join(directory_path, filename)
    print(f"Processing file: {file_path}")
    
    # Check if the file is a PDF
    if file_path.lower().endswith('.pdf'):
        reader = PdfReader(file_path)
        
        for page in reader.pages:
            text = page.extract_text()
            
            # Extract ID and Correct Answer using regular expressions
            if text:
                # This regex looks for ID and Correct Answer lines, ignoring the "Answer" part
                matches = re.findall(r'ID:\s*(\S+)(?:.*?Answer:\s*([^\n]*))?', text, re.DOTALL)
                # Process each match
                for id_value, correct_answer in matches:
                    id_value = id_value.strip()
                    # If no "Correct Answer" line was found, set as 'Not found'
                    correct_answer = correct_answer.strip() if correct_answer else 'Not found'
                    results[id_value] = correct_answer

# Save results to a JSON file
with open('answers.json', 'w') as json_file:
    json.dump(results, json_file, indent=4)

print(f'Results saved to answers.json')
