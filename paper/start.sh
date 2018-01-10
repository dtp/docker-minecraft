#!/bin/bash

if [ ! -e /paper/.init_done ]; then
  /init.sh $@
fi
exec java $@ -jar /paper/paperclip.jar
