FROM golang:alpine as base

WORKDIR /usr/go/app

COPY . .

RUN CGO_ENABLED=0 go build -o /main .

FROM scratch

COPY --from=base /main .

CMD ["./main"]