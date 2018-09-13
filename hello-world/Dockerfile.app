# Quick Demo of Docker's Multi Stage Build
# Based on: http://training.play-with-docker.com/multi-stage/

# Build the app
FROM golang:1.10.3
COPY app.go .
RUN go build -o app app.go

# Copy the app into the smallest possible image
FROM scratch
COPY --from=0 /go/app .
CMD ["./app"]
