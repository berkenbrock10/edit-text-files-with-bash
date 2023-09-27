#!/bin/bash

# Input file name
input_file="<Name of your file with the extension.txt>"
# Output file name
output_file="output.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "The input file '$input_file' does not exist."
  exit 1
fi

# Output directory
output_dir="output_files"

# Log message when the process starts
#echo "Processing the file '$input_file'..."

# Loop to process each line of the file
while IFS= read -r line; do
  # Determines the name of the output file based on the contents of the line
  if [[ $line == *"/autocompletes/popular?"* ]]; then
    output_file="$output_dir/autocompletes-popular.csv"
  elif [[ $line == *"/navigates?"* ]]; then
    output_file="$output_dir/navigates.csv"
  elif [[ $line == *"/search?"* ]]; then
    output_file="$output_dir/search.csv"
  elif [[ $line == *"/autocompletes?"* ]]; then
    output_file="$output_dir/autocompletes-all.csv"
  elif [[ $line == *"/clicks?"* ]]; then
    output_file="$output_dir/clicks.csv"
  elif [[ $line == *"/hotsites?"* ]]; then
    output_file="$output_dir/hotsites.csv"
  else
    # If the line does not match any of the above standards, ignore it
    continue
  fi

  # Add the line to the output file
  echo "$line" >> "$output_file"

done < "$input_file"

# Success Log
echo "Separation completed. Output files are in the '$output_dir' directory."