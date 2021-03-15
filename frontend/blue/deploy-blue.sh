#!/bin/bash

APP_NAME=experimental

oc new-app --as-deployment-config --name ${APP_NAME} --strategy docker https://github.com/vamp924/frontend -e BACKEND_HOST=backend -e BACKEND_PORT=8080
oc create configmap ${APP_NAME}-nginx-config --from-file nginx.conf
oc label configmap ${APP_NAME}-nginx-config app=${APP_NAME}
oc patch dc/${APP_NAME} --type=json --patch '
[
  { 
    "op": "add",
    "path": "/spec/template/spec/containers/0/env/-",
    "value": {
      "name": "POD_NAMESPACE",
      "valueFrom": {
          "fieldRef": {
              "fieldPath": "metadata.namespace"
          }
      }
    }
  }
]
'
oc set volume dc/${APP_NAME} --add --name ${APP_NAME}-nginx-config -m /etc/nginx/nginx.conf --sub-path=nginx.conf -t configmap --configmap-name=${APP_NAME}-nginx-config
oc expose svc ${APP_NAME}
oc set probe dc/${APP_NAME} --readiness --get-url=http://:8080/nginx-ready
oc set probe dc/${APP_NAME} --liveness --get-url=http://:8080/nginx-health
