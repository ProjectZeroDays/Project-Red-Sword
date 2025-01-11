#!/bin/bash

LOG_FILE="logs/audit_log.txt"
ERROR_LOG="logs/error_log.txt"
REPORT_FILE="reports/audit_report.txt"

# Function to generate the report
generate_report() {
    echo "Generating Audit Report..." > "$REPORT_FILE"
    echo "Audit Report - $(date)" >> "$REPORT_FILE"
    echo "===================================" >> "$REPORT_FILE"

    echo "Audit Log Entries:" >> "$REPORT_FILE"
    echo "-----------------------------------" >> "$REPORT_FILE"
    cat "$LOG_FILE" >> "$REPORT_FILE"

    echo "" >> "$REPORT_FILE"
    echo "Error Log Entries:" >> "$REPORT_FILE"
    echo "-----------------------------------" >> "$REPORT_FILE"
    if [ -s "$ERROR_LOG" ]; then
        cat "$ERROR_LOG" >> "$REPORT_FILE"
    else
        echo "No errors encountered during the audit." >> "$REPORT_FILE"
    fi

    echo "" >> "$REPORT_FILE"
    echo "Audit Summary:" >> "$REPORT_FILE"
    echo "-----------------------------------" >> "$REPORT_FILE"
    echo "Total Audit Time: $(grep -c "Starting Corporate Device Security Audit" "$LOG_FILE")" >> "$REPORT_FILE"
    echo "Total Errors: $(wc -l < "$ERROR_LOG")" >> "$REPORT_FILE"

    echo "Report generated successfully at $(date)." >> "$REPORT_FILE"
}

# Execute report generation
generate_report
