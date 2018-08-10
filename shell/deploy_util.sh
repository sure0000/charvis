#!/bin/sh
	#当前已使用最大端口号
	PORT_FILE=${CONFIG_DIR_PATH}"/port"
	PORT=$(cat "$PORT_FILE")

check_if_exist_hosts(){
	hosts=$1
	if [ ! -f $hosts ]
	then 
		echo please create your hosts file
	else
		if cat $hosts | grep "input" > /dev/null
		then 
			

}

check_if_install_logstash(){
	filepath=$1
	if [ ! -f ${filepath}"pipelins.yml" ]
	then
		echo please install the logstash-6.3.2 in the dir /root/
		exit
	else
		echo logstash has installed
	fi
}

check_if_install_filebeat(){
	hostname=$1
	ssh -t $hostname "if [ ! -f /etc/filebeat/filebeat.yml ];
	then 
		cd /root/;
		curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.3.2-x86_64.rpm;
		rpm -ivh filebeat-6.3.2-x86_64.rpm;
		mkdir /etc/filebeat/configs;
		filebeat -e -c /etc/filebeat/filebeat.yml -d 'publish' 2>&1 >filebeat.log &;
	fi;
	scp root@cloudera1:/etc/filebeat/filebeat.yml root@${hostname}:/etc/filebeat/;
	"
}



create_new_logstash_config(){
	port=$[port+1]
	config_dir_path=$1
	pipeline_whole_template=$2
	filepath=$3
	filename=$4
	pipeline_path_template=$5
	hostname=$6

	#拷贝模版配置文件到指定目录
	cp $config_dir_path$pipeline_whole_template $filepath$filename
	#修改pipeline模版文件端口与主机名
	sed -i "s/5043/${port}/g" $filepath$filename
	sed -i "s/xyc/${hostname}/g" $filepath$filename
	#修改pipeline路径模版文件
	sed -i "s/xyc/${hostname}/g" $config_dir_path$pipeline_path_template
	sed -i "1 r $config_dir_path$pipeline_path_template" ${filepath}"pipelines.yml"
	#将修改文件还原供下次使用
	sed -i "s/${hostname}/xyc/g" $config_dir_path$pipeline_path_template
	echo ${filepath}"pipelines.yml"
	#输出当前最大端口号
	echo $PORT > port
}

insert_into_old_logstash_config(){
	filepath=$1
	filename=$2
	config_dir_path=$3
	pipeline_part_template=$4
	hostname=$5

	cloumn=$(cat $filepath$filename | wc -l)
	number=$[cloumn-1]
	#在倒数第二行插入配置
	sed -i "s/xyc/${hostname}/g" $config_dir_path$pipeline_part_template
	sed -i "$number r $config_dir_path$pipeline_part_template" $filepath$filename
}

create_filebeat_config(){
	config_dir_path=$1
	filebeat_config_template=$2
	hostname=$3
	#配置filebeat input
	#拷贝input模版文件到目的主机
	scp $config_dir_path$filebeat_config_template ${hostname}:/etc/filebeat/configs/
	#修改模板文件，端口号和主机标示
	ssh -t ${hostname} sed -i "s/xyc/${hostname}/g" /etc/filebeat/configs${filebeat_config_template}
	if [ ${hostname}!="es1" ]
	then
		ssh -t ${hostname} sed -i "s/5043/${port}/g" /etc/filebeat/filebeat.yml
	fi
	echo ${hostname}
}
