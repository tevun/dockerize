#!/usr/bin/env bash

function __vue()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))
    T_CHARGER_IMAGE=${VUE_IMAGE}
    __run "vue ${@}"
}
