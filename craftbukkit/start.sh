#!/bin/sh

if [ ! -e /craftbukkit/.init_done ]; then
  /init.sh
fi
exec java $@ -jar /craftbukkit/craftbukkit.jar
