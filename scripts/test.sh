#!/bin/bash
set -euxo pipefail

# set nocasematch option
shopt -s nocasematch

# Declare an array (of type string).
declare XTRA_OPT=""

if [[ $OSTYPE =~ ^msys|^WIN ]]; then
    if [[ $* == *--ci* ]]; then
      XTRA_OPT="--count 5"
    fi
fi

if [[ $* == *--ci* ]]; then
  shift
fi

poetry run pytest -s -n auto $XTRA_OPT
./scripts/lint.sh
