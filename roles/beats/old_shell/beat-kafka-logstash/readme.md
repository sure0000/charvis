# 脚本及文件说明

> 本脚本及配置文件服务的日志收集架构为：filebeat->kafka->logstash->es

## filebeat
filebeat采用动态加载的方式，对不同的服务进行归类配置，filebeat.yml文件如下：
```yml
filebeat.config.inputs:
  enabled: true
  path: configs/*.yml
  reload.enabled: true
  reload.period: 10s


output.kafka:
   enbaled: true
   hosts: ["es1:9092","es2:9092","es3:9092"]
   topic: '%{[fields.log_topic]}'
   partition.round_robin:
     reachable_only: false
   required_acks: 1
   compression: gzip
   max_message_bytes: 1000000
```
当需要增加额外的日志监控源时，只需在configs文件夹下新建配置文件，归属于同一服务的日志源放在同一配置文件下，如下为主机es1上的kafka日志配置文件kafka.yml:
```yml
- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/server.log
  fields:
    "tag": "kafka-server-es1.log"
    "log_topic": "kafka"

- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/controller.log
  fields:
    "tag": "kafka-controller-es1.log"
    "log_topic": "kafka"

- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/state-change.log
  fields:
    "tag": "kafka-state-change-es1.log"
    "log_topic": "kafka"
```
同一服务的日志将发送到同一个topic中，使用tag进行区分。

## kafka
Kafka中无需额外设置，但可根据实际情况选择是否开启自动创建topic，若关闭了自动创建topic则需提前手动创建topic。

## logstash
logstash采用多管道、动态加载的方式，通过pipelines.yml文件来明确管道文件的位置，如下：
```yml
- pipeline.id: kafka
   pipeline.workers: 1
   pipeline.batch.size: 1
   path.config: "/root/logstash-6.3.2/config/conf/kafka_pipeline.conf"
```
管道文件的配置如下：
```
input{
    kafka {
        bootstrap_servers => "es1:9092,es2:9092,es3:9092"
        topics => ["kafka"]
        consumer_threads => 1
        decorate_events => true
        codec => "json"
        auto_offset_reset => "latest"
}

}

output{
         elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "kafka"
            user => elastic
            password => elastic
        }
}
```
## 执行脚本
> 脚本主要用于批量配置日志源，单个日志源的添加，不建议使用脚本。

*bash_create_filebeat_inpust.sh*<br>
该脚本用于在多主机生成同一服务的filebeat配置文件，特点：日志路径相同，主机名不同。需要依赖*filebeat_input_yml.template*文件（预先处理模版）与*hosts*文件（需要分发的主机列表），执行方式如下：
```bash
./bash_create_filebeat_inpust.sh kafka(service name)
```
*bash_create_pipeline.sh*
该脚本用于批量生成服务的pipeline配置，依赖文件*pipeline_path.template*（模版），*service*（服务列表），执行方式：
```bash
./bash_create_pipeline.sh
```
## doc
doc文件夹下为不同服务的配置模版