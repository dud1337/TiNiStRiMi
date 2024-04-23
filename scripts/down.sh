#!/bin/sh
if [ -n "$2" ] && [ "$2" = "ondemand" ]; then
    exit
fi

echo -n "{\"status\":\"offline\"}" > /usr/share/nginx/html/status.json

if [ -n "$OPSDROID_AUTH_TOKEN" ]; then
        wget --HEader="Authorization: Bearer $OPSDROID_AUTH_TOKEN" --post-data='{"stream_state_change":"stop"}' -O /dev/null "$OPSDROID_STREAM_ENDPOINT/skill/TiNiStRiMi-opsdroid/update"
fi
