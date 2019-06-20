#!/bin/bash
# 执行批量部署 filebeat 的 playbook，相关变量如下：
# @role_name    角色名称
# @task_name    任务名
# @hosts_path    hosts 文件路径 
# @host_group    选择的主机组


role_name="beats"              
task_name="deploy_filebeat"    
hosts_path="../../production"   
host_group="sink_connect_metric"           # 最经常修改

# ansible playbook 执行命令
ansible-playbook -i ${hosts_path} --limit ${host_group} ../../site.yml -e "action_task=${task_name}" -e "role_name=${role_name}"