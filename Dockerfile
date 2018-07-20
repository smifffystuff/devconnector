FROM node

LABEL maintainer="Martin Smith <martin.smifff@gmail.com"

RUN git --version
ENV appDir /var/www

RUN mkdir ${appDir}
# COPY package.json ${appDir}
# COPY server.js ${appDir}
# COPY client ${appDir}/client
# COPY config ${appDir}/config
# COPY models ${appDir}/models
# COPY routes ${appDir}/routes
# COPY validation ${appDir}/validation

WORKDIR ${appDir}

RUN git clone https://github.com/smifffystuff/devconnector.git

WORKDIR ${appDir}/devconnector

RUN npm install

RUN npm install --prefix client

RUN npm run docker-postbuild 


