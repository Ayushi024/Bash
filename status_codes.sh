#!/bin/bash
read -p "Yes? y/n: " answer
if [[ "$answer" == "y" ]]
then
   echo "You said yes"
   exit 0       #success
elif [[ "$answer" == "n" ]]
then
   echo "You said no"
   exit 1     #failure
else
   echo "Wrong Input"
   exit -1    #failure
fi



#exit(0);  // program ends successfully
#exit(1);  // program ends with an error