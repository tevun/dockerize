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

source ${T_DIR}/.bash/conf/@variables.conf
source ${T_DIR}/.bash/conf/@images.conf

source ${T_DIR}/.bash/services/@run.sh

source ${T_DIR}/.bash/services/php.sh

source ${T_DIR}/.bash/services/composer.sh

source ${T_DIR}/.bash/services/vue.sh

source ${T_DIR}/.bash/services/quasar.sh
