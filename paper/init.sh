#!/bin/sh

printf "Downloading Paperclip...\n"
wget -qP /paper/ "https://ci.destroystokyo.com/job/PaperSpigot/lastSuccessfulBuild/artifact/paperclip.jar"
