#!/bin/sh
if [ -n "$2" ] && [ "$2" = "ondemand" ]; then
    echo -n "{\"status\":\"offline\"}" > /shared/status.json
    exit
fi

echo -n "{\"status\":\"online\",\"type\":\"$1\"}" > /shared/status.json
if [ -n "$OPSDROID_AUTH_TOKEN" ]; then
    wget --header="Authorization: Bearer $OPSDROID_AUTH_TOKEN" --post-data='{"stream_state_change":"start"}' -O /dev/null "$OPSDROID_STREAM_ENDPOINT/skill/TiNiStRiMi-opsdroid/update"
fi
