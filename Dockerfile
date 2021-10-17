FROM golang:1.17.2-alpine AS build

WORKDIR /usr/src

COPY ./src .

RUN go build main.go

FROM scratch

COPY --from=build /usr/src .

CMD ["./main"]