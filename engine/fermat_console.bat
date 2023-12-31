@echo off
rem ***********************************************
rem
rem   File: console.bat
rem
rem   Author: Matthias Ladkau
rem
rem   Description:
rem
rem     This is a start script for the 
rem     FermaT transformation engine console
rem
rem ***********************************************

IF NOT "%1"=="noecho" echo.
IF NOT "%1"=="noecho" echo.
IF NOT "%1"=="noecho" echo FermaT transformation engine console
IF NOT "%1"=="noecho" echo ====================================

IF NOT "%1"=="noecho" echo fermat_console.bat: Testing for perl ...
perl -e "exit 0" 

IF "%ERRORLEVEL%"=="0" GOTO OK

:ERROR

IF NOT "%1"=="noecho" echo console.bat: Can't find Perl! (Check installation and/or PATH variable)

goto END

:OK

IF NOT "%1"=="noecho" echo fermat_console.bat: Found perl!

IF NOT "%1"=="noecho" echo fermat_console.bat: Changing directory to %~sdp0fermat3\
cd %~sdp0fermat3\

IF NOT "%1"=="noecho" echo fermat_console.bat: Setting the environment variables ...

set FermaT=%~sdp0fermat3
set PATH=%FERMAT%\dosbin;%PATH%
set SCHEME_LIBRARY_PATH=%FERMAT%\slib\
set SCM_INIT_PATH=%FERMAT%\scm\Init5f2.scm
if exist %FERMAT%\scm\slibcat del %FERMAT%\scm\slibcat

IF NOT "%1"=="noecho" echo fermat_console.bat: Starting FermaT transformation engine ...

IF NOT "%1"=="noecho" echo.
IF NOT "%1"=="noecho" echo.

%~sdp0\fermat3\mingw\scmfmt

:END
