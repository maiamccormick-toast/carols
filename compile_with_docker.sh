#! /usr/bin/env bash

IMAGE_NAME=lilypond

case "$1" in
    -h|--help)    echo "User help"; exit 0;;
    -b|--build)   FORCE_BUILD=1; shift;;
esac

docker image inspect $IMAGE_NAME > /dev/null 2>&1
RESULT=$?
set -e
if [[ $RESULT -ne 0 || $FORCE_BUILD ]]; then
  echo "Image $IMAGE_NAME not found / build requested, building..."
  docker build . -t $IMAGE_NAME
fi

docker run --rm -v $(pwd)/carols:/app -w /app lilypond:latest lilypond $1.ly && mv carols/$1.pdf build/$1.pdf
