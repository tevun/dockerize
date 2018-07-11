#!/usr/bin/env bash

T_BASE=$HOME/.cache/tevum

T_CONFIG=${T_BASE}/.config
T_CACHE=${T_BASE}/.cache
T_LOCAL=${T_BASE}/.local
T_SSH=$HOME/.ssh
T_COMPOSER=${T_BASE}/.composer

T_DIR=$HOME/.config/tevun
T_CURRENT=$(basename ${T_DIR})

mkdir -p ${T_CONFIG}
mkdir -p ${T_CACHE}
mkdir -p ${T_LOCAL}
mkdir -p ${T_COMPOSER}

T_DOCKERIZE=${T_DIR}/dockerize

source ${T_DOCKERIZE}/environment/images.ini
source ${T_DOCKERIZE}/environment/variables.ini

source ${T_DOCKERIZE}/bin/run.sh

for file in ${T_DOCKERIZE}/commands/*; do source ${file}; done
