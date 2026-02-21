# This script demonstrates the use of conditional statements in bash.
# Define a variable

#!/bin/bash
read -p "Enter your name:" name
if [[ -z name ]]; then
    echo "You did not enter a name."
else
    echo "Hello, $name!"
fi