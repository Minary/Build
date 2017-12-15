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
SET CPP_PLATFORM=%2
SET DOTNET_PLATFORM=%3
SET TARGETS=/t:Restore,Clean,Rebuild
SET CPPPARAMS=/p:Configuration=%SOLUTIONCONFIG%,Platform=%CPP_PLATFORM%,WarningLevel=0
SET DOTNETPARAMS=/p:Configuration=%SOLUTIONCONFIG%,Platform=%DOTNET_PLATFORM%,WarningLevel=0
SET TOOLS_SOLUTION_FILE=Tools\Tools.sln

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


ECHO Bilding HttpReverseProxy\HttpReverseProxyLib [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\HttpReverseProxyLib\HttpReverseProxyLib.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Bilding HttpReverseProxy\HttpReverseProxy [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\HTTPReverseProxy\HttpReverseProxy.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Bilding HttpReverseProxy\HostMapping [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\HostMapping\HostMapping.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Bilding HttpReverseProxy\ClientRequestSniffer [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\ClientRequestSniffer\ClientRequestSniffer.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Bilding HttpReverseProxy\InjectCode [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\InjectCode\InjectCode.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Bilding HttpReverseProxy\InjectFile [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\InjectFile\InjectFile.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Bilding HttpReverseProxy\RequestRedirect [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\RequestRedirect\RequestRedirect.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[


ECHO Bilding HttpReverseProxy\SslStrip [%TARGETS% %DOTNETPARAMS% /nologo /v:m]
msbuild Tools\HttpReverseProxy\SslStrip\SslStrip.csproj %TARGETS% %DOTNETPARAMS% /nologo /v:m
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

ECHO Bilding Ape
msbuild Tools\Ape\Ape.vcxproj %TARGETS% %CPPPARAMS% /nologo /v:m
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

ECHO Bilding Sniffer
msbuild Tools\Sniffer\Sniffer.vcxproj %TARGETS% %CPPPARAMS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1
ECHO[

EXIT /B 0

