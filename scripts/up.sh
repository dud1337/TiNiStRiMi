#!/bin/sh
if [ -n "$2" ] && [ "$2" = "ondemand" ]; then
    echo -n "{\"status\":\"offline\"}" > /usr/share/nginx/html/status.json
    exit
fi

echo -n "{\"status\":\"online\",\"type\":\"$1\"}" > /usr/share/nginx/html/status.json
