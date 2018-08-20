#!/usr/bin/env bash

function bash
{
    T_DIR=$(dirname $(readlink -f ${0}))
    if [[ ! -f ${T_DIR}/.dockerize ]]; then
      echo "${red}There is no dockerize file in this dir ${reset}"
      return
    fi
    source ${T_DIR}/.dockerize
    DOCKERIZE_BIN="DOCKERIZE_BASH"
    CONTAINER_NAME=${!DOCKERIZE_BIN}

    if [[ ! ${CONTAINER_NAME} ]]; then
      echo "${red}There is 'DOCKERIZE_BASH' entry in your dockerize file ${reset}"
      return
    fi

    if [[ ! $(docker ps -q -f name=${CONTAINER_NAME}) ]]; then
      echo "${red}There is no container with name '${CONTAINER_NAME}' running ${reset}"
      return
    fi

    docker exec -it ${CONTAINER_NAME} bash
}
