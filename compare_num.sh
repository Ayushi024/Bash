# This script demonstrates comparing two numbers in bash.
#Compare two numbers
#Write a script that:takes two numbers,prints which one is greater or prints "Both are equal"


#!/bin/bash
read -p "Enter number 1: " a
read -p "Enter number 2: " b
read -p "Enter number 3: " c

if [[ $a -gt $b && $a -gt $c ]]; then
   echo "$a is greater among all three"
elif [[ $b -gt $a && $b -gt $c ]]; then
   echo "$b is greater among all three"
else
   echo "$c is greater among all three"
fi