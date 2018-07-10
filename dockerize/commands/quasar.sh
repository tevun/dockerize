#!/usr/bin/env bash

function quasar()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))
    T_DOCKERIZE_IMAGE=${QUASAR_IMAGE}
    T_DOCKERIZE_PORT_HOST=${QUASAR_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${QUASAR_PORT_CONTAINER}
    __run "quasar ${@}"
}
