#!/bin/bash

source ~/.bash_rc

kubectl create ns argo
kubectl create ns argo-events

helm upgrade --install atlantbh charts/argo-workflows --namespace argo --values charts/argo-values.yaml
helm upgrade --install atlantbh charts/argo-events --namespace argo-events --values charts/argo-values.yaml

kubectl apply -f scripts/resources/raw/yaml/setup/ingresses.yaml
kubectl apply -f scripts/resources/raw/yaml/argo-workflows/service-account-workflow.yaml
kubectl apply -f scripts/resources/raw/yaml/argo-events/service-account-events.yaml
kubectl apply -f scripts/resources/raw/yaml/argo-events/webhook-source.yaml
kubectl apply -f scripts/resources/raw/yaml/argo-events/eventbus-default.yaml
kubectl apply -f scripts/resources/raw/yaml/argo-events/webhook-sensor.yaml

