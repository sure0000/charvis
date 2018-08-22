# Yarn日志收集配置

## filebeat input
cloudera2
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-mapreduce/hadoop-cmf-yarn-JOBHISTORY-cloudera2.log.out
  fields:
    "tag": "hadoop-cmf-yarn-JOBHISTORY-cloudera2.log.out"

- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-yarn/hadoop-cmf-yarn-RESOURCEMANAGER-cloudera2.log.out
  fields:
    "tag": "hadoop-cmf-yarn-RESOURCEMANAGER-cloudera2.log.out"
```

cloudera3
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-yarn/hadoop-cmf-yarn-RESOURCEMANAGER-cloudera3.log.out
  fields:
    "tag": "hadoop-cmf-yarn-RESOURCEMANAGER-cloudera3.log.out"
```

hadoop[1-10][13-16]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-yarn/hadoop-cmf-yarn-NODEMANAGER-xyc.log.out
  fields:
    "tag": "hadoop-cmf-yarn-NODEMANAGER-xyc.log.out"
```

## logstash output
cloudera2
```
if [fields][tag]=="hadoop-cmf-yarn-JOBHISTORY-cloudera2.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-yarn-jobhistory-cloudera2"
            user => elastic
            password => elastic
        }
    }

if [fields][tag]=="hadoop-cmf-yarn-RESOURCEMANAGER-cloudera2.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-yarn-resourcemanager-cloudera2"
            user => elastic
            password => elastic
        }
    }
```
cloudera3
```
if [fields][tag]=="hadoop-cmf-yarn-RESOURCEMANAGER-cloudera3.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-yarn-resourcemanager-cloudera3"
            user => elastic
            password => elastic
        }
    }
```
hadoop[1-10][13-16]
```
if [fields][tag]=="hadoop-cmf-yarn-NODEMANAGER-xyc.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hadoop-cmf-yarn-nodemanager-xyc"
            user => elastic
            password => elastic
        }
    }
```
