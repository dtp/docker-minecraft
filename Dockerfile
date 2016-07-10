#
# Minecraft server Dockerfile
# https://github.com/dtp/docker-minecraft
#

# Pull base image
FROM java:alpine
MAINTAINER cm_star

# Install dependencies
RUN apk add --no-cache wget ca-certificates jq

# Copy scripts and set permissions
COPY init.sh start.sh /
RUN chmod +x /init.sh /start/sh

# Define mountable directory
VOLUME ["/data"]

# Define working directory
WORKDIR /data

# Define start command
CMD ["sh", "/start.sh"]

# Expose server and RCON ports
EXPOSE 25565 25575

# Define runtime variables
ENV TYPE="vanilla" \
    VERSION="release" \
    JVM_OPTS="-Xms512M -Xmx1G"
