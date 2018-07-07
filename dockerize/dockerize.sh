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

cd ${T_DOCKERIZE}

source ./environment/images.ini
source ./environment/variables.ini

source ./bin/run.sh

source ./services/php.sh
source ./services/composer.sh
source ./services/vue.sh
source ./services/quasar.sh
