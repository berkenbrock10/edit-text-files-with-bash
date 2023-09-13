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

# Initialize an empty list
list=()

# Log message when the process starts
echo "Processing the file '$input_file'..."

# Loop to process each line of the file
while IFS= read -r line; do
  # You can change this part according to your preference
  # Remove "GET " from the beginning and " HTTP/1.1" from the end of the line
  object=$(echo "$line" | sed 's/^"GET //;s/ HTTP\/1.1"$/"/')

  # Add the object to the list
  list+=("$object")

  # Log message for each processed line
  echo "Processed line: $object"
done < "$input_file"

# Write the list to a new output file
printf "%s\n" "${list[@]}" > "$output_file"

# Log message when the process finishes
echo "Processing completed. Items in the list: ${#list[@]}"
echo "List of objects written to '$output_file'"
