FROM ubuntu:20.04

ARG REMOTE_DOWNLOADLINK

LABEL maintainer="Stefan Ruepp <stefan@ruepp.info>"
LABEL github="https://github.com/MyUncleSam/docker-syncovery-remoteservice/"

ENV SYNCOVERY_HOME=/config
ENV TZ=Europe/Berlin
ENV DEBIAN_FRONTEND=noninteractive

# download installer files for debian
RUN mkdir -p /tmp /docker /syncovery /config \
    && apt-get update \
    && apt-get install --no-install-recommends -y bash wget openssl ca-certificates tzdata zip unzip p7zip p7zip-full p7zip-rar \
    && ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get autoclean -y && apt-get clean -y && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && cd /tmp \
    && wget -O "${SETUP_TEMP}/remote.tar.gz" "${REMOTE_DOWNLOADLINK}" \
    && tar -xvf "${SETUP_TEMP}/remote.tar.gz" --directory /syncovery \
    && chmod +x /syncovery/SyncoveryRS \
    && cd / \
    && rm -rf /tmp/*

EXPOSE 8949

VOLUME [ "/config" ]

ENTRYPOINT [ "/syncovery/SyncoveryRS" ]