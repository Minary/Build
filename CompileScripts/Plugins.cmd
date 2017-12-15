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
SET PLUGINS_SOLUTION_FILE=Plugins\Plugins.sln

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

ECHO Building Plugin
msbuild plugins\Plugin_BrowserExploitKit\Plugin_BrowserExploitKit.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_DnsPoisoning\Plugin_DnsPoisoning.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_DnsRequests\Plugin_DnsRequests.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_Firewall\Plugin_Firewall.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_HttpAccounts\Plugin_HttpAccounts.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_HttpHostMapping\Plugin_HttpHostMapping.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_HttpInjectCode\Plugin_HttpInjectCode.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_HttpInjectFile\Plugin_HttpInjectFile.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_HttpRequestRedirect\Plugin_HttpRequestRedirect.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_HttpRequests\Plugin_HttpRequests.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_Sessions\Plugin_Sessions.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_SslStrip\Plugin_SslStrip.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


ECHO Building Plugin
msbuild plugins\Plugin_Systems\Plugin_Systems.csproj %TARGETS% %PARAMETERS% /nologo /v:m /nologo /verbosity:m
IF %ERRORLEVEL% NEQ 0 EXIT /B 1


EXIT /B 0
