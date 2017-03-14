#!/bin/sh

if [ ! -e "/spigot/spigot.jar" ]; then
  /init.sh $@
fi
exec java $@ -jar /spigot/spigot.jar
