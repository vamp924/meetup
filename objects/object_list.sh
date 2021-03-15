#!/bin/bash

oc get secret,cm,is,bc,dc,svc,route -l app
#Описываем объекты, сохраняем один, вычищаем runtime
oc get secret database-db-auth -o yaml > secret-database-raw.yaml
# cp secret-database-raw.yaml secret-database-clear.yaml
# joe secret-database-clear.yaml