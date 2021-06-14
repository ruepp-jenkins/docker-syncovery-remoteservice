FROM alpine:latest

ARG REMOTE_DOWNLOADLINK

LABEL maintainer="Stefan Ruepp <stefan@ruepp.info>"
LABEL github="https://github.com/MyUncleSam/docker-syncovery-remoteservice/"

ENV SYNCOVERY_HOME=/config
ENV TZ=Europe/Berlin
ENV DEBIAN_FRONTEND=noninteractive
ENV SSH_USERNAME
ENV SSH_PASSWORD

# download installer files for debian
RUN mkdir -p mkdir -p /tmp /docker /syncovery /config \
    && apk update \
    && apk add bash wget openssl libressl-dev zlib zlib-dev sqlite sqlite-libs libcrypto1.1 libsmbclient openssh-server sudo \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget -q -O /tmp/glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk \
    && wget -q -O /tmp/glibc-bin.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-bin-2.33-r0.apk \
    && wget -q -O /tmp/glibc-dev.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-dev-2.33-r0.apk \
    && wget -q -O /tmp/glibc-i18n.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-i18n-2.33-r0.apk \
    && apk add /tmp/glibc.apk /tmp/glibc-bin.apk /tmp/glibc-dev.apk /tmp/glibc-i18n.apk \
    && LD_LIBRARY_PATH=/lib:/usr/local/lib:/usr/bin \
    && export LD_LIBRARY_PATH \
    && cd /tmp \
    && wget -O "${SETUP_TEMP}/remote.tar.gz" "${REMOTE_DOWNLOADLINK}" \
    && tar -xvf "${SETUP_TEMP}/remote.tar.gz" --directory /syncovery \
    && chmod +x /syncovery/SyncoveryRS \
    && rm -rf /tmp/*

ADD ./start.sh /docker/start.sh

RUN chmod +x /docker/start.sh

EXPOSE 8949
EXPOSE 22

VOLUME [ "/config" ]

ENTRYPOINT [ "/docker/start.sh" ]
