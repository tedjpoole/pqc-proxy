# OSSM 3 Proxy with Open Quantum Safe Provider for OpenSSL

The `build.sh` script builds and pushes the image to quay.io

Note that rather than modifying or replacing the existing `/etc/pki/tls/openssl.cnf`
file belonging to the base image, the `oqsprovider.cnf` file gets put in the
`/etc/pki/tls/openssl.d/` directory to augment it. This relies on both cnf files
having identically named `[provider_sect]` sections.
