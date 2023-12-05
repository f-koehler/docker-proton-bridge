FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y expect wget \
    && wget https://proton.me/download/bridge/protonmail-bridge_3.6.1-2_amd64.deb -O protonmail-bridge.deb \
    && apt-get install -y ./protonmail-bridge.deb \
    && rm protonmail-bridge.deb \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/proton-bridge/info
COPY --chmod=744 ./entrypoint.sh /opt/proton-bridge/entrypoint.sh
COPY --chmod=744 ./login.exp /opt/proton-bridge/login.exp
COPY --chmod=744 ./getpass.exp /opt/proton-bridge/getpass.exp

EXPOSE 1143 1025

ENTRYPOINT ["/opt/proton-bridge/entrypoint.sh"]