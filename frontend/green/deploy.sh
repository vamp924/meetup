#!/bin/bash

APP_NAME=frontend

oc new-app --as-deployment-config --name ${APP_NAME} --strategy docker https://github.com/vamp924/frontend -e BACKEND_HOST=backend -e BACKEND_PORT=8080
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
oc set probe dc/${APP_NAME} --readiness --get-url=http://:8080/nginx-ready
oc set probe dc/${APP_NAME} --liveness --get-url=http://:8080/nginx-health
