#!/bin/bash
set -o xtrace
JDK_DIR=`tar ft $1 | head -n 1 | sed 's/.$//'`
tar xf $1
sudo mkdir -p /usr/list/jvm
sudo mv $JDK_DIR /usr/lib/jvm

JAVA_COMMANDS="java
javac
jar
jps
jmc
jstat
jstack"

for COMMAND in $JAVA_COMMANDS; do
  sudo update-alternatives --install "/usr/bin/$COMMAND" $COMMAND "/usr/lib/jvm/$JDK_DIR/bin/$COMMAND" 1
done
