#!/bin/sh

if [ -e "/init" ]; then
  exec /init
  rm -f /init
fi
exec java $JVM_OPTS -jar /spigot/spigot.jar
