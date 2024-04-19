![tinistrimi_logo](https://github.com/dud1337/TiNiStRiMi/assets/5631021/b9d17de4-61b4-48fe-b7ea-d41413990547)
---
Simple streaming platform. Suits small communities. Give the streamer password 
to a user, they can stream with OBS, anyone else can watch in browser. Uses [mediamtx](https://github.com/bluenviron/mediamtx).

* Supports RTMP and WHIP (webrtc)
* Dynamically provides a link to in-browser LLHLS and webrtc viewing
    * *i.e., you can watch in browser*

The dockerhub image is infrequently built compared to mediamtx. **Building with the docker compose file is recommended for updated nginx and mediamtx.**

For WHIP (webrtc) to work, one needs to provide a host. At the time of writing, firefox requires an IP, not just a domain.

## 1. Guide

### 1.1 Run docker image or service(s)
#### dockerhub image (demo)

```
docker pull dud1337/tinistrimi:latest
docker run -e "TINISTRIMI_PASSWORD=<your password>" \
           -e "TINISTRIMI_WEBRTC_HOSTS=<your ips or hosts separated by commas if more than one>" \
           -p 1935:1935 -p 8080:80 -p 8189:8189/udp dud1337/tinistrimi:latest
```

#### docker compose (recommended) 
```
git clone https://github.com/dud1337/tinistrimi
cd tinistrimi
```
Edit the environment variables in docker-compose.yml:
```yml
...
    environment:
      TINISTRIMI_PASSWORD: <password streamers can use>
      TINISTRIMI_WEBRTC_HOSTS: <your ip/domain list separted by commas> # e.g. 192.168.1.15,yourstream.com
...
```
Then, 
```
docker compose build --pull
docker compose up
```

### 1.2 OBS configuration
Default password is `TiNiStRiMi`.

For WHIP (recommended - requires OBS 30+), File, Settings, Stream
* Service: `WHIP`
* Server: `http://streamer:<your password>@<your domain/ip>:8080/stream/whip`
* Bearer Token:

**If WHIP isn't viewable in the browser when locally testing, it may be due to firefox not liking UDP traffic to localhost - try from a different host**

For RTMP (only option with streamlabs from android):
* Service: `Custom...`
* Server: `rtmp://<your domain/ip>`
* Stream Key: `stream?user=streamer&pass=<your password>`

### 1.3 Viewing
1. Navigate to `http://<your domain/ip>:8080`
2. Click 'Watch' - only shows if someone is streaming

## 2. Advanced Config
Consider bind mount volumes for `www` and `mediamtx.yml` to further customise.
