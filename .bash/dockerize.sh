#!/usr/bin/env bash

T_BASE=$HOME/.cache/tevum

T_CONFIG=${T_BASE}/.config
T_CACHE=${T_BASE}/.cache
T_LOCAL=${T_BASE}/.local
T_SSH=$HOME/.ssh
T_COMPOSER=${T_BASE}/.composer

T_DIR=$(dirname $(readlink -f ${0}))
T_CURRENT=$(basename ${T_DIR})

mkdir -p ${T_CONFIG}
mkdir -p ${T_CACHE}
mkdir -p ${T_LOCAL}
mkdir -p ${T_COMPOSER}

source ${T_DIR}/.bash/conf/@variables.conf
source ${T_DIR}/.bash/conf/@images.conf

source ${T_DIR}/.bash/services/run.sh

source ${T_DIR}/.bash/services/php.sh
alias php='__php'

source ${T_DIR}/.bash/services/composer.sh
alias composer='__composer'

source ${T_DIR}/.bash/services/vue.sh
alias vue='__vue'

source ${T_DIR}/.bash/services/quasar.sh
alias quasar='__quasar'