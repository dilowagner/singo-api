FROM golang:1.8

MAINTAINER "Diego Wagner" <diegowagner4@gmail.com>

RUN mkdir -p /go/src/github.com/dilowagner/singo-api
COPY . /go/src/github.com/dilowagner/singo-api 
WORKDIR /go/src/github.com/dilowagner/singo-api

RUN go-wrapper download
RUN go-wrapper install

ENV PORT 8080

RUN go build -o main . 

ENTRYPOINT /go/bin/singo-api

EXPOSE 8080