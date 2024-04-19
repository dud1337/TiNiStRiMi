FROM bluenviron/mediamtx:latest-ffmpeg

COPY ./nostream.webm /data/media/nostream.webm
COPY ./scripts /data/scripts
COPY ./mediamtx.yml /mediamtx.yml
COPY ./start.sh /start.sh

RUN mkdir /shared
RUN echo -n "{\"status\":\"offline\"}" > /shared/status.json
RUN chmod 666 /shared/status.json

ENTRYPOINT [ "/start.sh" ]
