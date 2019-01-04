#!/bin/bash
service_name=$1
for hostname in $(cat hosts)
do
  cp filebeat_input_yml.template $(pwd)/filebeat_input_yml/${service_name}".yml"
  sed -i "s/xyc/${hostname}/g" $(pwd)/filebeat_input_yml/${service_name}".yml"
  scp $(pwd)/filebeat_input_yml/${service_name}".yml" ${hostname}:/etc/filebeat/configs/
  echo ${hostname}
done