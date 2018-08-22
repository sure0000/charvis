# yarn-config

## filebeat input
cloudera2
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-mapreduce/hadoop-cmf-yarn-JOBHISTORY-cloudera2.log.out
  fields:
    "tag": "hadoop-cmf-yarn-JOBHISTORY-cloudera2.log.out"
    "log_topic": yarn

- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-yarn/hadoop-cmf-yarn-RESOURCEMANAGER-cloudera2.log.out
  fields:
    "tag": "hadoop-cmf-yarn-RESOURCEMANAGER-cloudera2.log.out"
    "log_topic": yarn
```

cloudera3
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-yarn/hadoop-cmf-yarn-RESOURCEMANAGER-cloudera3.log.out
  fields:
    "tag": "hadoop-cmf-yarn-RESOURCEMANAGER-cloudera3.log.out"
    "log_topic": yarn
```

hadoop[1-10][13-16]
```yml
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-yarn/hadoop-cmf-yarn-NODEMANAGER-xyc.log.out
  fields:
    "tag": "hadoop-cmf-yarn-NODEMANAGER-xyc.log.out"
    "log_topic": yarn
```