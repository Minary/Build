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
SET MINARY_SOLUTION_FILE=Minary\Minary.sln

EXIT /B 0


REM REM REM REM
REM REM REM REM
REM REM
REM REM Build Minary
REM REM
REM REM REM REM
REM REM REM REM
:Build 
@echo off
ECHO Bilding Minary\Minary [%TARGETS% %DOTNET_PLATFORM% /nologo /v:m]

msbuild Minary\Minary\Minary.csproj %TARGETS% %PARAMETERS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[

EXIT /B 0
