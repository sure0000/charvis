#!/bin/bash
hosts=$(cat ../files/hosts)
for host in $hosts:
do
  echo $host
  ssh root@${host} systemctl stop filebeat
done