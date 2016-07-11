#
# Minecraft server (Vanilla) Dockerfile
# https://github.com/dtp/docker-minecraft
#

# Pull base image
FROM java:alpine
MAINTAINER cm_star

# Install dependencies
RUN apk add --no-cache wget ca-certificates jq && \
    mkdir /minecraft

# Copy scripts and set permissions
COPY init.sh start.sh /
RUN mv init.sh init && \
    mv start.sh start && \
    chmod +x /init /start

# Define mountable directory
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define start command
CMD ["sh", "/start"]

# Expose server and RCON ports
EXPOSE 25565 25575

# Define runtime variables
ENV VERSION="release" \
    JVM_OPTS="-Xms512M -Xmx1G"
