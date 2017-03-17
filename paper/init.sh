#!/bin/sh

printf "Downloading Paperclip...\n"
(
  cd /paper
  wget -q "https://ci.destroystokyo.com/job/PaperSpigot/lastSuccessfulBuild/artifact/paperclip.jar"
  touch .init_done
)
