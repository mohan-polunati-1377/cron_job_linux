#!/bin/bash

# Go to repo directory
cd /home/sreekar_mohan/git_connection/cron_job_linux || exit 1

# File names with timestamp
HIST_FILE="history_$(date +'%Y%m%d_%H%M').log"
SYS_FILE="system_$(date +'%Y%m%d_%H%M').log"

# Save bash history (requires HISTFILE export in .bashrc for cron to see)
history > "$HIST_FILE"

# Save CPU & RAM usage
{
    echo "===== CPU & RAM Usage on $(date) ====="
    top -b -n1 | head -20
} > "$SYS_FILE"

# Git add, commit, push
git add "$HIST_FILE" "$SYS_FILE"
git commit -m "Logs on $(date)"
git push origin master

