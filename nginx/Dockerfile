FROM alpine:3.14

LABEL maintainer="Njomo Rostand <njomorostand@gmail.com>"

RUN apk add --update --no-cache nginx

COPY nginx.conf /etc/nginx/
COPY symfony.conf /etc/nginx/conf.d/default.conf

RUN echo "upstream php-upstream { server php:9001; }" > /etc/nginx/conf.d/upstream.conf

RUN adduser -D -g '' -G www-data www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
