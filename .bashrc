#!/usr/bin/env bash

T_DIR=$HOME/.config/tevun

if [[ -f ${T_DIR}/.config/dc.sh ]];then
  source ${T_DIR}/.config/dc.sh
  . ${T_DIR}/.config/dc-completion.sh
fi

if [[ -f  ${T_DIR}/.config/dockerize.sh ]];then
  source ${T_DIR}/.config/dockerize.sh
fi
