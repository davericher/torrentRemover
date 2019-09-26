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
    apt-get install -y nodejs transmission-cli libssl1.0 wget jq unzip &&\
    echo "**** Installing TorrentRemover ****" && \
    mkdir -p \ /app/torrentRemover && \
    wget https://github.com/davericher/torrentRemover/archive/master.zip -P /app/torrentRemover && unzip /app/torrentRemover/master.zip -d /app/torrentRemover && \
    echo "**** fix for host id mapping error ****" && \
    chown -R root:root /app/torrentRemover && \
    echo "**** cleanup ****" && \
    apt-get clean && \
#    rm /app/torrentRemover/master.zip && \
    rm -rf /tmp/* var/lib/apt/lists/* /var/tmp/*
# add local files
WORKDIR /app/torrentRemover/torrentRemover-master/
RUN npm install
CMD node index.js
