# kafka-config

## filebeat input
kafka[1-3]
```yml
- type: log
  enabled: true
  paths:
    - /data0/kafka/logs/server.log
  fields:
    "tag": "kafka-server-xyc.log"
    "log_topic": "kafka"

- type: log
  enabled: true
  paths:
    - /data0/kafka/logs/controller.log
  fields:
    "tag": "kafka-controller-xyc.log"
    "log_topic": "kafka"

- type: log
  enabled: true
  paths:
    - /data0/kafka/logs/state-change.log
  fields:
    "tag": "kafka-state-change-xyc.log"
    "log_topic": "kafka"
```

es[1-3]
```
- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/server.log
  fields:
    "tag": "kafka-server-xyc.log"
    "log_topic": "kafka"

- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/controller.log
  fields:
    "tag": "kafka-controller-xyc.log"
    "log_topic": "kafka"

- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/state-change.log
  fields:
    "tag": "kafka-state-change-xyc.log"
    "log_topic": "kafka"
```
