#!/bin/bash

set -o errexit
set -o nounset

HOSTNAME=$(hostname)

PROM_FILE=$TEXTFILE_COLLECTOR_DIR/btrfs.prom

TMP_FILE=$PROM_FILE.$$
[ -e $TMP_FILE ] && rm -f $TMP_FILE

if [[ -f /usr/bin/btrfs ]]; then

mv -f $TMP_FILE $PROM_FILE
fi


mv -f $TMP_FILE $PROM_FILE
