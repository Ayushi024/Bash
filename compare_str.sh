# This script demonstrates comparing two strings in bash.
#Compare two strings
#Write a script that:takes two strings,prints whether they are equal or not


#!/bin/bash
read -p "Enter string 1: " str1
read -p "Enter string 2: " str2
if [ "$str1" = "$str2" ]; then
  echo "Strings are equal"
else
  echo "Strings are not equal"  
fi


# ==:used to compare variable with the value
if [ "$str1" == "hello" ]; then
  echo "String 1 is hello"  
fi

#!=: used to check if the variable is not equal to other variable or value
if [ "$str1" != "$str2" ]; then
  echo "Strings are not equal"  # Output: Strings are not equal
fi



