#!/bin/sh

if [ ! -e "/paper/paperclip.jar" ]; then
  /init.sh $@
fi
exec java $@ -jar /paper/paperclip.jar
