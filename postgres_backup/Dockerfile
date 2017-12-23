FROM golang:1.9.2-alpine as BUILDER

RUN apk add --update git make

ENV REFRESHED_AT=2017/12/21

RUN go get github.com/wal-g/wal-g
WORKDIR /go/src/github.com/wal-g/wal-g
RUN make all

FROM alpine:latest

COPY --from=0 /go/src/github.com/wal-g/wal-g/cmd/wal-g /usr/local/bin

RUN apk add --no-cache ca-certificates

ENV RETAIL=7

COPY set-walg-env /usr/local/bin
COPY wal-g.cron /tmp/wal-g.cron
RUN crontab /tmp/wal-g.cron
RUN rm /tmp/wal-g.cron

CMD ["/usr/sbin/crond", "-f", "-d", "0"]
