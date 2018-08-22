# zookeeper日志收集配置
## filebeat input
cloudera[1-3]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/zookeeper/zookeeper-cmf-zookeeper-SERVER-xyc.log
  fields:
    "tag": "zookeeper-cmf-zookeeper-SERVER-xyc.log"
```

es[1-3]
```yml
- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/zookeeper.out
  fields:
    "tag": "zookeeper-xyc.out"
```

## logstash output
cloudera[1-3]
```
if [fields][tag]=="zookeeper-cmf-zookeeper-SERVER-xyc.log"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "zookeeper-cmf-zookeeper-server-xyc"
            user => elastic
            password => elastic
        }
    }
```

es[1-3]
```
if [fields][tag]=="zookeeper-xyc.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "zookeeper-xyc"
            user => elastic
            password => elastic
        }
    }
```