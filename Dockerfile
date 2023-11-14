FROM ubuntu:18.04

# Deps
RUN apt update && apt install -y git wget

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

RUN . /root/.bashrc \
    && nvm install v14 \
    && npm install -g grunt-cli

RUN git clone https://github.com/open-webrtc-toolkit/owt-server

WORKDIR /owt-server

RUN ./scripts/installDepsUnattended.sh

# OWT Client APP Sample
WORKDIR /

RUN git clone https://github.com/open-webrtc-toolkit/owt-client-javascript

WORKDIR /owt-client-javascript/scripts

RUN . /root/.bashrc && npm install && grunt

# Build & Pack
WORKDIR /owt-server

RUN . /root/.bashrc \
    && node ./scripts/build.js -t all --check \
    && node ./scripts/pack.js -t all --install-module --app-path /owt-client-javascript/dist/samples/conference

RUN echo $(ls -l /owt-server)

# Prepare Entrypoint
COPY entrypoint.sh /entrypoint.sh

# Init & Run
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 3004
