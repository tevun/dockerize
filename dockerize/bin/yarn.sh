#!/usr/bin/env bash

function yarn
{
    T_0=${0//-}
    T_DIR=$(dirname $(readlink -f ${T_0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${T_0})))

    T_DOCKERIZE_BIN="YARN"

    T_DOCKERIZE_IMAGE=${NODE_IMAGE}
    T_DOCKERIZE_PORT_HOST=${NODE_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${NODE_PORT_CONTAINER}
    __run "yarn ${@}"
}
