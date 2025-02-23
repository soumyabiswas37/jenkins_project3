FROM node

RUN mkdir /my-nodejs-app

WORKDIR /my-nodejs-app

COPY app.js /my-nodejs-app/

RUN npm init -y

RUN npm install express

CMD ["node", "app.js"]