#!/usr/bin/env bash

kubectl apply -f task-4-5/namespace.yaml
kubectl apply -f task-4-5/env-config.yaml
kubectl apply -f task-4-5/app-secret.yaml

kubectl apply -f task-4-5/services/
kubectl apply -f task-4-5/deployments/

kubectl apply -f tls-secret.yaml
kubectl apply -f gateway-class.yaml
kubectl apply -f gateway.yaml
kubectl apply -f app-route.yaml
kubectl apply -f http-redirect.yaml
kubectl apply -f cron-job.yaml
echo -----------
echo change /etc/hosts
echo -----------