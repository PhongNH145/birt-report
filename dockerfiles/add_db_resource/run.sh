#!/bin/bash

server_conf="$CATALINA_HOME/conf/server.xml"
context_conf="$CATALINA_HOME/conf/context.xml"
web_conf="$CATALINA_HOME/conf/web.xml"

function insert_more_content {
  regex_content=$1
  addition_file=$2
  origin_file=$3
  line_num=$(grep -n $regex_content "$origin_file" | cut -d: -f1)
  ((line_num = line_num - 1))
  sed -i "${line_num}r ${addition_file}" $origin_file
}

insert_more_content '</GlobalNamingResources>' $(readlink -f "./server.xml") $server_conf
insert_more_content '</Context>' $(readlink -f "./context.xml") $context_conf
insert_more_content '</web-app>' $(readlink -f "./web.xml") $web_conf
