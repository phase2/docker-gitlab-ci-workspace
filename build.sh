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
echo "Build List: ${buildDirs}"

BUILD_LIST=$buildDirs DOCKER_REPO=outrigger/gitlab-ci-workspace sh hooks/build
