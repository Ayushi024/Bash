#!/bin/bash
# This script demonstrates how to add a user in Linux using a bash script.

add_user() {
    local username=$1
    local password=$2

    useradd -m -p "$password" "$username" && \
    echo "Successfully added user"
}

# MAIN
add_user ayushi "@123"