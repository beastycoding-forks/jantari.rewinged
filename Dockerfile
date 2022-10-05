# builder image to compile the binary
FROM golang:1.19.1 as builder

WORKDIR $GOPATH/src/rewinged/rewinged/
COPY . .
ENV CGO_ENABLED=0
RUN go build -o /tmp/rewinged



# final image with nothing but the binary
FROM scratch

COPY --from=builder /tmp/rewinged /bin/rewinged

ENTRYPOINT ["/bin/rewinged"]

