@echo off
title Hais丶HaisDevice 线刷 - Q群：927251103

echo.***********************************************
echo.
echo.  1、刷机有风险、刷入前请备份好数据，做好变砖准备。
echo.  2、此包未经测试，刷入出现任何问题自己负责。
echo.  3、刷入请先【解锁】进入Fastboot模式后打开此脚本。
echo.  4、刷入失败请检查USB、驱动、手机是否正常。
echo.
echo.***********************************************
echo.
echo.  Y=保留数据刷入(默认)           N=清空所有数据刷入
echo.
set /p CHOICE=您的选择：
cd %~dp0
if exist system.new.dat.brx (
	if not exist firmware-update\super.img (
		echo.线刷文件正在准备中...
		META-INF\brx -D system.transfer.list -d system.new.dat.brx -o firmware-update\super.img
	)
)
echo.
echo.请将手机进入fastboot，进入后如无响应请前往Q群'927251103'共享寻找驱动安装后重启手机于工具重新开始。
echo.
META-INF\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *HaisDevice" || echo Missmatching image and device
META-INF\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *HaisDevice" || exit /B 1
if "%CHOICE%" == "N" (
	echo.用户数据正在清除中...
	META-INF\fastboot %* erase userdata  >NUL 2>NUL
	META-INF\fastboot %* erase secdata  >NUL 2>NUL
	META-INF\fastboot %* erase metadata  >NUL 2>NUL
	META-INF\fastboot %* erase exaid  >NUL 2>NUL
	META-INF\fastboot -w  >NUL 2>NUL
	echo.
)
META-INF\fastboot %* flash super firmware-update\super.img
META-INF\fastboot %* set_active a 
echo.
echo.  恭喜您刷机完成，系统正在重启，请稍等片刻。
META-INF\fastboot %* reboot 
echo.***********************************************
echo.
echo.  1、此包未经测试，刷入出现任何问题自己负责。
echo.  2、如不能开机，可尝试REC恢复或格式化data后开机。
echo.  3、如不能开机，可使用官方MiFlash刷官包恢复。
echo.  4、如觉得不错，希望你进群能支持一下Hais。
echo.
echo.***********************************************
echo.
echo.   如保留数据刷开机卡一屏，请尝试卸载面具后重启
echo.
echo.***********************************************
echo.  按任意键关闭此窗口
echo.
pause
exit