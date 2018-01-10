#!/bin/bash

if [ ! -e /minecraft/.init_done ]; then
  /init.sh
fi
exec java $@ -jar /minecraft/server.jar nogui
