#!/bin/bash
# 添加 logstash pipeline
# @role_name    角色名称
# @task_name    任务名
# @hosts_path    hosts 文件路径 
# @host_group    选择的主机组

hosts="../../production"
host_group="logstash"
role_name="logstash"
task_name="add_pipeline"

# 执行脚本
ansible-playbook -i ${hosts} ../../site.yml --limit ${host_group} -e "role_name=${role_name}" -e "action_task=${task_name}"