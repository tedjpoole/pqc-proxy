ARG PROXY_IMAGE=registry.redhat.io/openshift-service-mesh/istio-proxyv2-rhel9
ARG PROXY_TAG=1.24.4

# Build liboqs and oqsprovider
FROM ${PROXY_IMAGE}:${PROXY_TAG} AS oqsprovider
RUN microdnf install -y git cmake ninja-build gcc-c++ perl-core diffutils openssl-devel
RUN git clone https://github.com/open-quantum-safe/oqs-provider.git /oqs-provider
RUN cd /oqs-provider && ./scripts/fullbuild.sh

# Install & configure the oqsprovider into the proxy image
FROM ${PROXY_IMAGE}:${PROXY_TAG}
COPY --from=oqsprovider /oqs-provider/_build/lib/oqsprovider.so /usr/lib64/ossl-modules
COPY oqsprovider.cnf /etc/pki/tls/openssl.d/
