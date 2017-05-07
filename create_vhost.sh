#!/bin/bash
# @autor alvar01omer@gmail.com
#./create_vhost -vhostr code.dev /var/www/html/code {vhost for apache with rewrite}
#./create_vhost -vhost code.dev /var/www/html/code {vhost for apache}
#./create_vhost -vhostngx code.dev /var/www/html/code {vhost for nginx}

source ~/server_admin_scripts/config/config.sh
cd ${_ADMINCS_PATH}
echo "Creating domain ${2} from ${3}"
if [ "$1" == "-vhostngx" ]; then
	echo "Preparing script for nginx server"
	_FOLDER_OF_SITES="/etc/nginx/sites-enabled"
fi
python vhost_manager.py ${1} ${2} ${3}
echo ${1}
if [[ -f "${USER_ADMINCSPATH}/tmp/${2}.conf" ]]; then
	if [ "$1" == "-vhostngx" ]; then
		su - -c "cp ${USER_ADMINCSPATH}/tmp/${2}.conf ${_FOLDER_OF_SITES} && echo '${_SERVER_DIRECTION}	${2}' >> /etc/hosts && service nginx reload"
	else
		su - -c "cp ${USER_ADMINCSPATH}/tmp/${2}.conf ${_FOLDER_OF_SITES} && echo '${_SERVER_DIRECTION}	${2}' >> /etc/hosts && a2ensite ${2}.conf && service apache2 reload"
	fi

	rm ${_ADMINCS_PATH}tmp/${2}.conf
else
	printf "\033[0;41m Syntax Error\033[0m \n"
fi
