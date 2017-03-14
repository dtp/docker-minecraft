#!/bin/sh

if [ ! -e "/minecraft/server.jar" ]; then
  /init.sh
fi
exec java $@ -jar /minecraft/server.jar nogui
