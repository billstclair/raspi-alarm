#!/bin/bash

USBDIR=/mnt/usbstorage
PLAYALLDIR=$USBDIR/playall
PLAYRANDOMDIR=$USBDIR/playrandom

filename=$USBDIR/playone.mp3

if [ -f $filename ]; then
  echo "Playing $filename"
  omxplayer $filename
  exit 0
fi

echo "$filename does not exist."

if [ -d $PLAYALLDIR ]; then
  for filename in $PLAYALLDIR/*.mp3; do
    echo "Playing $filename"
    omxplayer $filename
  done
  exit 0
fi

echo "$PLAYALLDIR does not exist."

if [ -d $PLAYRANDOMDIR ]; then
  filename=`ls $PLAYRANDOMDIR/*.mp3 | shuf -n 1`
  echo "Playing $filename"
  omxplayer $filename
  exit 0
fi

echo "$PLAYRANDOMDIR does not exist."
