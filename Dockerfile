FROM alpine
MAINTAINER Coderaiser

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk update && \
    apk add --no-cache e2fsprogs-extra && \
    rm -rf /usr/include /tmp/* /var/cache/apk/*

COPY . /usr/src/app

EXPOSE 8000

ENTRYPOINT /usr/src/app/loop.sh

