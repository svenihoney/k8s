#!/usr/bin/env sh

kubectl get secret -n cert-manager leiderfischer-de-tls --kubeconfig ~/.kube/bak/config --context struppi -o yaml \
    | sed "/resourceVersion:/d;/uid:/d;s/name: .*/name: certificate-issuer-domain-0-wildcard/;s/namespace:.*/namespace: traefik/" \
    | kubectl apply -f - --context admin@main
