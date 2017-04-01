_GITS_HOLE="GIT_SOURCE/"
_SERVER_DIRECTION="127.0.0.1"
_SERVER_PATH="/var/www/html/"
USER_ADMINCSPATH="/home/${USER}/server_admin_scripts"
_MSG="git remote add $1  ssh://${USER}@${_SERVER_DIRECTION}/home/${USER}/${_GITS_HOLE}${1}.git && git push --set-upstream ${1} master"
_ADMINCS_PATH=~/server_admin_scripts/