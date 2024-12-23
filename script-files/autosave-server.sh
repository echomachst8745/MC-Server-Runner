#!/bin/bash
SAVE_INTERVAL=600

while [ true ]; do
    sleep ${SAVE_INTERVAL}
    tmux send-keys -t mc-server:0 "say Saving World In 15 Seconds..." C-m
    sleep 15
    tmux send-keys -t mc-server:0 "say Saving World In 5 Seconds..." C-m
    sleep 5
    tmux send-keys -t mc-server:0 "save-all" C-m
done