#!/bin/sh
if [ -n "$2" ] && [ "$2" = "ondemand" ]; then
    exit
fi

echo -n "{\"status\":\"offline\"}" > /shared/status.json
