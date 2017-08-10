@echo off

:: Set up Visual Studio command line environment variables given a
:: machine type (x86 or amd64).

:: Visual Studio 2017 Enterprise
set BATDIR=%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary/Build
if exist "%BATDIR%\vcvarsall.bat" goto found

:: Visual Studio 2017 Professional
set BATDIR=%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Professional\VC\Auxiliary/Build
if exist "%BATDIR%\vcvarsall.bat" goto found

:: Visual Studio 2017 Community
set BATDIR=%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\VC\Auxiliary/Build
if exist "%BATDIR%\vcvarsall.bat" goto found

:: Visual Studio 2015
set BATDIR=%VS140COMNTOOLS%\..\..\vc
if exist "%BATDIR%\vcvarsall.bat" goto found

:: Visual Studio 2013
set BATDIR=%VS120COMNTOOLS%\..\..\vc
if exit "%BATDIR%\vcvarsall.bat" goto found

echo Visual Studio 2017, 2015, or 2013 must be installed.
exit 1

:found

:: Clear environment variables that we might otherwise inherit
set INCLUDE=
set LIB=
set LIBPATH=

"%BATDIR%\vcvarsall.bat" %1
