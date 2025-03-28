#!/usr/bin/env sh

# kubectl get secret -n clusterissuer leiderfischer-de-tls --context admin@external -o yaml \
#     | sed "/resourceVersion:/d;/uid:/d;s/name: .*/name: certificate-issuer-domain-0-wildcard/;s/namespace:.*/namespace: traefik/" \
#     | kubectl apply -f - --context admin@main

kubectl get secret -n clusterissuer leiderfischer-de-tls --context admin@external -o json \
    | jaq 'del(.metadata) | . += {metadata: {name:"certificate-issuer-domain-0-wildcard", namespace: "traefik"}}' \
    | kubectl apply -f - --context admin@main
