#!/bin/bash

if [ ! -e /spigot/.init_done ]; then
  /init.sh $@
fi
exec java $@ -jar /spigot/spigot.jar
