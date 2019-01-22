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
SET MY_SOL_PARAMETERS=/p:Configuration=%MY_SOLUTIONCONFIG%,Platform=%MY_SOLUTION_PLATFORM%,WarningLevel=0
SET MY_TOOLS_SOLUTION_FILE=Tools\Tools.sln

EXIT /B 0



REM REM REM REM
REM REM REM REM
REM REM
REM REM Build Tools solution
REM REM
REM REM REM REM
REM REM REM REM
:BuildSolution 
@echo off

ECHO Building Tools solution [%MY_TARGETS% %MY_SOL_PARAMETERS% /nologo /v:m]
msbuild %MY_TOOLS_SOLUTION_FILE% %MY_TARGETS% %MY_SOL_PARAMETERS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1

EXIT /B 0



REM REM REM REM
REM REM REM REM
REM REM
REM REM Build HttpReverseProxy
REM REM
REM REM REM REM
REM REM REM REM
:BuildHttpReverseProxy 
@echo off

ECHO Building HttpReverseProxy\HttpReverseProxyLib [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\HttpReverseProxyLib\HttpReverseProxyLib.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\HttpReverseProxy [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\HTTPReverseProxy\HttpReverseProxy.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\SslStrip [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\SslStrip\SslStrip.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\ClientRequestSniffer [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\ClientRequestSniffer\ClientRequestSniffer.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\Weaken [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\Weaken\Weaken.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\InjectFile [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\InjectFile\InjectFile.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\InjectCode [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\InjectCode\InjectCode.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\RequestRedirect [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\RequestRedirect\RequestRedirect.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Building HttpReverseProxy\HostMapping [%MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\HostMapping\HostMapping.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


EXIT /B 0




REM REM REM REM
REM REM REM REM
REM REM
REM REM Build APE
REM REM
REM REM REM REM
REM REM REM REM
:BuildApe
@echo off

ECHO Building Ape
msbuild Tools\Ape\Ape.vcxproj %MY_TARGETS% %MY_CPP_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[

EXIT /B 0




REM REM REM REM
REM REM REM REM
REM REM
REM REM Build DnsPoisoning
REM REM
REM REM REM REM
REM REM REM REM
:BuildDnsPoisoning
@echo off

ECHO Building DnsPoisoning
msbuild Tools\DnsPoisoning\DnsPoisoning.vcxproj %MY_TARGETS% %MY_CPP_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[

EXIT /B 0




REM REM REM REM
REM REM REM REM
REM REM
REM REM Build Sniffer
REM REM
REM REM REM REM
REM REM REM REM
:BuildSniffer
@echo off

ECHO Building Sniffer
msbuild Tools\Sniffer\Sniffer.vcxproj %MY_TARGETS% %MY_CPP_PROJ_PARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[

EXIT /B 0

