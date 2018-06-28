#!/usr/bin/env bash

function dc() {
    if [[ $@ == "all" ]]; then
        docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"
        return
    fi

    if [[ $@ == "truncate" ]]; then
        docker rm $(docker ps -a -q)
        return
    fi

    if [[ $@ == "off" ]]; then
        docker stop $(docker ps -a -q)
        return
    fi

    if [[ $@ == "prune" ]]; then
        docker ps --filter "status=exited" | grep "weeks ago" | awk "{print $1}" | xargs --no-run-if-empty docker rm
        return
    fi

    if [[ $(echo ${@} | cut -c1-3) == "run" ]]; then
        # docker exec $(basename $(dirname $(readlink -f ${0})))-app $(echo ${@} | cut -c4-)
        SERVICE=$(echo ${@} | cut -d' ' -f 2)
        START="run ${SERVICE}"
        LENGTH=$(expr ${#START} + 2)
        CONTAINER_NAME=$(basename $(dirname $(readlink -f ${0})))-${SERVICE}
        echo "[ $(docker ps -q -f name=${CONTAINER_NAME}) ]"
        if [ "$(docker ps -q -f name=${CONTAINER_NAME})" ]; then
           docker exec -it ${CONTAINER_NAME} $(echo ${@} | cut -c${LENGTH}-)
          return
        fi
        return
    fi

    docker-compose "$@"
}
