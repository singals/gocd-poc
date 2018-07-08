FROM node:10.6.0

WORKDIR /var/www
COPY src/main/app.js /var/www/app.js
EXPOSE 8080

ENTRYPOINT node app.js