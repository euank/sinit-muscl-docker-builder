#!/bin/sh
set -e

if [ -n "$1" ]; then
  git fetch origin $1:buildme
  git checkout buildme
  make clean && make
fi

cp sinit /out/sinit
