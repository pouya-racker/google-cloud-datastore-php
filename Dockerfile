FROM php:5-apache

COPY . /var/www/html

RUN apt-get update && apt-get install -y git \
    && chmod 777 /var/www -R \
    && curl -sS https://getcomposer.org/installer | php \
    && php composer.phar require google/auth \
    && php composer.phar require google/cloud \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["apache2-foreground"]