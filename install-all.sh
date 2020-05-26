#!/bin/bash

SCRIPT=$(readlink -f "$0")
BASEDIR=$(dirname "$SCRIPT")

sudo /bin/bash ${BASEDIR}/install.sh force misc
