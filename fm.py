# -*- coding: utf-8 -*-
#!/usr/bin/env python
# CONF FILE MANAGER
# @autor : alvar01omer@gmail.com
#	python fm.py -vhostr code.dev /var/www/html/code
#	python fm.py -vhost code.dev /var/www/html/code
import sys
import os

files_dir = 'tools/'
key_file = {'admincs_rewrite':""}

def GetString(dir):
	fileObject = open(files_dir+dir , 'rb+', 1)
	text = fileObject.read()
	fileObject.close()
	return text

def load_files():
	global key_file
	values = {}
	for file in key_file :
		key_file[file]= GetString(file)


def format_file(strToformat):
	for file in key_file :
		if strToformat.find(file) > 0 :
			return strToformat.replace(file, key_file[file])
	return -1

def main():
	load_files()
	if len(sys.argv) > 2 :
		if sys.argv[1] == '-vhostr':
			if(os.path.exists(sys.argv[3])) :				
				resutlText = GetString('admincs_vhost_rewrite_cigniter')
				resutlText = resutlText.format(sys.argv[3],sys.argv[2],sys.argv[2],sys.argv[2],sys.argv[3]) 
				formated = format_file(resutlText)
				if(formated > 0):
					resutlText = formated	
				print resutlText
		if sys.argv[1] == '-vhost':
			if(os.path.exists(sys.argv[3])) :				
				resutlText = GetString('admincs_vhost_normal')
				resutlText = resutlText.format(sys.argv[3],sys.argv[2],sys.argv[2],sys.argv[2]) 
				formated = format_file(resutlText)
				if(formated > 0):
					resutlText = formated				
				print resutlText

main()	