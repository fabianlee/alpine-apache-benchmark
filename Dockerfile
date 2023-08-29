FROM alpine:3.18.3

# latest certs
RUN apk add ca-certificates && update-ca-certificates

# install Apache Benchmark
RUN apk add --no-cache curl apache2-utils

# for security, do not run as root
RUN addgroup -S mygroup && adduser -S myuser -G mygroup
USER myuser

# if debugging
#ENTRYPOINT [ "/bin/sh" ]
CMD [ "/usr/bin/ab" ]
