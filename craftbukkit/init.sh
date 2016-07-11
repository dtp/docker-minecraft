#!/bin/sh

(
  cd /tmp/
  printf "Downloading BuildTools...\n"
  wget -q "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
  printf "Building CraftBukkit...\n"
  bash -c "java $JVM_OPTS -jar BuildTools.jar --rev $VERSION"
  mv craftbukkit*.jar /craftbukkit/craftbukkit.jar
  printf "Clean up...\n"
  rm -rf *
)
