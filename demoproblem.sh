#!/bin/bash

echo "Run this on the host"
rm -rf subdir/subsub
docker-compose up -d
sleep 2

set -x
docker exec test bash -c 'mkdir -p subdir/subsub && sleep 1 && touch subdir/subsub/subsub.txt'
docker exec test bash -c 'sleep 1 && ls -ld subdir subdir/subsub subdir/subsub/subsub.txt'
docker-compose down
rm -rf subdir/subsub