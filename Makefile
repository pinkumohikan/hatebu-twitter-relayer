.PHONY: install install-dev server

composer.phar:
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	php composer-setup.php
	php -r "unlink('composer-setup.php');"

install: composer.phar
	./composer.phar install --no-dev --prefer-dist --optimize-autoloader --no-interaction

install-dev: composer.phar
	./composer.phar install --dev --prefer-dist --no-interaction

server:
	php -S 0.0.0.0:8000 -t public/
