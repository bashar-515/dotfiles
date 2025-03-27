#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "${SCRIPT_DIR}/.env"
docker build --no-cache --build-arg USERNAME=$USERNAME -t "${IMAGE_NAME}" $SCRIPT_DIR
