#!/bin/bash

#set -e
#java_opts_env_file=$1
#cat "$java_opts_env_file" >> out-data.txt
echo "hey bro ${@}"
shift 3
exec "$@"
#exec "$@"
#case "$" in
#  catalina.sh)
#
#    exec catalina.sh "$@"
#  *)
#    exec "$@"
#esac

#exit 1