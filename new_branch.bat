@echo off
echo 记得配置git环境变量，此bat删除merge.txt下所有工程branch分支

set source_address="git@gitlab.yunrong.cn:loanV2.1-projects/014-JCXF/business"
set branch_name="sit"
set destination_name="sit_old"

echo 请核查：
echo 创建branch git地址：%source_address%
echo 创建branch的源分支：%branch_name%
echo 创建branch的目标分支：%destination_name%

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
	git checkout -b %destination_name%
	echo pull %branch_name% 分支
	git pull origin %branch_name%
	echo pull %branch_name% 分支成功
	echo push %destination_name% 分支
	git push origin %destination_name%:%destination_name%
	echo push %destination_name% 分支成功
	git branch -a
	echo 创建 %%i 远程 %destination_name% 成功
	cd ..
	cd ..
	pause
)
pause