#!/bin/bash
if [ $# -ne 3 ]
then 
    echo "please check the Useage: bash add_pipeline.sh hostname pipeline_conf_name pipeline_yml"
    exit
fi
echo $1 $2 $3
ansible-playbook -i production/hosts site.yml --limit $1 -e "pipeline_conf_name=$2" -e "pipeline_yml=$3" -e "group_server=logstash" -e "action=add_pipeline" -e "rolename=logstash"