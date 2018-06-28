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

T_CONF=${T_DIR}/.config/conf
cp ${T_CONF}/images.ini.sample ${T_CONF}/images.ini
cp ${T_CONF}/variables.ini.sample ${T_CONF}/variables.ini

echo "Configuração realizada com sucesso. Abra uma nova janela do terminal e explore os novos serviços"
