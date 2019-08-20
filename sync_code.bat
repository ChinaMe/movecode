@echo off
echo '记得配置git环境变量'

set waiwang="git@gitlab.yunrong.cn:loanV2.1-projects/014-JCXF/business"
set neiwang="git@oa-git.jccfc.com:credit/project/business"
set source_branch="sit"

echo "请核查："
echo "公司地址：%waiwang%"
echo "项目地址：%neiwang%"
echo "源合并分支：%source_branch%"

echo start git clone
pause

echo "此批处理文件暂时会删除此bat文件所在目录的需要合并分支文件夹，请注意！！！"
pause
for /f %%i in (merge.txt) do if exist "%1" (rd/s/q %%i)
pause

for /f %%i in (merge.txt) do call:code_clone %%i
goto:ed
:code_clone
rem %1 : path
echo "------%1 code clone.-------"
if exist "%1" (
	cd %1
	if exist ".git" (echo "请先备份%1，删除%1，重新执行") else (echo "请先备份%1，删除%1，重新执行")
	cd ..
) else (
	git clone -b %source_branch% %waiwang%/%1.git
)
goto:eof
:ed
echo 'git clone finish!'
pause

for /f %%i in (merge.txt) do call:remote_addr %%i
goto:ed
:remote_addr
rem %1 : path
echo "------repository %1 remote start.-------"
cd %1
echo "即将删除%1-merge分支重新创建，否-直接关闭cmd窗口"
pause
git branch
git remote add neiwang-%1 %neiwang%/%1.git
git remote add waiwang-%1 %waiwang%/%1.git
git remote -v
git fetch waiwang-%1
git branch -D %1-merge
git checkout -b %1-merge
git push neiwang-%1 --repo %1-merge
echo "create %1 成功"
cd ..
goto:eof
:ed
echo 'git push finish!'
pause
exit
