#!/bin/sh


set -e

# Get the versions to build

# If they are passed as args
if [ $# -gt 0 ]; then
  buildDirs="$@"
else
  # else, get all the relevant dirs
  buildDirs=$(find . -type d -name 'docker-*' | sed 's/^\.\///')
fi
echo $buildDirs

# Build each one of them
for version in $buildDirs; do
  pushd $version
  docker build -t outrigger/gitlab-ci-workspace:${version} .
  popd
done
