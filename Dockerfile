FROM php:5-apache

RUN apt update && apt install -y git \
    && git clone https://github.com/kbxkb/google-cloud-datastore-php.git \
    && chmod 777 /var/www -R && cd google-cloud-datastore-php \
    && cp calldatastore.php form.html loaddatastore.php /var/www/html \
    && curl -sS https://getcomposer.org/installer | php \
    && php composer.phar require google/auth \
    && php composer.phar require google/cloud

WORKDIR /var/www/html
EXPOSE 80

CMD ["apache2-foreground"]