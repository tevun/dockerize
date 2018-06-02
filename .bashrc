#!/usr/bin/env bash

T_DIR=$HOME/.config/tevun

if [[ -f ${T_DIR}/.bash/dc.sh ]];then
  source ${T_DIR}/.bash/dc.sh
  . ${T_DIR}/.bash/dc-completion.sh
fi

if [[ -f  ${T_DIR}/.bash/dockerize.sh ]];then
  source ${T_DIR}/.bash/dockerize.sh
fi
