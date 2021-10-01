#!/bin/sh
php bin/console messenger:consume async &
php-fpm7 -F

