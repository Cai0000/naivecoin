FROM node:16

RUN mkdir /naivecoin
WORKDIR /naivecoin

COPY package.json /naivecoin/

RUN npm cache clean --force
RUN npm install

ADD . /naivecoin/

RUN npm run compile


EXPOSE 3001
EXPOSE 6001

ENTRYPOINT npm run prestart && PEERS=$PEERS npm start
