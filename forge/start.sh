#!/bin/sh

if [ ! -e /forge/.init_done ]; then
  /init.sh
fi
exec java $@ -jar /forge/forge-*-universal.jar nogui
