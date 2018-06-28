#!/usr/bin/env bash

T_DIR=$HOME/.config/tevun
T_CONFIG=${T_DIR}/.config

if [[ -f ${T_CONFIG}/dc.sh ]];then
  source ${T_CONFIG}/dc.sh
  . ${T_CONFIG}/dc-completion.sh
fi

if [[ -f  ${T_CONFIG}/dockerize.sh ]];then
  source ${T_CONFIG}/dockerize.sh
fi
