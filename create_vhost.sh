#!/bin/bash
# @autor alvar01omer@gmail.com 
#./create_vhost -vhostr code.dev /var/www/html/code
#./create_vhost -vhost code.dev /var/www/html/code
source 'config/config.sh'
python vhost_manager.py ${1} ${2} ${3}
su - -c "cp ${USER_ADMINCSPATH}/tmp/${2}.conf /etc/apache2/sites-available/${2}.conf && echo '${_SERVER_DIRECTION}	${2}' >> /etc/hosts && a2ensite ${2}.conf && service apache2 reload"
rm ~/server_admin_scripts/tmp/${2}.conf
