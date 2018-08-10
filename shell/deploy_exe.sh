#!/bin/sh
#检查参数是否符合要求
	if [ $# -ne 1 ]
	then
		echo please check the Useage: ./deploy_exe.sh your_filebeat_config_filename
		exit
	fi
	#引入公用函数
	source $(pwd)/deploy_util.sh
	#logstash配置文件路径
	FILEPATH="/root/logstash-6.3.2/config/"
	#自动化脚本及配置文件目录
	CONFIG_DIR_PATH=$(pwd)
	#增加管道路径的模版文件
	PIPELINE_PATH_TEMPLATE="/pipeline_path.template"
	#实际管道配置文件模版
	PIPELINE_WHOLE_TEMPLATE="/pipeline_whole.template"
	#插入已有管道配置文件的模版
	PIPELINE_PART_TEMPLATE="/pipeline_part.template"
	#filebeat input配置文件模版
	FILEBEAT_CONFIG_TEMPLATE="/"$1
	#主机列表路径
	HOSTS=${CONFIG_DIR_PATH}"/hosts"
	PIPELINE="_pipeline.conf"

	#检查本机是否安装logstash
	check_if_install_logstash $FILEPATH

for hostname in `cat HOSTS`
do
	#检查目的主机是否安装filebeat
	check_filebeat $hostname
	#构建logstash配置文件名
	
	filename=$hostname$PIPELINE
	#配置logstash output
	#判断主机配置文件是否存在
	if [ ! -f $FILEPATH$filename ]
	then 
		#不存在则创建一份
		echo $FILEPATH$filename "not exist"
		PORT=$[PORT+1]
		create_new_logstash_config $CONFIG_DIR_PATH $PIPELINE_WHOLE_TEMPLATE $FILEPATH $filename $PIPELINE_PATH_TEMPLATE $hostname
	else
		#存在则在已有文件末尾添加
		echo $FILEPATH$filename "already exist"
		insert_into_old_logstash_config $FILEPATH $filename $CONFIG_DIR_PATH $PIPELINE_PART_TEMPLATE $hostname
	fi

	#配置filebeat input
	create_filebeat_config $CONFIG_DIR_PATH $FILEBEAT_CONFIG_TEMPLATE $hostname
done
