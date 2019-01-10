#!/bin/bash
if [ $# -ne 1 ]
then
    echo "please check the Useage: bash deploy_filebeat.sh hostname"
    exit
fi 
ansible-playbook -i production/hosts --limit $1 site.yml -e "action=deploy_filebeat" -e "group_server=filebeat" -e "role_name=beats"