#!/bin/bash
#set -e


export NUM=`echo $HOSTNAME |sed -e 's/.*-\([0-9]\{1,\}\)$/\1/'`
export NODE_VAR="ELASTIC_${NUM}_ENV_DOCKERCLOUD_CONTAINER_HOSTNAME"
export PORT_VAR="ELASTIC_${NUM}_ENV_STATS_PORT"
export ELASTIC_HOST=${!NODE_VAR}
export ELASTIC_PORT=${!PORT_VAR}

dockerize -template /templates/elastic.yaml.tmpl:/conf.d/elastic.yaml

source /entrypoint.sh