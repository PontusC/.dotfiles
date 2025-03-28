#!/bin/bash

# Generated by claude
# Function to open file in Neovim and set working directory
nvim-open() {
    # If no arguments are provided, open Neovim in current directory
    if [ $# -eq 0 ]; then
        nvim
        return 0
    fi

    # Get the full path of the file
    local file_path=$(realpath "$1")

    # If file is a directory, open Neovim in that directory
    if [ -d "$file_path" ]; then
        nvim -c "cd $file_path"
        return 0
    fi

    # Check if file exists
    if [ ! -f "$file_path" ]; then
        echo "Error: File does not exist"
        return 1
    fi

    # Get the directory of the file
    local file_dir=$(dirname "$file_path")

    # Open Neovim with the file and change directory
    nvim -c "cd $file_dir" "$file_path"
}
