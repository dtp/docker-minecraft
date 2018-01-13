#!/bin/sh

(
  cd /tmp
  if [ -z "$VERSION" ]; then
    printf "Downloading version manifest...\n"
    wget -qO spongevanilla.json "https://dl-api.spongepowered.org/v1/org.spongepowered/spongevanilla"
    export VERSION=$(jq -r '.buildTypes.stable.latest.dependencies.minecraft' < spongevanilla.json)
  fi
  printf "Downloading $VERSION manifest...\n"
  wget -qO downloads.json "https://dl-api.spongepowered.org/v1/org.spongepowered/spongevanilla/downloads?type=stable&minecraft=$VERSION"
  printf "Downloading SpongeVanilla server ($(jq -r '.[0].version' < downloads.json))...\n"
  wget -qO /sponge/server.jar "$(jq -r '.[0].artifacts."".url' < downloads.json)"
  printf "Clean up...\n"
  rm -rf *
)
touch /sponge/.init_done
