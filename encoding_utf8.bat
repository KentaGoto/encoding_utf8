@echo off

rem *******************************************************************
rem [�@�\����]
rem �g���q�Ŏw�肵���t�@�C���� nkf �� UTF8 �ɕϊ�����B
rem �f�B���N�g�����ċA�������A�t�@�C�����ɋ󔒂������Ă������ΏۂƂ���B
rem *******************************************************************

setlocal enabledelayedexpansion

echo UTF8�iBOM �����j�ɕϊ����܂��B
echo;
set /p d="�Ώۃt�H���_���h���b�O�A���h�h���b�v���Ă��������i�T�u�t�H���_���ΏۂƂȂ�܂��j: "
echo;
set /p a="�Ώۃt�@�C���̊g���q����͂��Ă��������i�� txt�j: "
echo;

cd /d %d%
	
rem -----Main-----
rem %~dp0 �́A���̃o�b�`�t�@�C���̃f�B���N�g��
forfiles /m *.%a% /s /c "cmd /c nkf.exe -w < @file > @file.bak"

del /s "*.%a%" > nul

for /r %%i in ("*.bak") do (
	rename "%%i" "%%~ni"
)

echo ----------------------�ϊ������t�@�C��----------------------
rem �p�X��؂�̂Ă��g���q�t���t�@�C�����ƕϊ������t�@�C�������o��
set count=0
for /r %%i in (*.%a%) do (
	echo %%~nxi
	set /a count=!count!+1
)
echo;
echo !count! �t�@�C���� UTF8�iBOM�����j�ɕϊ����܂����B
echo --------------------------------------------------------

echo;

echo �K���ȃL�[�������ďI���ł��B
pause > nul

endlocal

rem set d=
rem set a=
