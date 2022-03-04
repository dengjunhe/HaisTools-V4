#!/bin/bash
printf "\033c"
SHELL=$(readlink -f "$0")			#脚本文件
SHELL_PATH=$(dirname $SHELL)		#脚本路径
if [[ $(uname -m) != "aarch64" ]]; then su="sudo ";fi;

echo "
	
		·····································
		
		正在安装HaisDNA所需依赖，请耐心等待！
		
		·····································
		
	"

${su} apt update
${su} apt install -y whiptail
${su} apt install -y cpio
${su} apt install -y bc
${su} apt install -y file
${su} apt install -y aria2
${su} apt install -y brotli
${su} apt install -y android-sdk-libsparse-utils
${su} apt install -y openjdk-11-jre
${su} apt install -y p7zip-full
${su} apt install -y curl
${su} apt install -y python3
${su} apt install -y python3-pip
${su} apt install -y zipalign
${su} apt install -y zip
${su} apt install -y unzip
${su} apt install -y img2simg
${su} apt install -y dos2unix
${su} apt install -y zstd
${su} apt install -y jq