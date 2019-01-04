# HDFS日志收集配置

## filebeat input

hadoop[1-16]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-DATANODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-DATANODE-xyc.log.out"
```

cloudera[1]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out"
```

cloudera[2-3]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-NAMENODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-NAMENODE-xyc.log.out"

- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-FAILOVERCONTROLLER-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-FAILOVERCONTROLLER-xyc.log.out"

- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out"
```

## logstash output
hadoop[1-16]
```
if [fields][tag]=="hadoop-cmf-hdfs-DATANODE-xyc.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-hdfs-datanode-xyc"
            user => elastic
            password => elastic
        }
    }
```

cloudera1
```
if [fields][tag]=="hadoop-cmf-hdfs-JOURNALNODE-cloudera1.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-hdfs-journalnode-cloudera1"
            user => elastic
            password => elastic
        }
    }
```
cloudera[2-3]
```
if [fields][tag]=="hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-hdfs-journalnode-xyc"
            user => elastic
            password => elastic
        }
    }

if [fields][tag]=="hadoop-cmf-hdfs-FAILOVERCONTROLLER-xyc.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-hdfs-failovercontroller-xyc"
            user => elastic
            password => elastic
        }
    }

if [fields][tag]=="hadoop-cmf-hdfs-NAMENODE-xyc.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-hdfs-NAMENODE-xyc"
            user => elastic
            password => elastic
        }
    }
```

