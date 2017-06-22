FROM golang:1.8

MAINTAINER "Diego Wagner" <diegowagner4@gmail.com>

COPY . /go/src/github.com/dilowagner/singo-api 
WORKDIR /go/src/github.com/dilowagner/singo-api

RUN mkdir -p /go/src/github.com/dilowagner/singo-api && \
    go-wrapper download && \
    go-wrapper install && \
    go build -o main . 

ENV PORT 8080

ENTRYPOINT /go/bin/singo-api

EXPOSE 8080