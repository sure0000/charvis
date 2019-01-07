#!/bin/bash
if [ $# -ne 1 ]
then
  echo please check the Usesage: bash create_new_role.sh "new_role_name"
  exit
if

mkdir -p roles/$1/{defaults,files,handlers,meta,tasks,template,vars}