#!/bin/bash

# Go to repo directory
cd /home/sreekar_mohan/git_connection/cron_job_linux || exit 1

# Fixed file name
LOG_FILE="system_status.log"

# Overwrite with latest command history
echo "===== COMMAND HISTORY on $(date) =====" > "$LOG_FILE"
cat /home/sreekar_mohan/.bash_history >> "$LOG_FILE"

# Append CPU & RAM usage
echo "" >> "$LOG_FILE"
echo "===== CPU & RAM USAGE on $(date) =====" >> "$LOG_FILE"
top -b -n1 | head -20 >> "$LOG_FILE"

# Git add, commit, push
git add "$LOG_FILE"
git commit -m "Updated system log on $(date)"
git push origin master


