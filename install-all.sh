#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

/bin/bash ${BASEDIR}/install.sh force misc
