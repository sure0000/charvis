# hdfs-config

## filebeat input
hadoop[1-16]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-DATANODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-DATANODE-xyc.log.out"
    "log_topic": hdfs
```
cloudera[1]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out"
    "log_topic": hdfs
```
cloudera[2-3]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-NAMENODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-NAMENODE-xyc.log.out"
    "log_topic": hdfs

- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-FAILOVERCONTROLLER-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-FAILOVERCONTROLLER-xyc.log.out"
    "log_topic": hdfs

- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-hdfs/hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out
  fields:
    "tag": "hadoop-cmf-hdfs-JOURNALNODE-xyc.log.out"
    "log_topic": hdfs
```