# mgmt-config

## filebeat input
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/cloudera-scm-eventserver/mgmt-cmf-mgmt-EVENTSERVER-cloudera1.log.out
  fields:
    "log_topic": "mgmt"
    "tag": "mgmt-cmf-mgmt-EVENTSERVER-cloudera1.log.out"

- type: log
  enabled: true
  paths:
    - /data0/log/cloudera-scm-firehose/mgmt-cmf-mgmt-SERVICEMONITOR-cloudera1.log.out
  fields:
    "tag": "mgmt-cmf-mgmt-SERVICEMONITOR-cloudera1.log.out"
    "log_topic": "mgmt"

- type: log
  enabled: true
  paths:
    - /data0/log/cloudera-scm-firehose/mgmt-cmf-mgmt-HOSTMONITOR-cloudera1.log.out
  fields:
    "tag": "mgmt-cmf-mgmt-HOSTMONITOR-cloudera1.log.out"
    "log_topic": "mgmt"
```

## logstash pipeline
```
input{
    kafka {
        bootstrap_servers => "es1:9092,es2:9092,es3:9092"
        topics => ["mgmt"]
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
                index => "mgmt"
            user => elastic
            password => elastic
        }
}
```