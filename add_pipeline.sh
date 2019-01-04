#!/bin/bash
ansible-playbook -i hosts ../../logstash/playbook/add_pipeline.yml -e "pipeline_path=test.conf"