#!/usr/bin/env bash

function composer()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))

    T_DOCKERIZE_BIN="PHP"

    T_DOCKERIZE_IMAGE=${COMPOSER_IMAGE}
    T_DOCKERIZE_SERVICE="app"
    T_DOCKERIZE_PORT_HOST=${COMPOSER_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${COMPOSER_PORT_CONTAINER}
    __run "composer ${@}"
}
