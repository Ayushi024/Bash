#!/bin/bash

loyalornot() {
  read -p "Enter a name or status: " name

  if [[ "$name" == "loyal" ]]; then
    echo "$name is loyal"
  else
    echo "$name is not loyal"
  fi
}

# Call the function
loyalornot
