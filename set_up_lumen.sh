#!/bin/bash

_COMPOSER_DIR='tools/composer.phar'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#check if exist composer file
if [ ! -f ${_COMPOSER_DIR} ]; 
then
	php tools/installer_composer
fi

#cp file with permissions
su - -c "cp ${DIR}/${_COMPOSER_DIR} /usr/local/bin/composer"

#cd to home
cd ~

#install lumen
composer global require "laravel/lumen-installer"
