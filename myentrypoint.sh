#!/bin/bash
#set -e

NUM=`echo $HOSTNAME |sed -e 's/.*-\([0-9]\{1,\}\)$/\1/'`
NODE_VAR="HAPROXY_$NUM_ENV_DOCKERCLOUD_CONTAINER_HOSTNAME"
PORT_VAR="HAPROXY_$NUM_ENV_STATS_PORT"
export HAPROXY_HOST=${!NODE_VAR}
export HAPROXY_PORT=${!PORT_VAR}

dockerize -template /templates/haproxy.yaml.tmpl:/conf.d/haproxy.yaml

source /entrypoint.sh