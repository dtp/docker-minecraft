#
# Minecraft server (Vanilla) Dockerfile
# https://github.com/dtp/docker-minecraft
#

# Pull base image
FROM openjdk:9-jre-slim

# Install dependencies
RUN apt-get update; \
    apt-get install -y --no-install-recommends wget ca-certificates jq; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir /minecraft

# Copy scripts and set permissions
COPY init.sh start.sh /
RUN chmod +x /init.sh /start.sh

# Define mountable directory
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define entry point
ENTRYPOINT ["/bin/bash", "/start.sh"]

# Expose server and RCON ports
EXPOSE 25565 25575

# Define runtime variables
ENV VERSION="release"
