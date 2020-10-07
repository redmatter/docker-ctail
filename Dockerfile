FROM alpine:latest

ADD https://github.com/raducotescu/ctail/archive/master.tar.gz /tmp
RUN ( \
    set -e -u -x; \
    cd /tmp; \
    tar xzf master.tar.gz \
    )

FROM alpine:latest
RUN apk add --no-cache bash
COPY --from=0 /tmp/ctail-master/ctail /opt/ctail/ctail
COPY ctail.config /opt/ctail/ctail.config
ENTRYPOINT [ "/opt/ctail/ctail" ]
