#!/bin/bash

APP_NAME=database

oc new-app --as-deployment-config registry.redhat.io/rhel8/mysql-80 --name ${APP_NAME}
