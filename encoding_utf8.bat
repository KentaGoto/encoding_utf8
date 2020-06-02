@echo off

rem *******************************************************************
rem [機能説明]
rem 拡張子で指定したファイルを nkf で UTF8 に変換する。
rem ディレクトリを再帰処理し、ファイル名に空白があっても処理対象とする。
rem *******************************************************************

setlocal enabledelayedexpansion

echo UTF8（BOM 無し）に変換します。
echo;
set /p d="対象フォルダをドラッグアンドドロップしてください（サブフォルダも対象となります）: "
echo;
set /p a="対象ファイルの拡張子を入力してください（例 txt）: "
echo;

cd /d %d%
	
rem -----Main-----
rem %~dp0 は、このバッチファイルのディレクトリ
forfiles /m *.%a% /s /c "cmd /c nkf.exe -w < @file > @file.bak"

del /s "*.%a%" > nul

for /r %%i in ("*.bak") do (
	rename "%%i" "%%~ni"
)

echo ----------------------変換したファイル----------------------
rem パスを切り捨てた拡張子付きファイル名と変換したファイル数を出力
set count=0
for /r %%i in (*.%a%) do (
	echo %%~nxi
	set /a count=!count!+1
)
echo;
echo !count! ファイルを UTF8（BOM無し）に変換しました。
echo --------------------------------------------------------

echo;

echo 適当なキーを押して終了です。
pause > nul

endlocal

rem set d=
rem set a=
