#!/usr/bin/env bash

kubectl apply -f ../task-4-5/namespace.yaml
kubectl apply -f ../task-4-5/env-config.yaml
kubectl apply -f ../task-4-5/app-secret.yaml

kubectl apply -f ../task-4-5/services/

kubectl apply -f ../task-4-5/deployments/nginx-deployment.yaml
kubectl apply -f ../task-4-5/deployments/backend-deployment.yaml

kubectl apply -f postgres-init-configmap.yaml
kubectl apply -f postgres-headless-service.yaml
kubectl apply -f postgres-statefulset.yaml

kubectl apply -f backend-hpa.yaml

kubectl apply -f ../week11/tls-secret.yaml
kubectl apply -f ../week11/gateway-class.yaml
kubectl apply -f ../week11/gateway.yaml
kubectl apply -f ../week11/app-route.yaml
kubectl apply -f ../week11/http-redirect.yaml
kubectl apply -f ../week11/cron-job.yaml

echo -----------
echo change /etc/hosts
echo -----------

kubectl apply -f ../week11/app-reader-service-account.yaml
kubectl apply -f ../week11/app-reader-role.yaml
kubectl apply -f ../week11/app-reader-role-binding.yaml

kubectl apply -f network/allow-dns.yaml
kubectl apply -f network/allow-frontend.yaml
kubectl apply -f network/allow-backend.yaml
kubectl apply -f network/allow-postgres.yaml
kubectl apply -f network/allow-health-check.yaml
kubectl apply -f network/default-deny-all.yaml