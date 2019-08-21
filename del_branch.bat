@echo off
echo 记得配置git环境变量，此bat删除merge.txt下所有工程branch分支

set source_address="git@gitlab.yunrong.cn:loanV2.1-projects/014-JCXF/business"
set branch_name="sit_old"

echo 请核查：
echo 删除branch git地址：%source_address%
echo 删除branch的源分支：%branch_name%

pause

mkdir code

for /f %%i in (merge.txt) do (
	cd code
	echo %source_address%/%%i.git
	git clone -b %branch_name% %source_address%/%%i.git
	echo git clone success
	pause
	cd %%i
	git branch -a
	git push origin --delete %branch_name%
	git branch -a
	echo 删除%%i远程%branch_name%成功
	cd ..
	cd ..
	pause
)
pause