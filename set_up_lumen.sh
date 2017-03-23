#!/bin/bash
# @autor alvar01omer@gmail.com 

_COMPOSER_DIR='composer.phar'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#check if exist composer file
if [ ! -f ${_COMPOSER_DIR} ]; 
then
	php tools/installer_composer
fi

echo "Root Login to set composer as command"
#cp file with permissions
su - -c "cp ${DIR}/${_COMPOSER_DIR} /usr/local/bin/composer"

#cd to home
cd ~

echo "Installing laravel/lumen-installer"
#install lumen
composer global require "laravel/lumen-installer"
