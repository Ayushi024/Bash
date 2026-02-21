# This script is used to compare two strings lexicographically.
#Write a script that takes two strings and prints which one is lexicographically greater or prints "Both are equal"

#!/bin/bash
read -p "Enter string 1: " s1
read -p "Enter string 2: " s2

str1="${s1,,}"
str2="${s2,,}"

if [[ "$str1" > "$str2" ]]; then
  echo "$s1 is greater"
elif [[ "$str2" > "$str1" ]]; then
  echo "$s2 is greater"
else
  echo "both are equal"
fi