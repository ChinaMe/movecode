@echo off
echo �ǵ�����git������������batɾ��merge.txt�����й���branch��֧

set source_address="git@gitlab.yunrong.cn:loanV2.1-projects/014-JCXF/business"
set branch_name="sit"
set destination_name="sit_old"

echo ��˲飺
echo ����branch git��ַ��%source_address%
echo ����branch��Դ��֧��%branch_name%
echo ����branch��Ŀ���֧��%destination_name%

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
	echo pull %branch_name% ��֧
	git pull origin %branch_name%
	echo pull %branch_name% ��֧�ɹ�
	echo push %destination_name% ��֧
	git push origin %destination_name%:%destination_name%
	echo push %destination_name% ��֧�ɹ�
	git branch -a
	echo ���� %%i Զ�� %destination_name% �ɹ�
	cd ..
	cd ..
	pause
)
pause