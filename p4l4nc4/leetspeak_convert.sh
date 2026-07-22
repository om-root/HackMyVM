#!/bin/bash

# Verify that a file was provided as an argument.
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 dic.txt"
    exit 1
fi

# Input/output files
file_input="$1"
file_output="1337_format.txt"

# Transformations in basic 1337 format using sed tool
sed -e 's/a/4/g' \
    -e 's/e/3/g' \
    -e 's/i/1/g' \
    -e 's/l/1/g' \
    -e 's/o/0/g' \
    -e 's/s/5/g' \
    -e 's/t/7/g' \
    "$file_input" > temp_1337.txt

  # Merge original and transformed words, removing duplicates and unnecessary capital letters
  cat "$file_input" temp_1337.txt | tr '[:upper:]' '[:lower:]' | sort | uniq > "$file_output"

  # Clean temp file
  rm temp_1337.txt

  # Show success message
  echo "saved to : $file_output"