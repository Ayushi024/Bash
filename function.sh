
#!/bin/bash
loyalornot() {
  read name
  if [[ "$name" == "loyal" ]]
  then
     echo "$name is loyal"
  else
     echo "$name is not loyal"
  fi
}

loyalornot
