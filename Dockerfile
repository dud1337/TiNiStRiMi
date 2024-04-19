FROM bluenviron/mediamtx:latest-ffmpeg

RUN apk add --no-cache nginx

COPY ./scripts /data/scripts
COPY ./mediamtx/mediamtx.yml /mediamtx.yml
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/www /usr/share/nginx/html/
COPY ./start.sh /start.sh

RUN echo -n "{\"status\":\"offline\"}" > /usr/share/nginx/html/status.json
RUN chmod 666 /usr/share/nginx/html/status.json

EXPOSE 80/tcp
EXPOSE 1935/tcp
EXPOSE 8189/udp

ENV TINISTRIMI_PASSWORD=TiNiStRiMi
ENV TINISTRIMI_WEBRTC_HOSTS=

ENTRYPOINT [ "/start.sh" ]
