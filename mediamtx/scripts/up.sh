#!/bin/sh
if [ -n "$2" ] && [ "$2" = "ondemand" ]; then
    echo -n "{\"status\":\"offline\"}" > /shared/status.json
    exit
fi

echo -n "{\"status\":\"online\",\"type\":\"$1\"}" > /shared/status.json
