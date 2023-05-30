@echo off

set SCRIPT_DIR=%~dp0
%SCRIPT_DIR%qt-cmake-private.bat %SCRIPT_DIR%../../../share/Qt6BuildInternals/QtStandaloneTestTemplateProject -DQT_BUILD_STANDALONE_TESTS=ON -DQT_STANDALONE_TEST_PATH=%* -DPWD="%CD%"
