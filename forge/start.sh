#!/bin/sh

if [ ! -e "/forge/forge-*-universal.jar" ]; then
  /init.sh
fi
exec java $@ -jar /forge/forge-*-universal.jar nogui
