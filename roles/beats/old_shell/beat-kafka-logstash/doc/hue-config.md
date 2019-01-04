# hue-config
## filebeat input
cloudera3
```yml
- type: log
  enabled: true
  paths:
    - /var/log/hue/runcpserver.log
  fields:
    "tag": "hue-runcpserver-cloudera3.log"
    "log_topic": "hue"

- type: log
  enabled: true
  paths:
    - /var/log/hue/error.log
  fields:
    "tag": "hue-error-cloudera3.log"
    "log_topic": "hue"

- type: log
  enabled: true
  paths:
    - /var/log/hue/access.log
  fields:
    "tag": "hue-access-cloudera3.log"
    "log_topic": "hue"
```