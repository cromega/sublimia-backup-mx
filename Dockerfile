FROM alpine

RUN apk update && apk add bash openssl postfix

ADD ssl/ /root/ssl
RUN /root/ssl/install.sh

ADD postfix/* /etc/postfix/
ADD start.sh /

EXPOSE 25

CMD ["/bin/bash", "-c", "set -e && /start.sh"]
