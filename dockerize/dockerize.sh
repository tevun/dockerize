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
T_DOCKERIZE_BIN=""

source ${T_DOCKERIZE}/environment/images.ini
source ${T_DOCKERIZE}/environment/variables.ini

# Num  Colour    #define         R G B
# 0    black     COLOR_BLACK     0,0,0
# 1    red       COLOR_RED       1,0,0
# 2    green     COLOR_GREEN     0,1,0
# 3    yellow    COLOR_YELLOW    1,1,0
# 4    blue      COLOR_BLUE      0,0,1
# 5    magenta   COLOR_MAGENTA   1,0,1
# 6    cyan      COLOR_CYAN      0,1,1
# 7    white     COLOR_WHITE     1,1,1
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
reset=`tput sgr0`

source ${T_DOCKERIZE}/dockerize-run.sh

for file in ${T_DOCKERIZE}/bin/*.sh; do source ${file}; done

for file in ${T_DOCKERIZE}/helper/*.sh; do source ${file}; done
