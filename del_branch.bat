@echo off
echo �ǵ�����git������������batɾ��merge.txt�����й���branch��֧

set source_address="git@gitlab.yunrong.cn:loanV2.1-projects/014-JCXF/business"
set branch_name="sit_old"

echo ��˲飺
echo ɾ��branch git��ַ��%source_address%
echo ɾ��branch��Դ��֧��%branch_name%

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
	echo ɾ��%%iԶ��%branch_name%�ɹ�
	cd ..
	cd ..
	pause
)
pause