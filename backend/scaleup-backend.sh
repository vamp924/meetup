#!/bin/bash

oc scale --replicas=6 dc/backend
