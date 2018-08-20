#!/usr/bin/env bash

function phpunit
{
    T_CURRENT=$(dirname $(readlink -f ${0}))
    if [[ ! -f ${T_CURRENT}/.dockerize.phpunit ]]; then
      echo "${red}# ${T_CURRENT} don't have a '.dockerize.phpunit' file ${reset}"
      return
    fi
    echo "${green}# Runing your '.dockerize.phpunit' file ${reset}"
    ${T_CURRENT}/.dockerize.phpunit ${@}
}
