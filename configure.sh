#!/usr/bin/env bash

T_DIR=$(dirname $(readlink -f ${0}))
T_CONFIG=$HOME/.config/tevun

if [[ ! -d $HOME/.config ]]; then
  mkdir -p $HOME/.config
fi

if [[ -h ${T_CONFIG} ]]; then
  rm ${T_CONFIG}
fi

ln -s ${T_DIR} ${T_CONFIG}

SOURCE="source ${T_CONFIG}/.bashrc"
if [[ -f ${T_CONFIG}/.bashrc ]];then
  echo $'\n'"${SOURCE}" >> ~/.bashrc
fi

T_CONF=${T_DIR}/dockerize/environment
cp ${T_CONF}/images.ini.sample ${T_CONF}/images.ini
cp ${T_CONF}/variables.ini.sample ${T_CONF}/variables.ini

echo "Configuração realizada com sucesso. Abra uma nova janela do terminal e explore os novos serviços"
