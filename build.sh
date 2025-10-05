#!/bin/bash

set -euo pipefail

IMAGE=glove80-zmk-config-docker
BRANCH="${1:-main}"

open -g -a Docker
docker build -q -t "$IMAGE" . 2>&1 # | grep "glove80.keymap:"
docker run --rm -v "$PWD:/config" -e UID="$(id -u)" -e GID="$(id -g)" -e BRANCH="$BRANCH" "$IMAGE" 2>&1 | grep "glove80.keymap:"
