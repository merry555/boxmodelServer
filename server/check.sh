#!/bin/bash
SERVICE="amazonei_tensor"

if pgrep -x "$SERVICE"

then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
    echo "start $SERVICE"
    ./start_server.sh
fi;

# echo %GIT_TAG_MESSAGE%