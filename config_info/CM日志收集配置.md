# CM日志收集配置


filebeat input
```yml
- type: log
  enabled: true
  paths:    
    - /var/log/cloudera-scm-server/cloudera-scm-server.log
  fields:   
    "tag": "cloudera-scm-server.log"
           
- type: log  
  enabled: true 
  paths:
    - /var/log/cloudera-scm-server/cmf-server-perf.log  
  fields:
    "tag": "cmf-server-perf.log"


- type: log
  enabled: true
  paths:
    - /var/log/cloudera-scm-agent/cloudera-scm-agent.log
  fields:
    "tag": "cloudera-scm-agent.log"
```

logstash output

```
output{
	if [fields][tag]=="cloudera-scm-server.log"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "cloudera-scm-server-cloudera1"
            user => elastic
            password => elastic
        }
    }

    if [fields][tag]=="cmf-server-perf.log"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "cmf-server-perf-cloudera1"
            user => elastic
            password => elastic
        }
    }

    if [fields][tag]=="cloudera-scm-agent.log"{
		elasticsearch{
            hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                manage_template => false
                index => "cloudera-scm-agent-cloudera1"
            user => elastic
            password => elastic
        }
    }

}
```