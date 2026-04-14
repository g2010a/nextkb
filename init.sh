#!/usr/bin/env bash
# Initialize qmd collections
#
export PATH=${HOME}/.bun/bin/:${HOME}

qmd collection list | grep "qmd://3-aikb" \
|| qmd collection add "3-aikb" --name "aikb"
