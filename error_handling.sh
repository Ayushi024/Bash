#!/bin/bash
create_directory() {
    if [ -d "demo" ]; then
        return 1  # directory exists
    else
        mkdir demo
        echo "Directory 'demo' created successfully."
        return 0
    fi
}
if ! create_directory; then
    echo "The code is being exited as the directory already exists"
    exit 1   # stops further execution
fi