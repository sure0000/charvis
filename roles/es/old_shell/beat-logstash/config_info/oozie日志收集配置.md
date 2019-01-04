# oozie日志收集配置
## filebeat input
hadoop3
```yml
- type: log
  enabled: true
  paths:
    - /var/log/oozie/oozie-cmf-oozie-OOZIE_SERVER-hadoop3.log.out
  fields:
    "tag": "oozie-cmf-oozie-OOZIE_SERVER-hadoop3.log.out"
```

## logstash output
hadoop3
```
if [fields][tag]=="oozie-cmf-oozie-OOZIE_SERVER-hadoop3.log.out"{
			elasticsearch{
	            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
	                manage_template => false
	                index => "oozie-cmf-oozie-oozie_server-hadoop3"
	            user => elastic
	            password => elastic
	        }
	    }
```