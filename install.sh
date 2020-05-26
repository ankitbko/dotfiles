#!/bin/bash

set -xv

if [ -z "$BASH_VERSION" ]
then
    exec bash "$0" "$@"
fi

DEFAULT_CONFIG_PREFIX="default"
CONFIG_SUFFIX=".conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

for conf in ${DEFAULT_CONFIG_PREFIX} ${@}; do
    "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${conf}${CONFIG_SUFFIX}"
done