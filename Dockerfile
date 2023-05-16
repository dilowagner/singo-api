#####################################
#   STEP 1 build executable binary  #
#####################################
FROM golang:1.18.2-alpine AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git && apk add -U --no-cache ca-certificates

WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

# Build the binary.
RUN CGO_ENABLED=0 GOOS=linux go build -o main

#####################################
#   STEP 2 build a small image      #
#####################################
FROM scratch

# Copy our static executable.
COPY --from=builder /app/main /app/main
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

ENV PORT 8080

# Run the hello binary.
ENTRYPOINT ["/app/main"]

EXPOSE 8080
