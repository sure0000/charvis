# hive-config

## filebeat input
cloudera2
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hive/hadoop-cmf-hive-HIVESERVER2-cloudera2.log.out
  fields:
    "tag": "hadoop-cmf-hive-HIVESERVER2-cloudera2.log.out"
    "log_topic": "hive"
```
cloudera3
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hive/hadoop-cmf-hive-HIVEMETASTORE-cloudera3.log.out
  fields:
    "tag": "hadoop-cmf-hive-HIVEMETASTORE-cloudera3.log.out"
    "log_topic": "hive"
```