#!/bin/bash
# Memory Size in GB
MEMG=6

while [ true ]; do
  java -Xmx${MEMG}g -Xms${MEMG}g -jar server.jar nogui
  if [ $? -eq 0 ]; then
    break
  fi
done

SESSION_NAME=$(cat ../config-files/tmux-session-name)
tmux kill-session -t ${SESSION_NAME}