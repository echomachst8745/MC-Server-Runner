#!/bin/bash
SESSION_NAME=$(cat config-files/tmux-session-name)

# Start a new tmux session and create the first window
tmux new-session -d -s ${SESSION_NAME} -n server-console

# Create the second window named 'server-utils'
tmux new-window -t ${SESSION_NAME}:1 -n server-utils

# Return to the first window
tmux select-window -t ${SESSION_NAME}:0

# Start Server
tmux send-keys -t mc-server:0 "cd server-files && bash ../script-files/startup-script.sh" C-m
tmux send-keys -t mc-server:1.0 "bash script-files/autosave-server.sh" C-m

# Attach to the session
tmux attach-session -t ${SESSION_NAME}