@echo off
echo '�ǵ�����git��������'

set waiwang="git@gitlab.yunrong.cn:loanV2.1-projects/014-JCXF/business"
set neiwang="git@oa-git.jccfc.com:credit/project/business"
set source_branch="sit"

echo "��˲飺"
echo "��˾��ַ��%waiwang%"
echo "��Ŀ��ַ��%neiwang%"
echo "Դ�ϲ���֧��%source_branch%"

echo start git clone
pause

echo "���������ļ���ʱ��ɾ����bat�ļ�����Ŀ¼����Ҫ�ϲ���֧�ļ��У���ע�⣡����"
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
	if exist ".git" (echo "���ȱ���%1��ɾ��%1������ִ��") else (echo "���ȱ���%1��ɾ��%1������ִ��")
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
echo "����ɾ��%1-merge��֧���´�������-ֱ�ӹر�cmd����"
pause
git branch
git remote add neiwang-%1 %neiwang%/%1.git
git remote add waiwang-%1 %waiwang%/%1.git
git remote -v
git fetch waiwang-%1
git branch -D %1-merge
git checkout -b %1-merge
git push neiwang-%1 --repo %1-merge
echo "create %1 �ɹ�"
cd ..
goto:eof
:ed
echo 'git push finish!'
pause
exit
