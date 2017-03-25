from fm import FileManager

import sys

fm = FileManager(sys.argv[1],sys.argv[2],sys.argv[3])
print fm.saveTmp(fm.getContent(),sys.argv[2]+".conf")