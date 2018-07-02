#!/bin/bash

USBDIR=/mnt/usbstorage
PLAYALLDIR=$USBDIR/playall
PLAYRANDOMDIR=$USBDIR/playrandom

filename=$USBDIR/playone.mp3

if [ -f "$filename" ]; then
  echo "Playing $filename"
  omxplayer "$filename"
fi

for f in $PLAYALLDIR*; do
  if [ -d ${f} ]; then
    for filename in $f/*.mp3; do
      echo "Playing $filename"
      omxplayer "$filename"
    done
  fi
done

for f in $PLAYRANDOMDIR*; do
  if [ -d ${f} ]; then
    filename=`ls $f/*.mp3 | shuf -n 1`
    echo "Playing $filename"
    omxplayer "$filename"
  fi
done
