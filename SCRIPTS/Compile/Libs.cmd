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
SET MY_SOLUTIONCONFIG=%1
SET MY_CPP_PROJ_PLATFORM=%2
SET MY_DOTNET_PROJ_PLATFORM=%3
SET MY_SOLUTION_PLATFORM=%4

SET MY_TARGETS=/t:Restore,Clean,Rebuild
SET MY_DOTNET_PROJ_PARAMS=/p:Configuration=%MY_SOLUTIONCONFIG%,Platform=%MY_DOTNET_PROJ_PLATFORM%,WarningLevel=0
SET MY_CPP_PROJ_PARAMS=/p:Configuration=%MY_SOLUTIONCONFIG%,Platform=%MY_CPP_PROJ_PLATFORM%,WarningLevel=0
SET MY_SOL_PARAMS=/p:Configuration=%MY_SOLUTIONCONFIG%,Platform=%MY_SOLUTION_PLATFORM%,WarningLevel=0
SET MY_LIBS_SOLUTION_FILE=Libs\Libs.sln

EXIT /B 0



REM REM REM REM
REM REM REM REM
REM REM
REM REM Build Libs solution
REM REM
REM REM REM REM
REM REM REM REM
:BuildSolution 
@echo off

ECHO Building Libs solution [%MY_TARGETS% %MY_SOL_PARAMS% /nologo /v:m]
msbuild %MY_LIBS_SOLUTION_FILE% %MY_TARGETS% %MY_SOL_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1

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

ECHO Building MinaryLib
msbuild Libs\MinaryLib\MinaryLib.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1

ECHO[

EXIT /B 0



:BuildNativeWindowsLib
@echo off

ECHO Building NativeWindowsLib
msbuild Libs\NativeWindowsLib\NativeWindowsLib.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1

ECHO[

EXIT /B 0
