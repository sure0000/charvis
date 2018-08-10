# hue日志收集配置

## filebeat input
cloudera3
```yml
- type: log
  enabled: true
  paths:
    - /var/log/hue/runcpserver.log
  fields:
    "tag": "hue-runcpserver-cloudera3.log"

- type: log
  enabled: true
  paths:
    - /var/log/hue/error.log
  fields:
    "tag": "hue-error-cloudera3.log"

- type: log
  enabled: true
  paths:
    - /var/log/hue/access.log
  fields:
    "tag": "hue-access-cloudera3.log"
```

## logstash output
cloudera3
```
	if [fields][tag]=="hue-runcpserver-cloudera3.log"{
			elasticsearch{
	            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
	                manage_template => false
	                index => "hue-runcpserver-cloudera3"
	            user => elastic
	            password => elastic
	        }
	    }
    if [fields][tag]=="hue-error-cloudera3.log"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hue-error-cloudera3"
            user => elastic
            password => elastic
        }
    }
    if [fields][tag]=="hue-access-cloudera3.log"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "hue-access-cloudera3"
            user => elastic
            password => elastic
        }
    }
```