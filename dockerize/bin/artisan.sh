#!/usr/bin/env bash

function artisan
{
    T_DIR=$(pwd)
    T_CURRENT=$(basename ${T_DIR})

    T_DOCKERIZE_BIN="ARTISAN"

    T_DOCKERIZE_IMAGE=${ARTISAN_IMAGE}
    T_DOCKERIZE_SERVICE="app"
    T_DOCKERIZE_PORT_HOST=${ARTISAN_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${ARTISAN_PORT_CONTAINER}
    __run "php artisan ${@}"
}
