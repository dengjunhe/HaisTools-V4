# -*- coding: UTF-8 -*-
import sys
file=sys.argv[1]
old=sys.argv[2]
new=sys.argv[3]

print('文件路径：'+file)
#print('原始代码块')
#print(old)
#print('目标代码块')
#print(new)

with open(u''+file, 'r+') as f:
	content = f.read()
	f.seek(0,0)
	f.truncate()
	f.write(content.replace(old, new))

