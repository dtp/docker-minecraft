#!/bin/bash

if [ ! -e /sponge/.init_done ]; then
  /init.sh $@
fi
exec java $@ -jar /sponge/server.jar
