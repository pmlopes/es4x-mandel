#!/usr/bin/env bash
MANDREL_HOME=/home/paulo/.jabba/jdk/mandrel@20.3.0

$MANDREL_HOME/bin/java \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+EnableJVMCI \
  --upgrade-module-path=$MANDREL_HOME/lib/truffle:$MANDREL_HOME/lib/jvmci \
  -jar \
  /home/paulo/Projects/reactiverse/es4x/examples/simple/node_modules/.bin/es4x-launcher.jar