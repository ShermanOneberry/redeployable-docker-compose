FROM docker:dind
COPY ./certs/domain.crt /etc/ssl/certs/
RUN apk --no-cache add ca-certificates && update-ca-certificates
