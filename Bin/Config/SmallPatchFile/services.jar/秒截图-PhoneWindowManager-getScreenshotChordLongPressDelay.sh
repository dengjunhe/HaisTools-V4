SMALI_FILE="/smali_classes2/com/android/server/policy/PhoneWindowManager.smali"						#文件路径
FIND_START='.method private getScreenshotChordLongPressDelay()J'								#解压后要查找的开始代码
FILE_END='.end method'																	#解压后要查找的结束代码

#要替换的内容
REPLACE_CODE='
.method private  getScreenshotChordLongPressDelay()J
    .locals 3

    const/high16 v1, 0x0

    float-to-long v0, v1

    return-wide v0
.end method
'