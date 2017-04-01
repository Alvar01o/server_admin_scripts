from fm import FileManager

import sys

fm = FileManager()
try:
	fm = FileManager(sys.argv[1],sys.argv[2],sys.argv[3])
except Exception as e:
	print e
	fm.printMan()
else:
	print fm.saveTmp(fm.getContent(),sys.argv[2]+".conf")
finally:
	pass

