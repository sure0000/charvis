# filebeat+logstash配置脚本说明
## 文件说明
 文件名 | 描述
 ----- | ----
 deploy_exe.sh | 主执行脚本
 deploy_util.sh | 公用函数脚本
 hosts | 部署主机文件
 filebeat_config.template | filebeat input配置文件模版
 pipeline_path.template | logstash pipeline路径配置文件模版
 pipeline_whole.template | logstash pipeline完整配置文件模版
 pipeline_part.template | logstash pipeline部分配置文件模版
 port | 当前已使用的最大端口号



## 场景一，新节点新服务增加日志监控数据源
> 如新增一台hadoop节点的日志源监控则需去要配置的流程为，新建filebeat input配置文件，更改输出端口号，新建logstash pipeline配置文件，添加logstash pipeline路径配置文件。

#### 结合部署脚本修改配置文件流程如下：<br>
1.新建filebeat input文件，模版如filebeat_config.template,其中path为日志文件路径,使用xyc替换日志文件的host名，如原始日志名为hadoop-cmf-yarn-NODEMANAGER-es1.log.out,则修改为hadoop-cmf-yarn-NODEMANAGER-xyc.log.out。
> 这是由于在不同主机上相同服务名的日志文件以hostname做了区分，在deploy_exe.sh脚本中将对于xyc替换为不同的主机名。

```
- type: log
  enabled: true
  paths:
    - /data0/log/hadoop-yarn/hadoop-cmf-yarn-NODEMANAGER-xyc.log.out
  fields:
    "tag": "hadoop-cmf-yarn-NODEMANAGER-xyc.log.out"
```

2.修改pipeline_whole.template文件,如下修改[fields][tag]为filebeat对应的tag,用于识别输入源，修改index为tag内容并保证全部小写。
```
input {
    beats {
        port => "5043"
    }
}

output{
if [fields][tag]=="hadoop-cmf-yarn-NODEMANAGER-xyc.log.out"{
            elasticsearch{
                hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                    manage_template => false
                    index => "hadoop-cmf-yarn-nodemanager-xyc"
                user => elastic
                password => elastic
            }
        }
}
```
3.修改hosts文件，每行一个节点名称，如下所示
```
es1 
es2 
es3 
```


## 场景二，老节点新服务增加日志监控数据源：
> 如hadoop1至hadoop16节点上已经启动filebeat进行日志收集，此时需要增加某一服务日志的收集。配置流程为，新建filebeat input配置文件，在原logstash配置文件中增加新配置。

#### 结合部署脚本修改配置文件流程如下：<br>
1. 新建filebeat input文件，过程同场景一第一步骤；
2. 修改pipeline_part.template文件，修改内容同场景一第二步骤；
```
if [fields][tag]=="kafka-server-xyc.log"{
            elasticsearch{
                hosts => ["10.1.3.123:9200","10.1.3.124:9200","10.1.3.125:9200"]
                    manage_template => false
                    index => "kafka-server-xyc"
                user => elastic
                password => elastic
            }
        }
```
3. 修改hosts文件，同场景一步骤三。

## 脚本执行
将脚本及配置模版放置于同一目录下，修改好相应的模版文件后执行命令如：./deploy_exe.sh hdfs.yml <br>
hdfs.yml为filebeat input配置文件名，若服务为hbase则可命名为hbase.yml，内容参考filebeat_config.template模版。
