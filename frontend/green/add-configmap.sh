#!/bin/bash

APP_NAME=frontend

oc create configmap ${APP_NAME}-nginx-config --from-file nginx.conf
oc label configmap ${APP_NAME}-nginx-config app=${APP_NAME}
oc set volume dc/${APP_NAME} --add --name ${APP_NAME}-nginx-config -m /etc/nginx/nginx.conf --sub-path=nginx.conf -t configmap --configmap-name=${APP_NAME}-nginx-config
