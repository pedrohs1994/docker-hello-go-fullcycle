FROM golang:1.8-alpine AS build
WORKDIR /out
COPY ./main.go /out
RUN go build main.go

FROM scratch
WORKDIR /app
COPY --from=0 /out/main /app/
ENTRYPOINT [ "./main" ]