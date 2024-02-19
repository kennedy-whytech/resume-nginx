FROM --platform=linux/amd64 node:latest

WORKDIR /usr/src/app

COPY app .

RUN npm install

EXPOSE 80
CMD ["node", "server.js"]
