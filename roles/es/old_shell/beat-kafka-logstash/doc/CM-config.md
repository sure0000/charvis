# CM config

## filebeat input
```yml
- type: log
  enabled: true
  paths:
    - /var/log/cloudera-scm-server/cloudera-scm-server.log
  fields:
    "log_topic": "CM"
    "tag": "cloudera-scm-server"

- type: log
  enabled: true
  paths:
    - /var/log/cloudera-scm-server/cmf-server-perf.log
  fields:
    "log_topic": "CM"
    "tag": "cmf-server-perf"

- type: log
  enabled: true
  paths:
    - /var/log/cloudera-scm-agent/cloudera-scm-agent.log
  fields:
    "log_topic": "CM"
    "tag": "cloudera-scm-agent-xyc"
```
## lostash pipeline
```
input{
    kafka {
        bootstrap_servers => "es1:9092,es2:9092,es3:9092"
        topics => ["CM"]
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
                index => "cm"
            user => elastic
            password => elastic
        }
}
```