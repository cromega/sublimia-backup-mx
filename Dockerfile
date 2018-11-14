FROM alpine:latest

RUN apk update && apk add bash openssl postfix rsyslog

ADD postfix/* /etc/postfix/
ADD start.sh /

EXPOSE 25

CMD ["/start.sh"]
