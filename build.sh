#!/bin/sh


set -e

# Get the versions to build

# If they are passed as args
if [ $# -gt 0 ]; then
  buildDirs="$@"
else
  # else, get all the relevant dirs
  buildDirs="latest stable 18"
fi
echo $buildDirs

# Build each one of them
for target in $buildDirs; do
  docker build \
      --build-arg DOCKER_ENGINE_VERSION="$target" \
      --tag "$DOCKER_REPO:$target" \
      .
done
