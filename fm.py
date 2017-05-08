# -*- coding: utf-8 -*-
#!/usr/bin/env python
# CONF FILE MANAGER
# @autor : alvar01omer@gmail.com

#	python fm.py -vhostr code.dev /var/www/html/code
#	python fm.py -vhost code.dev /var/www/html/code

import sys
import os
import ConfigParser
from progress.spinner import Spinner
import time

"""FileManager Class
Load and format conf files
"""

spinner = Spinner('Creating vhost File.. ')

class FileManager(object):

	"""set up directories for FileManager"""
	def __init__(self,command=None, domain=None,dir=None):
		global spinner
		super(FileManager, self).__init__()
		config = ConfigParser.RawConfigParser()
		config.read('config/config.cfg')
		self.option = command
		self.TEMP_DIRECTORY = config.get('ADMINCS', 'TEMP_DIRECTORY')
		self.TOOL_DIRECTORY = config.get('ADMINCS', 'TOOL_DIRECTORY')
		self.DIR = dir
		self.DOMAIN = domain
		self.UTIL_FILES = {'admincs_rewrite':"" , 'admincs_man':""}
		self.loadFiles()

	"""
	GetString function
	return file content
	"""
	def GetString(self,dir):
		global spinner
		spinner.next()
		fileObject = open(self.TOOL_DIRECTORY+dir , 'rb+', 1)
		spinner.next()
		text = fileObject.read()
		spinner.next()
		fileObject.close()
		spinner.next()
		return text

	def showSpinner(self):
		global spinner
		time.sleep(0.2)
		spinner.next()
	"""
	LoadFiles function
	load files on dictionary
	"""
	def loadFiles(self):
		self.showSpinner()
		values = {}
		for file in self.UTIL_FILES :
			self.showSpinner()
			self.UTIL_FILES[file]= self.GetString(file)

	"""
	formatFile function
	add sections to file
	"""
	def formatFile(self , strToformat):
		for file in self.UTIL_FILES :
			self.showSpinner()
			if strToformat.find(file) > 0 :
				return strToformat.replace(file, self.UTIL_FILES[file])
		return strToformat


	def validateParams(self):
		if(os.path.exists(self.DIR)) :
			return True
		return False

	def printMan(self):
		print self.UTIL_FILES['admincs_man']

	def getContent(self):
		self.showSpinner()
		if self.validateParams() :
			if self.option == '-vhostr':
				resutlText = self.GetString('admincs_vhost_rewrite_cigniter')
				resutlText = resutlText.format(self.DIR,self.DOMAIN,self.DOMAIN,self.DOMAIN,self.DOMAIN,self.DIR)
				return self.formatFile(resutlText)
			if self.option == '-vhost':
				resutlText = self.GetString('admincs_vhost_normal')
				resutlText = resutlText.format(self.DIR,self.DOMAIN,self.DOMAIN,self.DOMAIN,self.DOMAIN)
				return self.formatFile(resutlText)
			if self.option == '-vhostngx':
				resutlText = self.GetString('admincs_nginx_cigniter') % (self.DOMAIN, self.DIR)
				return self.formatFile(resutlText)
		return ""

	def saveTmp(self,text,filename):
		f = open(self.TEMP_DIRECTORY+filename,"w")
		f.write(text)
		f.close()
