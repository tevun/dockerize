#!/usr/bin/env bash

function composer
{
    T_DIR=$(pwd)
    T_CURRENT=$(basename ${T_DIR})

    T_DOCKERIZE_BIN="COMPOSER"

    T_DOCKERIZE_IMAGE=${COMPOSER_IMAGE}
    T_DOCKERIZE_SERVICE="app"
    T_DOCKERIZE_PORT_HOST=${COMPOSER_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${COMPOSER_PORT_CONTAINER}
    __run "composer ${@}"
}
