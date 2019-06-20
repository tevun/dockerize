#!/usr/bin/env bash

function yarn
{
    T_DIR=$(pwd)
    T_CURRENT=$(basename ${T_DIR})

    T_DOCKERIZE_BIN="YARN"

    T_DOCKERIZE_IMAGE=${NODE_IMAGE}
    T_DOCKERIZE_PORT_HOST=${NODE_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${NODE_PORT_CONTAINER}
    __run "yarn ${@}"
}
