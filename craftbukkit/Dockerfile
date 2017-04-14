#
# Minecraft server (CraftBukkit) Dockerfile
# https://github.com/dtp/docker-minecraft
#

# Pull base image
FROM openjdk:jre-alpine

# Install dependencies and configure git for BuildTools
RUN apk add --no-cache wget ca-certificates git bash && \
    mkdir /craftbukkit

# Copy scripts and set permissions
COPY init.sh start.sh /
RUN chmod +x /init.sh /start.sh

# Define mountable directory
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define start entry point
ENTRYPOINT ["/bin/sh", "/start.sh"]

# Expose server and RCON ports
EXPOSE 25565 25575

# Define runtime variables
ENV VERSION="latest"
