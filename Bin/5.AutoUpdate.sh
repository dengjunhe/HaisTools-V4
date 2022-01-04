#!/bin/bash
SHELL=$(readlink -f "$0")					#脚本文件
SHELL_PATH=$(dirname $SHELL)				#脚本路径
if [[ $(uname -m) != "aarch64" ]]; then su="sudo ";fi;
OUTPUT_PATH=$SHELL_PATH/../Output
show(){ echo  -e "\r\n\033[32m【`date '+%H:%M:%S'`】${1}\033[0m" ; }	#显示打印
showMsg(){ echo  -e "\033[37m`date '+%H:%M:%S'`：${1}\033[0m" ; }	#显示打印
getConfig() { grep "$1" "${OUTPUT_PATH}/BuildConfig.ini" | cut -d "=" -f 2; }  #读取配置文件
getProp() { grep "$1" "${OUTPUT_PATH}/DeviceBuild.ini" | cut -d "=" -f 2; } #读取机型配置

Device=$(getProp "ro.product.vendor.device")
RomVersion=$(getProp "ro.vendor.build.version.incremental")
DeviceName=${Device^}

UPDLOAD="$OUTPUT_PATH/Upload"
ROM_NAME=$(getConfig 'ROM_NAME')

if [ ! -f "$OUTPUT_PATH/${ROM_NAME}" ];then
	showMsg '打包出错,任务停止！'
	exit 404
elif [ "$(getConfig 'UPDATE_TYPE')" == "FALSE" ] ; then 
	showMsg '停止上传！'
	exit 404
else
	show '开始处理文件上传..'
	${su} mkdir -p $UPDLOAD
	${su} cp $SHELL_PATH/../Readme.md $UPDLOAD/包的说明.txt
	${su} cp $OUTPUT_PATH/log.txt $UPDLOAD/做包日记.txt
	${su} cp $OUTPUT_PATH/DeviceBuild.ini $UPDLOAD/设备信息.txt
	${su} cp $OUTPUT_PATH/BuildConfig.ini $UPDLOAD/做包配置.txt
	${su} mv "$OUTPUT_PATH/${ROM_NAME}" $UPDLOAD
fi


showMsg "文件正在上传到$(getConfig 'UPDATE_TYPE')网盘，请耐心等待！"
if [ "$(getConfig 'UPDATE_TYPE')" == "TRANSFER" ] ; then  #上传国外云
	romDownUrl=`${su} curl --upload-file $UPDLOAD/${ROM_NAME} https://transfer.sh/${ROM_NAME}`
	showMsg '下载地址：'$romDownUrl
	if [ "$(getConfig 'DIY_ID')" != "" ] ;then
		echo '更改状态'
	fi
elif [ "$(getConfig 'UPDATE_TYPE')" == "USER_AL" ] || [ "$(getConfig 'UPDATE_TYPE')" == "HAIS_AL" ] ; then  #上传阿里云
	Ali_TOKEN=$(getConfig 'Ali_TOKEN')
	Ali_ROOT_DIR_NAME=$(getConfig 'Ali_ROOT_DIR_NAME')
	Ali_ROOT_2_DIR_NAME=$(getConfig 'Ali_ROOT_2_DIR_NAME')
	AliYun="${su} ${SHELL_PATH}/Lib/aliyunpan -t ${Ali_TOKEN} "
	FULL_PATH="$Ali_ROOT_DIR_NAME/$Ali_ROOT_2_DIR_NAME/${DeviceName}/${DeviceName}_${RomVersion}"
	if [ "$(getConfig 'DIY_ID')" != "" ] || [ "$(getConfig 'USER_ID')" != "" ] ;then
		FULL_PATH=${FULL_PATH}/$(getConfig 'DIY_ID')_$(getConfig 'USER_ID')
	fi
	
	if ${AliYun} ls ; then 
		${su} sed -i "s/${Ali_TOKEN}/阿里网盘Token保密/g" $UPDLOAD/做包配置.txt
		echo '阿里tonken有效，开始处理上传'
		$AliYun rm "${FULL_PATH}"
		$AliYun m "${FULL_PATH}"
		$AliYun u "$UPDLOAD" "${FULL_PATH}"
	else
		echo '阿里tonken已失效，停止上传'
		exit 404
	fi
	
fi
