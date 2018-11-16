FROM kudoshunsuke/docker-ubuntu:18.04
MAINTAINER KUDO Shunsuke

RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=nointractive apt install -y \
    postfix \
    sasl2-bin \
    syslog-ng \
    && rm -rf /var/lib/apt/lists/*

ENV POSTFIX_ASSETS_ROOT_DIR="/etc/docker-postfix"
ENV POSTFIX_ASSETS_BUILD_DIR="${POSTFIX_ASSETS_ROOT_DIR}/build"

COPY assets/build/ ${POSTFIX_ASSETS_BUILD_DIR}/
RUN chmod -R u+x ${POSTFIX_ASSETS_BUILD_DIR}
RUN bash ${POSTFIX_ASSETS_BUILD_DIR}/install.sh

