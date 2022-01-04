SMALI_FILE="/smali/com/android/server/SystemServerInjector.smali"						#文件路径
FIND_START='const-string v2, "cm8ucHJvZHVjdC5tb2RfZGV2aWNl"'								#解压后要查找的开始代码
FILE_END='if-eqz v0, :cond_0'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
    if-eqz v0, :cond_0
'