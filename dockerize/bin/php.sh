#!/usr/bin/env bash

function php
{
    T_0=${0//-}
    T_DIR=$(dirname $(readlink -f ${T_0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${T_0})))

    T_DOCKERIZE_BIN="PHP"

    T_DOCKERIZE_IMAGE=${PHP_IMAGE}
    T_DOCKERIZE_SERVICE="app"
    T_DOCKERIZE_PORT_HOST=${PHP_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${PHP_PORT_CONTAINER}
    if [ "${1}" == "serve" ]; then
      PHP_PORT="80"
      if [ "${2}" ]; then
        PHP_PORT=${2}
      fi
      T_DOCKERIZE_PORT_HOST=${PHP_PORT}
      T_DOCKERIZE_PORT_CONTAINER=${PHP_PORT}
      PHP_PARAMETERS="-t ${T_DOCKERIZE_VOLUME_ROOT}"
      if [ "${3}" ]; then
        PHP_PARAMETERS=${3}
      fi
      __run "php -S 0.0.0.0:${T_DOCKERIZE_PORT_CONTAINER} ${PHP_PARAMETERS}"
      return
    fi
    __run "php ${@}"
}

function __php
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="serve -v"

    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
}

complete -F __php php
