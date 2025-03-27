#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "${SCRIPT_DIR}/.env"
docker run --hostname=${HOSTNAME} --rm -it "${IMAGE_NAME}"
