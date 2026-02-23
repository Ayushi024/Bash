#!/bin/bash

# ============================================================
# QUESTION:
#
# Project .env
#
# We want to create some simple project setup automation with Bash.
#
# Given a `.env.example` file containing placeholders like:
# {{EMAIL}}, {{PASSWORD}}, {{USERNAME}}, {{API_VERSION}}
#
# The script should:
# 1. Check if `.env` exists and ask before overwriting
# 2. Prompt user for email and password
# 3. Generate USERNAME from email (text before '@')
# 4. Copy `.env.example` to `.env`
# 5. Replace placeholders with actual values
# 6. Set API_VERSION programmatically
#
# ============================================================
#!/bin/bash

API_VERSION="v1.0"

if [[ -f ".env" ]]; then
  read -p ".env already exists. Override? (y/n): " choice
  if [[ "$choice" != "y" ]]; then
    echo "Aborting."
    exit 1
  fi
fi

read -p "Enter your Email: " EMAIL
read -s -p "Enter Password: " PASSWORD
echo

USERNAME=$(echo "$EMAIL" | cut -d'@' -f1)

cp .env.example .env

sed -i \
  -e "s/{{EMAIL}}/$EMAIL/g" \
  -e "s/{{PASSWORD}}/$PASSWORD/g" \
  -e "s/{{USERNAME}}/$USERNAME/g" \
  -e "s/{{API_VERSION}}/$API_VERSION/g" \
  .env

echo ".env created successfully"
