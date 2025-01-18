#!/bin/bash

# Enhanced script for running search queries on multiple APIs (Censys, Zoomeye, and Shodan)
# This script reads search keywords from a provided file, processes them using the autosploit.py script,
# and saves the results to hosts.txt. It includes advanced error handling, logging, and modular design.

# Function to run queries on multiple APIs and save results
run_queries() {
    local input_file=$1
    local query_log="query.log"
    local result_file="hosts.txt"
    
    # Clear previous log and result files
    > "$query_log"
    > "$result_file"
    
    while IFS= read -r keyword; do
        echo "Processing keyword: $keyword" | tee -a "$query_log"
        if python3 autosploit.py -A -a -f etc/json/default_modules.json -q "$keyword" >> "$result_file"; then
            echo "Successfully processed: $keyword" | tee -a "$query_log"
        else
            echo "Failed to process: $keyword" | tee -a "$query_log"
        fi
    done < "$input_file"
}

# Function to display usage information
display_help() {
    echo "Usage: $0 [FILENAME]"
    echo "FILENAME: Path to the file containing search keywords."
    exit 1
}

# Main function to handle script execution
main() {
    local input_file=$1
    
    # Ensure script is run as root
    if [ "$EUID" -ne 0 ]; then
        echo "[!] This script must be run as root!"
        exit 1
    fi

    # Verify input file
    if [ -z "$input_file" ] || [ ! -f "$input_file" ]; then
        display_help
    fi

    echo "[+] Starting quicksploit searching..."
    run_queries "$input_file"
    echo "[+] Results saved to hosts.txt"
}

# Execute main function with provided arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
