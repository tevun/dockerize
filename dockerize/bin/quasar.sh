#!/usr/bin/env bash

function quasar
{
    T_DIR=$(pwd)
    T_CURRENT=$(basename ${T_DIR})

    T_DOCKERIZE_BIN="QUASAR"

    T_DOCKERIZE_IMAGE=${QUASAR_IMAGE}
    T_DOCKERIZE_PORT_HOST=${QUASAR_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${QUASAR_PORT_CONTAINER}
    if [[ ${@} = "build" ]];then
      T_DOCKERIZE_PORT_HOST=""
      T_DOCKERIZE_PORT_CONTAINER=""
    fi
    __run "quasar ${@}"
}

function __quasar
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="init dev build clean new mode info serve help -v"
    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
}

complete -F __quasar quasar
