#!/bin/sh

if [ ! -e "/craftbukkit/craftbukkit.jar" ]; then
  /init.sh
fi
exec java $@ -jar /craftbukkit/craftbukkit.jar
