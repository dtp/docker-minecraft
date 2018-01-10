#
# Minecraft server (Forge) Dockerfile
# https://github.com/dtp/docker-minecraft
#

# Pull base image
FROM openjdk:9-jre-slim

# Install dependencies
RUN apt-get update \
    apt-get install -y --no-install-recommends wget curl ca-certificates jq; \
    mkdir /forge

# Copy scripts and set permissions
COPY init.sh start.sh /
RUN chmod +x /init.sh /start.sh

# Define mountable directories
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define entry point
ENTRYPOINT ["/bin/sh", "/start.sh"]

# Expose server and RCON ports
EXPOSE 25565 25575

# Define runtime variables
ENV VERSION="recommended" \
  MODPACK=""
