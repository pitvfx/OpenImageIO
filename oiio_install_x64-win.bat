@echo off

SET ROOTDIR=%~dp0
cd %ROOTDIR%

SET INSTALL_NAME=%~n0

echo.
echo ######################################
echo START INSTALL %INSTALL_NAME%
echo ######################################
echo.

:start

REM Create "oiio" directory if it doesn't exist and navigate into it
if not exist %INSTALL_NAME% goto:installStart

:loopStart
echo Directory %INSTALL_NAME% exists. Proceeding will delete it.
set /p "answer=Continue[Y/N]? "
if /i "%answer%" equ "N" exit /b
if /i "%answer%" neq "Y" goto:loopStart
:deleteStart
echo.
echo delete %INSTALL_NAME% ...
echo.
del /f /s /q  "%INSTALL_NAME%\*" > nul 2>&1
rd /s /q "%INSTALL_NAME%\" > nul 2>&1

:installStart
mkdir %INSTALL_NAME%

cd %INSTALL_NAME%

REM Clone vcpkg repository to the current directory (no sub-folder)
git clone https://github.com/Microsoft/vcpkg.git .

REM Run bootstrap-vcpkg.bat
call bootstrap-vcpkg.bat

REM Run vcpkg.exe to install OpenImageIO with dependencies
call vcpkg.exe install openimageio[opencolorio,freetype,tools,pybind11]:x64-windows --triplet=x64-windows-release

if %errorlevel% neq 0 (
	echo.
	echo Something went wrong.
	goto:error
) 


:copyStart

set copyFolder="OpenImageIO"
if exist %copyFolder% (
	del /f /s /q  "%copyFolder%\*" > nul 2>&1
	rd /s /q "%copyFolder%\" > nul 2>&1
)

mkdir %copyFolder%
mkdir %copyFolder%\bin\

set fromFolder=%INSTALL_NAME%\installed\x64-windows\

if exist "%fromFolder%tools\openimageio\" (
	robocopy %fromFolder%tools\openimageio\ %copyFolder%\ /E /NFL /NDL /NJH
	)
if exist "%fromFolder%bin\" (
	robocopy %fromFolder%bin\ %copyFolder%\bin\ /E /xf *.pdb /NFL /NDL /NJH
	)
if exist "%fromFolder%Qt6\" (	
	robocopy %fromFolder%Qt6\ %copyFolder%\Qt6\ /E /NFL /NDL /NJH
	)
if exist "%fromFolder%tools\Qt6\" (
	robocopy %fromFolder%tools\Qt6\ %copyFolder%\Qt6\ /E /xd debug /xf *.pdb /NFL /NDL /NJH
)
if exist "%fromFolder%tools\python3\" (
	robocopy %fromFolder%tools\python3\ %copyFolder%\bin\python\ /E /NFL /NDL /NJH
	set python="%copyFolder%\bin\python\python.exe"
) else (
	set python="0"
)
if exist "%fromFolder%lib\python3.10\site-packages\OpenImageIO\" (
	robocopy %fromFolder%lib\python3.10\site-packages\OpenImageIO\ %copyFolder%\bin\python\Lib\site-packages\oiio\ /E /NFL /NDL /NJH
	ren %copyFolder%\bin\python\Lib\site-packages\oiio\OpenImageIO.cp310-win_amd64.pyd OpenImageIO.pyd
)

if "%python%" neq "0" (
	rem get numpy
	%copyFolder%\bin\python\python.exe -Wignore -m ensurepip
	%copyFolder%\bin\python\python.exe -Wignore -m pip install -U pip --no-warn-script-location
	%copyFolder%\bin\python\python.exe -Wignore -m pip install numpy --no-warn-script-location
)



cd %copyFolder%\
curl -o OpenImageIO.bat https://raw.githubusercontent.com/pitvfx/OpenImageIO/master/OpenImageIO.bat

echo.
echo DONE INSTALL %INSTALL_NAME%
pause
exit /b

:error
set /p "answer=Try again[Y/N]? "
if /i "%answer%" equ "N" exit /b
if /i "%answer%" equ "Y" goto:deleteStart
goto:error