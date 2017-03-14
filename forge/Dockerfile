#
# Minecraft server (Forge) Dockerfile
# https://github.com/dtp/docker-minecraft
#

# Pull base image
FROM java:alpine

# Install dependencies
RUN apk add --no-cache wget curl ca-certificates jq; \
    mkdir /forge

# Copy scripts and set permissions
COPY init.sh start.sh /
RUN chmod +x /init.sh /start.sh

# Define mountable directories
VOLUME ["/data", "/forge/mods"]

# Define working directory
WORKDIR /data

# Define entry point
ENTRYPOINT ["/bin/sh", "/start.sh"]

# Expose server and RCON ports
EXPOSE 25565 25575

# Define runtime variables
ENV VERSION="recommended" \
  MODPACK=""
