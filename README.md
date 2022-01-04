
# HaisV4

此工具是Hais为方便修改MIUI系统所制作的一修改工具，目前是第四个大版本所以称之为V4。

PS：群内有使用教程、精简列表请前往Q群 [927251103](https://jq.qq.com/?_wv=1027&k=7SaV9nzM) 进行讨论。。

#### 兼容和支持

0.  安装环境仅支持x86、x64、arm64的Debian10或以上、Ubuntu20.4或以上、windowsWsl
1.  做包仅支持MIUI的安卓10、11、12

#### HaisV4特点

1.  便捷配置、一键出包
2.  纯净仅集成破解卡米
3.  禁用DM、AVB等。
4.  高通动态分区机型打出的是线刷、卡刷通用包。
5.  高通机型采用特殊打包方式,防止小白二次拆包。

#### 安装教程


###### 在电脑(x86、x64)的Ubuntu、Debian中可直接输入命令使用。

`bash <(curl -s https://github.com/Huucong95/HaisTools-V4/blob/main/Bin/0.NetInstall.sh)`


###### 在支持 WSL 的 Windows10、11上使用。

1、使用Powershell管理员身份运行下面命令启用WSL后重启电脑。

`Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

2、下载 http://u.hais.pw/d/v4 打开 Hais做包.exe 即可开始按照提示做包。

Ps:不使用的话在命令行输入 `wslconfig /u Debian` 卸载依赖，然后删除文件夹即可
Ps:如果闪退,请打开debian.exe按照提示解决.



###### 在安卓手机(arm64)上进行使用。

1、首先安装 Termux (群共享有下载)

2、执行命令安装Debian (总感觉Ubutnu比较臃肿)

`bash <(curl -s https://raw.githubusercontent.com/Huucong95/HaisTools-V4/main/Bin/0.Install.sh)`

3、安装好 Debian 后，重启软件、记得要重启、重启、重启后继续。

`./install.sh`

4、以后打开软件后就可以直接输入以下命令启动工具

`cd ./HaisV4 && ./HaisAuto.sh`



#### 开始做包

###### 目前仅支持的一键出包

做好设置后 `sudo ./HaisAuto.sh http://xxx.xxx.xxx./xxx.zip` 即可快速出包。


#### 工具内文件说明

1.0   工具启动脚本                        HaisAuto.sh

2.0   使用说明                            Readme.md

3.0   存放核心                            Bin

3.1   此处存放的全是工具依赖                Bin\Lib

3.2   配置文件,一键出包的各种设置            Bin\Config

3.2.1 设置作者、压缩、包类型等               Bin\Config\BuildConfig.ini

3.2.2 精简列表(群共享有参考)                Bin\Config\DeleteFileConfig.ini

3.2.3 刷机脚本描述和修改                    Bin\Config\FlashScriptConfig.ini

3.2.4 制作ROM需要添加的文件                 Bin\Config\AddReplaceFile

3.2.5 制作线刷时添加的                      Bin\Config\FlashImageTools

3.2.6 往某文件中追加的文字			Bin\Config\MergeFile

3.2.7 插桩修改的配置项				Bin\Config\SmallPatchFile



#### 版本说明

V1版本：https://gitee.com/hais/Hais_Build_Tools

V2版本：https://tx.me/haisROM

V3版本：https://gitee.com/hais/HaisV3


