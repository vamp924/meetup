#!/bin/bash

# cat secret-database-clean.yaml >> template.yaml
cat cm-frontend-clean.yaml >> template.yaml
cat is-backend-clean.yaml >> template.yaml
cat is-database-clean.yaml >> template.yaml
cat is-frontend-clean.yaml >> template.yaml
cat is-s2i-java-clean.yaml >> template.yaml
cat is-ubi8-clean.yaml >> template.yaml
cat bc-backend-clean.yaml >> template.yaml
cat bc-frontend-clean.yaml >> template.yaml
cat dc-backend-clean.yaml >> template.yaml
cat dc-database-clean.yaml >> template.yaml
cat dc-frontend-clean.yaml >> template.yaml
cat svc-backend-clean.yaml >> template.yaml
cat svc-database-clean.yaml >> template.yaml
cat svc-frontend-clean.yaml >> template.yaml
cat route-frontend-clean.yaml >> template.yaml
