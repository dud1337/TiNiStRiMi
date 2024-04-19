FROM nginx
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./www /usr/share/nginx/html/
RUN ln -s /shared/status.json /usr/share/nginx/html/status.json
