#!/usr/bin/env bash

function __run()
{
    __env

    COMMAND=${@}
    if [[ ${COMMAND} = *"bash"* ]];then
      T_DOCKERIZE_PORT_HOST=""
      T_DOCKERIZE_PORT_CONTAINER=""
      COMMAND="bash"
    fi

    if [[ ! ${CONTAINER_NAME} ]]; then
      CONTAINER_NAME=${T_CURRENT}-${T_DOCKERIZE_SERVICE}
    fi

    if [[ $(docker ps -q -f name=${CONTAINER_NAME}) ]]; then
      if [[ ! -z ${T_DOCKERIZE_DEBUG} ]]; then
        T_DOCKERIZE_IMAGE=$(docker ps -f name=${CONTAINER_NAME} --format "{{.Image}}")
        echo "${green}# ${CONTAINER_NAME}@${T_DOCKERIZE_IMAGE} [local] ~> ${@}${reset}"
      fi

      docker exec -it ${CONTAINER_NAME} ${COMMAND}
      CONTAINER_NAME=""
      return
    fi

    if [[ ! -z ${T_DOCKERIZE_DEBUG} ]]; then
      echo "${yellow}# ${T_DOCKERIZE_IMAGE} [global] ~> ${@} ${reset}"
    fi

    PORT=""
    if [[ ${T_DOCKERIZE_PORT_HOST} && ${T_DOCKERIZE_PORT_CONTAINER} ]];then
      PORT="-p ${T_DOCKERIZE_PORT_HOST}:${T_DOCKERIZE_PORT_CONTAINER}"
    fi

    # --name ${CONTAINER_NAME} \
    docker run -it \
      ${PORT} \
      --rm \
      -w ${T_DOCKERIZE_VOLUME_ROOT} \
      -u "$(id -u)" \
      -v ${T_DIR}:${T_DOCKERIZE_VOLUME_ROOT} \
      -v ${T_COMPOSER}:${T_DOCKERIZE_USER_HOME}/.composer \
      -v ${T_CONFIG}:${T_DOCKERIZE_USER_HOME}/.config \
      -v ${T_CACHE}:${T_DOCKERIZE_USER_HOME}/.cache \
      -v ${T_LOCAL}:${T_DOCKERIZE_USER_HOME}/.local \
      -v ${T_SSH}:${T_DOCKERIZE_USER_HOME}/.ssh \
      ${T_DOCKERIZE_IMAGE} ${COMMAND}
}

function __env
{
    DOCKERIZE_ENV=$(dirname $(readlink -f ${0}))
    if [[ ! -f ${DOCKERIZE_ENV}/.dockerize ]]; then
      return
    fi
    source ${DOCKERIZE_ENV}/.dockerize
    DOCKERIZE_BIN="DOCKERIZE_${T_DOCKERIZE_BIN}"
    CONTAINER_NAME=${!DOCKERIZE_BIN}
}
