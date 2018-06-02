#!/usr/bin/env bash

function __quasar()
{
    T_DIR=$(dirname $(readlink -f ${0}))
    T_CURRENT=$(basename $(dirname $(readlink -f ${0})))
    T_CHARGER_IMAGE=${QUASAR_IMAGE}
    __run "quasar ${@}"
}
