FROM golang:1.9.2-alpine as BUILDER

RUN apk add --update git make

ENV REFRESHED_AT=2017/12/21

RUN go get github.com/wal-g/wal-g
WORKDIR /go/src/github.com/wal-g/wal-g
RUN make all

FROM postgres:10.1-alpine

COPY --from=0 /go/src/github.com/wal-g/wal-g/cmd/wal-g /usr/local/bin
RUN apk add --no-cache ca-certificates

COPY set-walg-env /usr/local/bin
COPY docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d/

CMD ["postgres"]
