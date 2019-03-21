FROM alpine:latest

RUN apk --no-cache add apache2 php-apache2 imagemagick

RUN apk add --update git nodejs nodejs-npm && npm i -g yarn

RUN chmod 0755 /var/lib && mkdir -p /var/lib/php/session \
    && chown apache:apache /var/lib/php/session

RUN ln -sf /dev/stdout /var/www/logs/access.log \
    ln -sf /dev/stderr /var/www/logs/error.log

EXPOSE 80 443

CMD ["ls", "-a"]
