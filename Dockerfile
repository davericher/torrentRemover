FROM lsiobase/ubuntu:bionic
# set version label
ARG BUILD_DATE
ARG VERSION
ARG TORRENTREMOVER_RELEASE
LABEL maintainer="davericher"
ARG DEBIAN_FRONTEND="noninteractive"
RUN echo "**** Installing packages ****" && \
    curl -sL https://deb.nodesource.com/setup_11.x | bash -  && \
    apt-get update &&  \
    apt-get install -y nodejs transmission-cli libssl1.0 wget jq\
    echo "**** Installing TorrentRemover ****" && \

WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
CMD node index.js
