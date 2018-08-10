# spark2日志收集配置
## filebeat input
cloudera1
```yml
- type: log
  enabled: true
  paths:
    - /var/log/spark2/spark2-history-server-cloudera1.log
  fields:
    "tag": "spark2-history-server-cloudera1.log"
```

## logstash output
cloudera1
```
if [fields][tag]=="spark2-history-server-cloudera1.log"{
			elasticsearch{
	            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
	                manage_template => false
	                index => "spark2-history-server-cloudera1"
	            user => elastic
	            password => elastic
	        }
	    }
```