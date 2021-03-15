#!/bin/bash

oc get secret,cm,is,bc,dc,svc,route -l app
