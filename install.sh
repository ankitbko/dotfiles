#!/bin/bash

DEFAULT_CONFIG_PREFIX="default"
CONFIG_SUFFIX=".conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

# If no arguments provided, use 'force misc' as default
# To run only default config: ./install.sh default-only
if [ $# -eq 0 ]; then
    set -- force misc
elif [ "$1" = "default-only" ]; then
    set --
fi

for conf in ${DEFAULT_CONFIG_PREFIX} ${@}; do
    "${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${conf}${CONFIG_SUFFIX}"
done