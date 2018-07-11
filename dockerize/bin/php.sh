#!/usr/bin/env bash

function php()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))
    T_DOCKERIZE_IMAGE=${PHP_IMAGE}
    T_DOCKERIZE_SERVICE="app"
    T_DOCKERIZE_PORT_HOST=${PHP_PORT_HOST}
    T_DOCKERIZE_PORT_CONTAINER=${PHP_PORT_CONTAINER}
    if [ "${1}" == "serve" ]; then
      T_DOCKERIZE_PORT_HOST=${2}
      T_DOCKERIZE_PORT_CONTAINER=${2}
      __run "php -S 0.0.0.0:${T_DOCKERIZE_PORT_CONTAINER} -t ${T_DOCKERIZE_VOLUME_ROOT}"
      return
    fi
    __run "php ${@}"
}
