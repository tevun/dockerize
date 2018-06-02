#!/usr/bin/env bash

function __composer()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))
    T_CHARGER_IMAGE=${PHP_IMAGE}
    __run "composer ${@}"
}
