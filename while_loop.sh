# This script demonstrates the use of while loops in bash.
# Reverses a number entered by the user.


#!/bin/bash
read -p "Enter a number:" num
reversed=0
while [[ $num -gt 0 ]]; do
   digit=$(( num%10 ))
   reversed=$(( reversed*10 + digit ))
   num=$(( num/10 ))
done
echo "Reversed number: $reversed"
