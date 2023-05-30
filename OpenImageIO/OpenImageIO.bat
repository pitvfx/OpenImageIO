@echo off

SET OIIO_FOLDER=%~dp0

SET ADD_PATH=%OIIO_FOLDER%bin\

IF EXIST "%OIIO_FOLDER%bin\python\" (
  SET ADD_PATH=%ADD_PATH%;%OIIO_FOLDER%bin\python\
)

IF EXIST "%OIIO_FOLDER%bin\python\DLLs\" (
  SET ADD_PATH=%ADD_PATH%;%OIIO_FOLDER%bin\python\DLLs\
)

IF EXIST "%OIIO_FOLDER%Qt6\" (
  SET ADD_PATH=%ADD_PATH%;%OIIO_FOLDER%Qt6\
)

SET PATH=%ADD_PATH%;%PATH%

SET "ADD_PATH="

cmd.exe