#!/usr/bin/env bash

function __run()
{
    CONTAINER_NAME=${T_CURRENT}-${T_CHARGER_SERVICE}
    if [ "$(docker ps -q -f name=${CONTAINER_NAME})" ]; then
      echo "# docker:${CONTAINER_NAME} ~> ${@}"$'\n'"#"
      docker exec -it ${CONTAINER_NAME} ${@}
      return
    fi
    echo "# docker:global ~> ${@}"$'\n'"#"
    docker run -it --rm \
      -w ${T_CHARGER_VOLUME_ROOT} \
      -u "$(id -u)" \
      -p ${T_CHARGER_PORT_HOST}:${T_CHARGER_PORT_CONTAINER} \
      -v ${T_DIR}:${T_CHARGER_VOLUME_ROOT} \
      -v ${T_COMPOSER}:${T_CHARGER_USER_HOME}/.composer \
      -v ${T_CONFIG}:${T_CHARGER_USER_HOME}/.config \
      -v ${T_CACHE}:${T_CHARGER_USER_HOME}/.cache \
      -v ${T_LOCAL}:${T_CHARGER_USER_HOME}/.local \
      -v ${T_SSH}:${T_CHARGER_USER_HOME}/.ssh \
      ${T_CHARGER_IMAGE} ${@}
}
