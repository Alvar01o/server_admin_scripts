#!/bin/bash
# @autor alvar01omer@gmail.com 
#./create_vhost -vhostr code.dev /var/www/html/code
#./create_vhost -vhost code.dev /var/www/html/code
source ~/server_admin_scripts/config/config.sh
cd ${_ADMINCS_PATH}
echo "Creating domain ${2} from ${3}"
python vhost_manager.py ${1} ${2} ${3}
if [[ -f "${USER_ADMINCSPATH}/tmp/${2}.conf" ]]; then
	su - -c "cp ${USER_ADMINCSPATH}/tmp/${2}.conf /etc/apache2/sites-available/${2}.conf && echo '${_SERVER_DIRECTION}	${2}' >> /etc/hosts && a2ensite ${2}.conf && service apache2 reload"
	rm ${_ADMINCS_PATH}tmp/${2}.conf
else 
	printf "\033[0;41m Syntax Error\033[0m \n"
fi


