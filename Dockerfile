FROM golang:1.24.4 AS builder
WORKDIR /go/src/app
COPY . .
ARG TargetOS
ARG TargetArch
RUN make build

FROM scratch
WORKDIR /
COPY --from=builder /go/src/app/kbot .
COPY --from=alpine:latest /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ 
ENTRYPOINT ["/kbot"]
