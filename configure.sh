#!/usr/bin/env bash

T_DIR=$(dirname $(readlink -f ${0}))
T_CONFIG=$HOME/.config/tevun

if [[ -h ${T_CONFIG} ]]; then
  rm ${T_CONFIG}
fi
ln -s ${T_DIR} ${T_CONFIG}

if [[ -f ${T_CONFIG}/.bashrc ]];then
  echo $'\n'"source ${T_CONFIG}/.bashrc" >> ~/.bashrc
fi
