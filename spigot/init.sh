#!/bin/sh

(
  cd /tmp/
  printf "Downloading BuildTools...\n"
  wget -q "https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"
  printf "Building Spigot...\n"
  bash -c "java $JVM_OPTS -jar BuildTools.jar --rev $VERSION"
  mv spigot*.jar /spigot/spigot.jar
  printf "Clean up...\n"
  rm -rf *
)
