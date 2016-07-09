FROM java:alpine
MAINTAINER cm_star

ENV TYPE "vanilla"
ENV VERSION "release"
ENV JVM_OPTS "-Xms512M -Xmx1G"

RUN apk add --no-cache wget ca-certificates jq

COPY init.sh start.sh /

WORKDIR /data
VOLUME /data

EXPOSE 25565 25575

ENTRYPOINT /start.sh
