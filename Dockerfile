FROM alpine:3.18.3

# latest certs
RUN apk add ca-certificates && update-ca-certificates

# install Apache Benchmark
RUN apk add --no-cache curl apache2-utils

# for security, do not run as root
RUN addgroup -S mygroup && adduser -S myuser -G mygroup
USER myuser

#
# opens to shell access by default
# kubectl run -i --rm --tty load-generator --image=ghcr.io/fabianlee/alpine-apache-benchmark:latest --restart=Never 
#
# runs Apache Benchmark with arguments
# kubectl run -i --rm --tty load-generator --image=ghcr.io/fabianlee/alpine-apache-benchmark:latest --restart=Never --command ab -- -n4 -c2 https://www.google.com/
#
ENTRYPOINT [ "/bin/sh" ]
