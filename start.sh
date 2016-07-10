#!/bin/sh

if [ -e "/init.sh" ]; then
  /init.sh "$TYPE" "$VERSION"
  rm -f init.sh
fi
exec java $JVM_OPTS -jar /server.jar nogui
