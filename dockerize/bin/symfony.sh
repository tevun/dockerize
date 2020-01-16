#!/usr/bin/env bash

function symfony
{
    T_DIR=$(pwd)
    T_CURRENT=$(basename ${T_DIR})

    T_DOCKERIZE_BIN="SYMFONY"

    T_DOCKERIZE_IMAGE=${SYMFONY_IMAGE}
    T_DOCKERIZE_SERVICE="app"
    T_DOCKERIZE_PORT_HOST=${SYMFONY_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${SYMFONY_PORT_CONTAINER}
    __run "php bin/console ${@}"
}
