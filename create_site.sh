#!/bin/sh
# @autor alvar01omer@gmail.com 

_GITS_HOLE="GIT_SOURCE/"
_SERVER_DIRECTION="162.243.7.240"
#cd to home
cd ~
#create repo
git init --bare $_GITS_HOLE${1}.git
#cd in repo
cd $_GITS_HOLE${1}.git
#rutine after push
echo "#!/bin/sh \n GIT_WORK_TREE=/var/www/html/${1} git checkout -f" > hooks/post-receive
#permissions chaged
chmod +x hooks/post-receive

echo "git remote add $1  ssh://${USER}@${_SERVER_DIRECTION}/home/${USER}/${_GITS_HOLE}${1}.git && git push --set-upstream ${1} master TO LOCAL REPO"
