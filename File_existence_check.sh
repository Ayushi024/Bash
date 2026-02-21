
# This script checks if a file exists in the current directory.

#!/bin/bash
read -p "Enter the file name to check:" filename

if [[ -f "$filename" ]]; then
  echo "File exists"
else
  echo "File does not exist"
fi
