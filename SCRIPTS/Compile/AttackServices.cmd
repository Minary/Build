:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global variables
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


CALL %* 
EXIT /B


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::: Global functions
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
SET MY_ATTACKSERVICES_SOLUTION_FILE=AttackServices\AttackServices.sln

EXIT /B 0



REM REM REM REM
REM REM REM REM
REM REM
REM REM Build AttackServices solution
REM REM
REM REM REM REM
REM REM REM REM
:BuildSolution 
@echo off

ECHO Building AttackServices solution [%MY_TARGETS% %MY_SOL_PARAMS% /nologo /v:m]
msbuild %MY_ATTACKSERVICES_SOLUTION_FILE% %MY_TARGETS% %MY_SOL_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1

EXIT /B 0



REM REM REM REM
REM REM REM REM
REM REM
REM REM Build AttackServices
REM REM
REM REM REM REM
REM REM REM REM
:BuildArpPoisoning
@echo off

ECHO Building AttackServices/ArpPoisoning
msbuild AttackServices\ArpPoisoning\ArpPoisoning.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
ECHO[

EXIT /B 0



:BuildRouterIPv4
@echo off

ECHO Building AttackServices/RouterIPv4
msbuild AttackServices\RouterIPv4\RouterIPv4.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
ECHO[

EXIT /B 0



:BuildDnsPoisoning
@echo off

ECHO Building AttackServices/DnsPoisoning
msbuild AttackServices\DnsPoisoning\DnsPoisoning.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
ECHO[

EXIT /B 0



:BuildSniffer
@echo off

ECHO Building AttackServices/ArpSniffer
msbuild AttackServices\Sniffer\Sniffer.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
ECHO[

EXIT /B 0



:BuildArpScan
@echo off

ECHO Building AttackServices/ArpScan
msbuild AttackServices\ArpScan\ArpScan.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
ECHO[

EXIT /B 0



:BuildHttpReverseProxy
@echo off

ECHO Building AttackServices/HttpReverseProxy
msbuild AttackServices\HttpReverseProxy\HttpReverseProxy.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1
ECHO[

EXIT /B 0




