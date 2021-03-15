#!/bin/bash

APP_NAME=database

oc new-app --as-deployment-config registry.redhat.io/rhel8/mysql-80 --name ${APP_NAME}
#oc create secret generic ${APP_NAME}-db-auth --from-literal=USER=meetup --from-literal=PASSWORD=mypass --from-literal=DATABASE=meetup --from-literal=HOST=${APP_NAME} --from-literal=PORT=3306
#oc label secret ${APP_NAME}-db-auth app=database
#oc set env --from=secret/${APP_NAME}-db-auth --prefix=MYSQL_ dc/${APP_NAME}
