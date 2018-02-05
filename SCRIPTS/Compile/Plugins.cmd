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
SET MY_PLUGINS_SOLUTION_FILE=Plugins\Plugins.sln

EXIT /B 0



REM REM REM REM
REM REM REM REM
REM REM
REM REM Build Plugins solution
REM REM
REM REM REM REM
REM REM REM REM
:BuildSolution 
@echo off

ECHO Building Plugins solution [%MY_TARGETS% %MY_SOL_PARAMETERS% /nologo /v:m]
msbuild %MY_PLUGINS_SOLUTION_FILE% %MY_TARGETS% %MY_SOL_PARAMETERS% /nologo /v:m
IF %ERRORLEVEL% NEQ 0 EXIT /b 1

EXIT /B 0



REM REM REM REM
REM REM REM REM
REM REM
REM REM Build All plugins
REM REM
REM REM REM REM
REM REM REM REM
:BuildAllPlugins
@echo off
ECHO Build All Plugins

ECHO Start building Minary plugins

ECHO Building Plugin "BrowserExploitKit"
msbuild plugins\Plugin_BrowserExploitKit\Plugin_BrowserExploitKit.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "DnsPoisoning"
msbuild plugins\Plugin_DnsPoisoning\Plugin_DnsPoisoning.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "DnsRequests"
msbuild plugins\Plugin_DnsRequests\Plugin_DnsRequests.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "Firewall"
msbuild plugins\Plugin_Firewall\Plugin_Firewall.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "HttpSearch"
msbuild plugins\Plugin_HttpSearch\Plugin_HttpSearch.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "HttpHostMapping"
msbuild plugins\Plugin_HttpHostMapping\Plugin_HttpHostMapping.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Pluginv "HttpInjectCode"
msbuild plugins\Plugin_HttpInjectCode\Plugin_HttpInjectCode.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "HttpInjectFile"
msbuild plugins\Plugin_HttpInjectFile\Plugin_HttpInjectFile.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "HttpRequestRedirect"
msbuild plugins\Plugin_HttpRequestRedirect\Plugin_HttpRequestRedirect.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "HttpRequests"
msbuild plugins\Plugin_HttpRequests\Plugin_HttpRequests.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "Sessions"
msbuild plugins\Plugin_Sessions\Plugin_Sessions.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "SslStrip"
msbuild plugins\Plugin_SslStrip\Plugin_SslStrip.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin "Systems"
msbuild plugins\Plugin_Systems\Plugin_Systems.csproj %MY_TARGETS% %MY_DOTNET_PROJ_PARAMS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


EXIT /B 0
