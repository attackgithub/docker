FROM golang:alpine

LABEL maintainer="warhorse@thedarkcloud.net"

ENV MODLISHKA_REPOSITORY="github.com/drk1wi/Modlishka"
ENV INSTALL_PACKAGES="git make gcc musl-dev"
ENV PROJECT_DIR="${GOPATH}/src/${MODLISHKA_REPOSITORY}"
ENV MODLISHKA_BIN="/bin/proxy"

RUN mkdir -p ${GOPATH}/src/github.com/drk1wi \
    && apk add --no-cache ${INSTALL_PACKAGES} \
    && git -C ${GOPATH}/src/github.com/drk1wi clone https://github.com/drk1wi/Modlishka \
    && cp ${PROJECT_DIR}/extra/docker/run-server.sh /bin/run-server.sh

RUN set -ex \
		&& chmod +x /bin/run-server.sh \
        && cd ${PROJECT_DIR}/ && go get ./... && make \
		&& cp ${PROJECT_DIR}/dist/proxy ${MODLISHKA_BIN} \
		&& apk del ${INSTALL_PACKAGES} && rm -rf /var/cache/apk/* && rm -rf ${GOPATH}/src/*
		
CMD ["run-server.sh"]