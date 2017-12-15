:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global variables
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


CALL %* 
EXIT /B


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global functions
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




REM REM REM REM
REM REM REM REM
REM REM
REM REM Initialize setup environment variables
REM REM
REM REM REM REM
REM REM REM REM
:Initialization
@echo off
SET SOLUTIONCONFIG=%1
SET DOTNET_PLATFORM=%2
SET TARGETS=/t:Restore,Clean,Rebuild
SET PARAMETERS=/p:Configuration=%SOLUTIONCONFIG%,Platform=%DOTNET_PLATFORM%,WarningLevel=0
SET ATTACKSERVICES_SOLUTION_FILE=AttackServices\AttackServices.sln

EXIT /B 0


REM REM REM REM
REM REM REM REM
REM REM
REM REM Build Libs
REM REM
REM REM REM REM
REM REM REM REM
:BuildMinaryLib
@echo off

ECHO Bilding MinaryLibs
msbuild Libs\MinaryLib\MinaryLib.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1

ECHO[

EXIT /B 0



:BuildNativeWindowsLib
@echo off

ECHO Bilding NativeWindowsLib
msbuild Libs\NativeWindowsLib\NativeWindowsLib.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1

ECHO[

EXIT /B 0
