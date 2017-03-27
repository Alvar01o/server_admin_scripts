#!/bin/bash
# @autor alvar01omer@gmail.com 

# syntax : create_site 'sitename'

source config/config.sh

#cd to home
cd ~

#create repo
git init --bare $_GITS_HOLE${1}.git
#cd in repo
cd $_GITS_HOLE${1}.git

if [ "$2" == "localhost" ]; then
_SERVER_DIRECTION=$HOSTNAME
_MSG="git init & git remote add $1  ssh://${USER}@${_SERVER_DIRECTION}/home/${USER}/${_GITS_HOLE}${1}.git && git push --set-upstream ${1} master"
fi


if [ "$2" == "index" ]; then
	echo "Work dir seted on : ${_SERVER_PATH}"
	echo -e "#!/bin/sh \n GIT_WORK_TREE=${_SERVER_PATH} git checkout -f" > hooks/post-receive
else 
	mkdir ${_SERVER_PATH}${1}
	echo -e "#!/bin/sh \n GIT_WORK_TREE=${_SERVER_PATH}${1} git checkout -f" > hooks/post-receive
        echo "Work dir seed on : ${_SERVER_PATH}${1}"
fi

chmod +x hooks/post-receive

echo ${_MSG}

echo ${_MSG} >> /home/${USER}/${_GITS_HOLE}/reponame.txt

