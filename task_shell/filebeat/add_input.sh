#!/bin/bash
# 批量添加 filebeat input 配置文件到不同主机
# @hosts        主机文件
# @host_group   主机分组
# @role_name    执行角色名
# @task_name    执行任务名称

hosts="../../production"
host_group="sink_connect_metric"
role_name="beats"
task_name="add_input"

# 执行脚本
ansible-playbook -i ${hosts} --limit ${host_group} ../../site.yml -e "role_name=${role_name}" -e "action_task=${task_name}"