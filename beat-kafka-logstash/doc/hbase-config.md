# hbase-config

## filebeat config
cloudera2
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-MASTER-cloudera2.log.out
  fields:
    "tag": "hbase-cmf-hbase-MASTER-cloudera2.log.out"
    "log_topic": hbase
```

cloudera3
```yml
- type: log 
  enabled: true
  paths:    
    - /data0/log/hbase/hbase-cmf-hbase-HBASERESTSERVER-cloudera3.log.out
  fields:   
    "tag": "hbase-cmf-hbase-HBASERESTSERVER-cloudera3.log.out"
    "log_topic": hbase
           
- type: log  
  enabled: true 
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-HBASETHRIFTSERVER-cloudera3.log.out 
  fields:
    "tag": "hbase-cmf-hbase-HBASETHRIFTSERVER-cloudera3.log.out"
    "log_topic": hbase


- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-MASTER-cloudera3.log.out
  fields:
    "tag": "hbase-cmf-hbase-MASTER-cloudera3.log.out"
    "log_topic": hbase
```
hadoop11
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-REGIONSERVER-hadoop11.log.out
  fields:
    "log_topic": hbase
    "tag": "hbase-cmf-hbase-REGIONSERVER-hadoop11.log.out"

```
hadoop12
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-REGIONSERVER-hadoop12.log.out
  fields:
    "tag": "hbase-cmf-hbase-REGIONSERVER-hadoop12.log.out"
    "log_topic": hbase
```
hadoop13
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-REGIONSERVER-hadoop13.log.out
  fields:
    "tag": "hbase-cmf-hbase-REGIONSERVER-hadoop13.log.out"
    "log_topic": hbase
```


## logstash pipeline
```
input{
    kafka {
        bootstrap_servers => "es1:9092,es2:9092,es3:9092"
        topics => ["hbase"]
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
                index => "hbase"
            user => elastic
            password => elastic
        }
}
```