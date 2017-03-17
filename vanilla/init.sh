#!/bin/sh

printf "Downloading version manifest...\n"
(
  cd /tmp
  wget -q "https://launchermeta.mojang.com/mc/game/version_manifest.json"
  wget -qO manifest.json \
    $(printf $(jq -r --arg ver "$VERSION" --arg rel "$(jq -r '.latest.release' < version_manifest.json)" \
    '(.versions[] | select(.id == $ver).url),(.versions[] | select(.id == $rel).url)' < version_manifest.json) \
    | awk '{print $1}')
  printf "Downloading Minecraft server ($(jq -r '.id' < manifest.json))...\n"
  wget -qO /minecraft/server.jar "$(jq -r '.downloads.server.url' < manifest.json)"
  printf "Clean up...\n"
  rm -rf *
)
touch /minecraft/.init_done
