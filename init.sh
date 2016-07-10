#!/bin/sh

case "$1" in
  "paperclip")
    printf "Downloading Paperclip..."
    wget -qO /server.jar "https://ci.destroystokyo.com/job/PaperSpigot/lastSuccessfulBuild/artifact/paperclip.jar"
    ;;
  *)
    printf "Downloading version manifest...\n"
    wget -qP .. "https://launchermeta.mojang.com/mc/game/version_manifest.json"
    wget -qO /manifest.json \
      $(printf $(jq -r --arg ver "$2" --arg rel "$(jq -r '.latest.release' < /version_manifest.json)" \
      '(.versions[] | select(.id == $ver).url),(.versions[] | select(.id == $rel).url)' < /version_manifest.json) \
      | awk '{print $1}')
    printf "Downloading Minecraft server ($(jq -r '.id' < /manifest.json))...\n"
    wget -qO /server.jar "$(jq -r '.downloads.server.url' < /manifest.json)"
    printf "Removing manifests...\n"
    rm -f /version_manifest.json /manifest.json
    ;;
esac
