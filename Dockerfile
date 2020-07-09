FROM alpine:3.10
RUN apk update && \
  apk add -t deps wget ca-certificates && \
  rm -fR /var/cache/apk/*
RUN wget -q -O - https://github.com/papertrail/remote_syslog2/releases/download/v0.20/remote_syslog_linux_amd64.tar.gz \
  | tar -zxf - \
  && apk del deps
ENTRYPOINT ["/remote_syslog/remote_syslog", "-D"]
