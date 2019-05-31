FROM golang:1.12.5 as builder

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR /go/src/github.com/Elder-Carvalho/auth-microservice

COPY . .

RUN dep ensure
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o auth-service-cli .

FROM iron/go

WORKDIR /app

COPY --from=builder /go/src/github.com/Elder-Carvalho/auth-microservice /app

ENTRYPOINT ["./auth-service-cli"]