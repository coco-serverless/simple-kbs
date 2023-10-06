#!/bin/bash

# This script populates the host's ./target directory that is mounted in the
# containers.

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-${(%):-%x}}" )" >/dev/null 2>&1 && pwd )"
PROJ_ROOT="${THIS_DIR}/.."

pushd ${PROJ_ROOT} >> /dev/null

docker run --rm -it \
    -w /usr/src/simple-kbs \
    -v $(pwd):/usr/src/simple-kbs \
    simple-kbs-server:latest \
    cargo build --release

popd >> /dev/null
