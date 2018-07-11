#!/usr/bin/env bash

function vue()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))

    T_DOCKERIZE_BIN="VUE"

    T_DOCKERIZE_IMAGE=${VUE_IMAGE}
    T_DOCKERIZE_PORT_HOST=${VUE_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${VUE_PORT_CONTAINER}
    __run "vue ${@}"
}
