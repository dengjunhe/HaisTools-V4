#!/bin/bash

SHELL=$(readlink -f "$0")			#脚本文件
SHELL_PATH=$(dirname $SHELL)		#脚本路径
if [[ $(uname -m) != "aarch64" ]]; then su="sudo ";fi;

echo "即将开始安装 Git 并获取工具包..."


echo "安装 Git 中..."
${su} apt install -y git

echo "获取 HaisV4 一键快速出包工具中..."
${su} git clone --depth 1 -b V4 https://gitee.com/hais/HaisTools.git HaisV4

echo "正在根据 HaisV4 安装运行依赖中..."
${su} chmod 0777 -R ./HaisV4

${su} ./HaisV4/Bin/0.Install.sh


echo " "
echo " "
echo " "
echo "HaisV4 环境部署完成，具体使用请查看 Readme.md"
echo " "
echo "可前往 http://d.hais.pw/rom/miui/list 获取ROM地址后，进行一键快速出包！"
echo "快捷一键出包完整命令如下："
echo "sudo ./HaisAuto.sh https://hugeota.d.miui.com/V12.0.2.0.QDTCNXM/miui_MI8Lite_V12.0.2.0.QDTCNXM_2f3fece0c8_10.0.zip"
echo " "
echo " "

sleep 3

