#!/usr/bin/env bash

function phpunit
{
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))

    if [[ ! -f ${T_CURRENT}/.dockerize.phpunit ]]; then
      return
    fi
    source ${T_CURRENT}/.dockerize.phpunit
}
