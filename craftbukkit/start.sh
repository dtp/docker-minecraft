#!/bin/sh

if [ -e "/init" ]; then
  /init
  rm -f init
fi
exec java $JVM_OPTS -jar /craftbukkit/craftbukkit.jar
