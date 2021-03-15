#!/bin/bash

oc new-app --as-deployment-config --name backend fabric8/s2i-java:latest-java11~https://github.com/maanur/fictional-garbanzo.git -e JAVA_APP_JAR=/deployments/backend-0.1-all.jar
