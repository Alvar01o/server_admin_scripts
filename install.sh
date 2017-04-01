#!/bin/bash
# @autor alvar01omer@gmail.com 
printf "Installing ADMINCS \n"
echo "source ~/server_admin_scripts/aliases.sh" >> ~/.bashrc
python config.py
printf "\033[0;32mADMINCS commands installed succefully!!..\033[0m \n"