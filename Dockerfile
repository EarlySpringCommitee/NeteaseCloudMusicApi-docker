FROM node:lts-alpine

RUN apk add --no-cache tini git
RUN git clone https://github.com/Binaryify/NeteaseCloudMusicApi.git /app
RUN chown -R node:node /app

ENV NODE_ENV production
USER node

WORKDIR /app

RUN npm i --omit=dev --ignore-scripts

EXPOSE 3000

CMD [ "/sbin/tini", "--", "node", "app.js" ]