# This script demonstrates the use of for loops in bash.
#Write a Bash script that lists all .log files in the current directory using a for loop.


#!/bin/bash
for File in *.log; do
    echo "Found log file: $File"
done

