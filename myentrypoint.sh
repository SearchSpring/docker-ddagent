#!/bin/bash
#set -e

export NUM=`echo $HOSTNAME |sed -e 's/.*-\([0-9]\{1,\}\)$/\1/'`
export NODE_VAR="HAPROXY_${NUM}_ENV_DOCKERCLOUD_CONTAINER_HOSTNAME"
export PORT_VAR="HAPROXY_${NUM}_ENV_STATS_PORT"
export HAPROXY_HOST=${!NODE_VAR}
export HAPROXY_PORT=${!PORT_VAR}

dockerize -template /templates/haproxy.yaml.tmpl:/conf.d/haproxy.yaml

source /entrypoint.sh