#/bin/sh
# @autor alvar01omer@gmail.com 

_GITS_HOLE="GIT_SOURCE/"
_SERVER_DIRECTION="162.243.7.240"
_SERVER_PATH="/var/www/html/"

#cd to home
cd ~

#create repo
git init --bare $_GITS_HOLE${1}.git
#cd in repo
cd $_GITS_HOLE${1}.git

if [ $2 == "index" ] 
then
	echo $2
	echo -e "#!/bin/sh \n GIT_WORK_TREE=${_SERVER_PATH} git checkout -f" > hooks/post-receive
else 
	echo -e "#!/bin/sh \n GIT_WORK_TREE=${_SERVER_PATH}${1} git checkout -f" > hooks/post-receive
fi

chmod +x hooks/post-receive

echo "git remote add $1  ssh://${USER}@${_SERVER_DIRECTION}/home/${USER}/${_GITS_HOLE}${1}.git && git push --set-upstream ${1} master   TO LOCAL REPO"
