from node:alpine

RUN apk add --no-cache git
RUN git clone https://github.com/TannerReynolds/node-sharex-server /sharex

WORKDIR /sharex

RUN npm install
RUN npm install -g pm2

VOLUME ["/sharex/pages", "/sharex/uploads"]

EXPOSE 80

cmd ["pm2-docker", "start", "app.js"]
