#!/bin/sh

sed -i "s/TiNiStRiMi_password_replace/$TINISTRIMI_PASSWORD/g" /mediamtx.yml
sed -i "s/TiNiStRiMi_webrtc_hosts_replace/$TINISTRIMI_WEBRTC_HOSTS/g" /mediamtx.yml

# Start Nginx
nginx &

# Start your application (replace '/mediamtx' with the actual command to start your application)
/mediamtx
