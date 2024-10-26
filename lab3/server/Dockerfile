FROM golang:1.22-alpine AS builder

WORKDIR /workspace
COPY go.* .
COPY main.go main.go

RUN go mod download
RUN go build -o server main.go

FROM gcr.io/distroless/static:nonroot
WORKDIR /
COPY --from=builder /workspace/server .
USER 65532:65532

ENTRYPOINT ["/server"]
