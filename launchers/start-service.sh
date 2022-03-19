#!/bin/bash

cd "$SNAP_COMMON"/unifi
umask 027
"$SNAP"/usr/bin/jsvc -debug -nodetach \
    -home "$SNAP"/usr/lib/jvm/java-8-openjdk-arm64 \
    -cp "$SNAP"/usr/share/java/commons-daemon.jar:"$SNAP"/usr/lib/unifi/lib/ace.jar \
    -pidfile "$SNAP_COMMON"/jsvc.pid \
    -outfile SYSLOG \
    -errfile SYSLOG \
    -user root \
    -umask 027 \
    -cwd "$SNAP_COMMON"/unifi \
    -Dunifi.datadir="$SNAP_COMMON"/unifi/data \
    -Dunifi.logdir="$SNAP_COMMON"/unifi/logs \
    -Dunifi.rundir="$SNAP_COMMON"/unifi/run \
    -Dunifi.core.enabled=false \
    -Djava.awt.headless=true \
    -Dfile.encoding=UTF-8 \
    com.ubnt.ace.Launcher \
    start

