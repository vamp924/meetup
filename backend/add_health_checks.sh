#!/bin/bash

APP_NAME=backend

oc set probe dc/${APP_NAME} --readiness --initial-delay-seconds=30 --period-seconds=1 --success-threshold=1 --timeout-seconds=1 --failure-threshold=2 --get-url=http://:8080/health/readiness
oc set probe dc/${APP_NAME} --liveness --initial-delay-seconds=30 --period-seconds=5 --success-threshold=1 --timeout-seconds=1 --failure-threshold=2 --get-url=http://:8080/health/liveness
