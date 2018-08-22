# spark2-config
## filebeat input
```yml
- type: log
  enabled: true
  paths:
    - /var/log/spark2/spark2-history-server-cloudera1.log
  fields:
    "tag": "spark2-history-server-cloudera1.log"
    "log_topic": "spark2"
```