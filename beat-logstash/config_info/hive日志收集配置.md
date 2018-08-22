# hive日志收集配置
## filebeat input
cloudera2
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hive/hadoop-cmf-hive-HIVESERVER2-cloudera2.log.out
  fields:
    "tag": "hadoop-cmf-hive-HIVESERVER2-cloudera2.log.out"
```
cloudera3
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hive/hadoop-cmf-hive-HIVEMETASTORE-cloudera3.log.out
  fields:
    "tag": "hadoop-cmf-hive-HIVEMETASTORE-cloudera3.log.out"
```

## logstash output
cloudera2
```
if [fields][tag]=="hadoop-cmf-hive-HIVESERVER2-cloudera2.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-hive-hiveserver2-cloudera2"
            user => elastic
            password => elastic
        }
    }
```

cloudera3
```
if [fields][tag]=="hadoop-cmf-hive-HIVEMETASTORE-cloudera3.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-hive-hivemetastore-cloudera3"
            user => elastic
            password => elastic
        }
    }
```