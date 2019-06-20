#!/usr/bin/env bash

function react
{
    T_DIR=$(pwd)
    T_CURRENT=$(basename ${T_DIR})

    T_DOCKERIZE_BIN="REACT"

    T_DOCKERIZE_IMAGE=${REACT_IMAGE}
    T_DOCKERIZE_PORT_HOST=${REACT_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${REACT_PORT_CONTAINER}
    __run "yarn ${@}"
}
