# MGMT日志收集配置

filebeat input

```yml
- type: log
  enabled: true
  paths:
    - /data0/log/cloudera-scm-eventserver/mgmt-cmf-mgmt-EVENTSERVER-cloudera1.log.out
  fields:
    "tag": "mgmt-cmf-mgmt-EVENTSERVER-cloudera1.log.out"

- type: log
  enabled: true
  paths:
    - /data0/log/cloudera-scm-firehose/mgmt-cmf-mgmt-SERVICEMONITOR-cloudera1.log.out
  fields:
    "tag": "mgmt-cmf-mgmt-SERVICEMONITOR-cloudera1.log.out"

- type: log
  enabled: true
  paths:
    - /data0/log/cloudera-scm-firehose/mgmt-cmf-mgmt-HOSTMONITOR-cloudera1.log.out
  fields:
    "tag": "mgmt-cmf-mgmt-HOSTMONITOR-cloudera1.log.out"
```


logstash output

```
output{
	if [fields][tag]=="mgmt-cmf-mgmt-EVENTSERVER-cloudera1.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "mgmt-cmf-mgmt-eventserver-cloudera1"
            user => elastic
            password => elastic
        }
    }

    if [fields][tag]=="mgmt-cmf-mgmt-SERVICEMONITOR-cloudera1.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "mgmt-cmf-mgmt-servicemonitor-cloudera1"
            user => elastic
            password => elastic
        }
    }

    if [fields][tag]=="mgmt-cmf-mgmt-HOSTMONITOR-cloudera1.log.out"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "mgmt-cmf-mgmt-hostmonitor-cloudera1"
            user => elastic
            password => elastic
        }
    }

}
```
