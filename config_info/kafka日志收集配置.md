# kafka日志收集配置
## filebeat input
kafka[1-3]
```yml
- type: log
  enabled: true
  paths:
    - /data0/kafka/logs/server.log
  fields:
    "tag": "kafka-server-xyc.log"

- type: log
  enabled: true
  paths:
    - /data0/kafka/logs/controller.log
  fields:
    "tag": "kafka-controller-xyc.log"

- type: log
  enabled: true
  paths:
    - /data0/kafka/logs/state-change.log
  fields:
    "tag": "kafka-state-change-xyc.log"
```

es[1-3]
```
- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/server.log
  fields:
    "tag": "kafka-server-xyc.log"

- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/controller.log
  fields:
    "tag": "kafka-controller-xyc.log"

- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/state-change.log
  fields:
    "tag": "kafka-state-change-xyc.log"
```

## logstash output
kafka[1-3]、es[1-3]
```
if [fields][tag]=="kafka-server-xyc.log"{
			elasticsearch{
	            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
	                manage_template => false
	                index => "kafka-server-xyc"
	            user => elastic
	            password => elastic
	        }
	    }
if [fields][tag]=="kafka-controller-xyc.log"{
			elasticsearch{
	            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
	                manage_template => false
	                index => "kafka-controller-xyc"
	            user => elastic
	            password => elastic
	        }
	    }

if [fields][tag]=="kafka-state-change-xyc.log"{
			elasticsearch{
	            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
	                manage_template => false
	                index => "kafka-state-change-xyc"
	            user => elastic
	            password => elastic
	        }
	    }
```