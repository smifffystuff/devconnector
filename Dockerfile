FROM node:alpine

LABEL maintainer="Martin Smith <martin.smifff@gmail.com"

ENV appDir /var/www

RUN mkdir ${appDir}
COPY package.json ${appDir}
COPY server.js ${appDir}
COPY client ${appDir}/client
COPY config ${appDir}/config
COPY models ${appDir}/models
COPY routes ${appDir}/routes
COPY validation ${appDir}/validation

WORKDIR ${appDir}

RUN npm install
RUN NPM audit fix

RUN npm install --prefix client
RUN NPM audit fix --prefix client

RUN npm run heroku-postbuild 


