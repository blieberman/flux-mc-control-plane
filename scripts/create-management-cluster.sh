#!/usr/bin/env bash

set -ex

k3d cluster create build

helm repo add fluxcd-community https://fluxcd-community.github.io/helm-charts
helm install flux fluxcd-community/flux2 -n flux-system --create-namespace

kubectl apply -f ../clusters/control-plane/bootstrap/gitrepo.yaml
kubectl apply -f ../clusters/control-plane/bootstrap/configuration.yaml
