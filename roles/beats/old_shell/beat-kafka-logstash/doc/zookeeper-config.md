# zookeeper-config

## filebeat input
cloudera[1-3]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/zookeeper/zookeeper-cmf-zookeeper-SERVER-xyc.log
  fields:
    "tag": "zookeeper-cmf-zookeeper-SERVER-xyc.log"
    "log_topic": "zookeeper"
```

es[1-3]
```yml
- type: log
  enabled: true
  paths:
    - /data7/kafka/logs/zookeeper.out
  fields:
    "tag": "zookeeper-xyc.out"
    "log_topic": "zookeeper"
```