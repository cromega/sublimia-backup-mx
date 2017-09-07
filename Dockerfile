FROM alpine

RUN apk update && apk add bash openssl postfix

ADD certs/ /root/certs
RUN /root/certs/install.sh

ADD postfix/* /etc/postfix/
ADD start.sh /

EXPOSE 25

CMD ["/bin/bash", "-c", "set -e && /start.sh"]
