@echo off

rem *******************************************************************
rem [Function description]
rem Convert the file specified by the extension to UTF8 using nkf.
rem Recursive processing of the directory, even if there is a space in the file name.
rem *******************************************************************

setlocal enabledelayedexpansion

echo Convert to UTF8 (no BOM).
echo;
set /p d="Please drag and drop the target folder (sub-folders will be included): "
echo;
set /p a="Please enter the extension of the target file (e.g. txt): "
echo;

cd /d %d%
	
rem -----Main-----
rem %~dp0 は、このバッチファイルのディレクトリ
forfiles /m *.%a% /s /c "cmd /c nkf.exe -w < @file > @file.bak"

del /s "*.%a%" > nul

for /r %%i in ("*.bak") do (
	rename "%%i" "%%~ni"
)

echo ----------------------Converted file----------------------
rem Output file names with path truncated extensions and the number of converted files
set count=0
for /r %%i in (*.%a%) do (
	echo %%~nxi
	set /a count=!count!+1
)
echo;
echo Converted !count! file to UTF8 (no BOM).
echo --------------------------------------------------------

echo;

echo Press any key to finish.
pause > nul

endlocal

rem set d=
rem set a=
