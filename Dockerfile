FROM alpine:3.18.3

# latest certs
RUN apk add ca-certificates && update-ca-certificates

# install Apache Benchmark
RUN apk add --no-cache curl apache2-utils

# for security, do not run as root
RUN addgroup -S mygroup && adduser -S myuser -G mygroup
USER myuser

# works, pass arguments in (but no access to /bin/sh)
#ENTRYPOINT [ "/usr/bin/ab" ]
#CMD [ "" ]

# try this to allow ab args, but also shell access
ENTRYPOINT [ "/bin/sh" ]
CMD [ "/usr/bin/ab" ]
