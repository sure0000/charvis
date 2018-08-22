#!/bin/sh
for service in $(cat service)
do
  sed -i "s/xyc/${service}/g" pipeline_path.template
  sed -i "1 r pipeline_path.template" pipelines.yml
  sed -i "s/${service}/xyc/g" pipeline_path.template
done