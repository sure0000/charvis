# hbase日志收集配置

## filebeat input
cloudera2
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-MASTER-cloudera2.log.out
  fields:
    "tag": "hbase-cmf-hbase-MASTER-cloudera2.log.out"
```

cloudera3
```yml
- type: log
  enabled: true
  paths:    
    - /data0/log/hbase/hbase-cmf-hbase-HBASERESTSERVER-cloudera3.log.out
  fields:   
    "tag": "hbase-cmf-hbase-HBASERESTSERVER-cloudera3.log.out"
           
- type: log  
  enabled: true 
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-HBASETHRIFTSERVER-cloudera3.log.out 
  fields:
    "tag": "hbase-cmf-hbase-HBASETHRIFTSERVER-cloudera3.log.out"


- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-MASTER-cloudera3.log.out
  fields:
    "tag": "hbase-cmf-hbase-MASTER-cloudera3.log.out"

```
hadoop11
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-REGIONSERVER-hadoop11.log.out
  fields:
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
```
hadoop13
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hbase/hbase-cmf-hbase-REGIONSERVER-hadoop13.log.out
  fields:
    "tag": "hbase-cmf-hbase-REGIONSERVER-hadoop13.log.out"
```
## logstash output
cloudera2
```
 if [fields][tag]=="hbase-cmf-hbase-MASTER-cloudera2.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hbase-cmf-hbase-MASTER-cloudera2"
            user => elastic
            password => elastic
        }
    }
```

cloudera3

```
if [fields][tag]=="hbase-cmf-hbase-HBASERESTSERVER-cloudera3.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hbase-cmf-hbase-hbaserestserver-cloudera3"
            user => elastic
            password => elastic
        }
    }

    if [fields][tag]=="hbase-cmf-hbase-MASTER-cloudera3.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hbase-cmf-hbase-master-cloudera3"
            user => elastic
            password => elastic
        }
    }

    if [fields][tag]=="hbase-cmf-hbase-HBASETHRIFTSERVER-cloudera3.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hbase-cmf-hbase-hbasethriftserver-cloudera3"
            user => elastic
            password => elastic
        }
    }

```
hadoop11
```
if [fields][tag]=="hbase-cmf-hbase-REGIONSERVER-hadoop11.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hbase-cmf-hbase-regionserver-hadoop11"
            user => elastic
            password => elastic
        }
    }
```

hadoop12
```
if [fields][tag]=="hbase-cmf-hbase-REGIONSERVER-hadoop12.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hbase-cmf-hbase-regionserver-hadoop12"
            user => elastic
            password => elastic
        }
    }
```

hadoop13
```
if [fields][tag]=="hbase-cmf-hbase-REGIONSERVER-hadoop13.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hbase-cmf-hbase-regionserver-hadoop13"
            user => elastic
            password => elastic
        }
    }
```
