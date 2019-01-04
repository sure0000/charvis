# filebeat->kafka->logstash->es方案

## filebeat input
```yml
- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/connect.log
  fields:
    "log_topic": "xyc_filebeat01"
    "tag": "connect_es1"

- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/connect.log
  fields:
    "log_topic": "xyc_filebeat02"
    "tag": "connect_es2"
```

## filebeat output
```
output.kafka:
   enbaled: true
   hosts: ["es1:9092","es2:9092","es3:9092"]
   topic: '%{[fields.log_topic]}'
   partition.round_robin:
     reachable_only: false

   required_acks: 1
   compression: gzip
   max_message_bytes: 1000000
```

## logstash pipeline

service_name_pipeline.conf

```
input{
    kafka {
        bootstrap_servers => "es1:9092"
        topics => ["xyc_filebeat02"]
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
                index => "xyc-filebeat02"
            user => elastic
            password => elastic
        }
}
```