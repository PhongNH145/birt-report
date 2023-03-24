#!/bin/bash

java_opts_env_file=$1
source "${java_opts_env_file}"
ADDITIONAL_JAVA_OPTS="-DDB_HOST=${DB_HOST} -DDB_PORT=${DB_PORT} -DDB_NAME=${DB_NAME} -DDB_USER=${DB_USER} -DDB_PASSWORD=${DB_PASSWORD}"
shift
export JAVA_OPTS="$JAVA_OPTS $ADDITIONAL_JAVA_OPTS"
exec "$@"

exit 1
