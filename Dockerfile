FROM alpine

RUN apk update && apk add bash openssl postfix

ADD ssl/star.sublimia.nl.pem /etc/ssl/private/
ADD ssl/STAR_sublimia_nl.ca-bundle.pem /etc/ssl/certs/
ADD postfix/* /etc/postfix/
ADD start.sh /

EXPOSE 25 465

CMD ["/bin/bash", "-c", "set -e && /start.sh"]
