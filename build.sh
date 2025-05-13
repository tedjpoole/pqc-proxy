#!/bin/bash

export PROXY_TAG="1.24.4"

export PROXY_IMAGE_SRC="registry.redhat.io/openshift-service-mesh/istio-proxyv2-rhel9"
export PROXY_IMAGE_DST="quay.io/tpoole/istio-proxyv2-rhel9"

docker build --build-arg PROXY_IMAGE=${PROXY_IMAGE_SRC} \
             --build-arg PROXY_TAG=${PROXY_TAG} \
             --tag "${PROXY_IMAGE_DST}:${PROXY_TAG}" \
             --file Dockerfile .

docker push "${PROXY_IMAGE_DST}:${PROXY_TAG}"
