#!/usr/bin/env bash

function composer()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))
    T_CHARGER_IMAGE=${COMPOSER_IMAGE}
    T_CHARGER_SERVICE="app"
    T_CHARGER_PORT_HOST=${COMPOSER_PORT_HOST}
    T_CHARGER_PORT_CONTAINER=${COMPOSER_PORT_CONTAINER}
    __run "composer ${@}"
}
