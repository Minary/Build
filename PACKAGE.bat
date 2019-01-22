@ECHO OFF

SET YEAR=%date:~-4,4%
SET MONTH=%date:~-7,2%
IF "%MONTH:~0,1%" == " " set MONTH=0%MONTH:~1,1%
SET DAY=%date:~-10,2%
IF "%DAY:~0,1%" == " " set DAY=0%DAY:~1,1%

SET HOURS=%time:~-0,2%
IF "%HOURS:~0,1%" == " " set HOURS=0%HOURS:~1,1%
SET MINUTES=%time:~-8,2%
IF "%MINUTES:~0,1%" == " " set MINUTES=0%MINUTES:~1,1%
SET SECONDS=%time:~-5,2%
IF "%SECONDS:~0,1%" == " " set SECONDS=0%SECONDS:~1,1%

SET TIMESTAMP=%YEAR%%MONTH%%DAY%_%HOURS%%MINUTES%%SECONDS%
SET SOLUTIONCONFIG=%1
SET RELEASE_NAME=%2
:: SET ROOT_DIR=..\Minary\
SET ROOT_DIR=.\
SET MINARY_DIR=Minary\
SET BUILD_DIR=BUILDS\%SOLUTIONCONFIG%\Minary_%RELEASE_NAME%\
SET ATTACKSERVICES_DIR=%BUILD_DIR%\attackservices\

CLS



REM REM REM REM
REM REM REM REM
REM REM
REM REM Verify command line arguments
REM REM
REM REM REM REM
REM REM REM REM

SET _ARGC=0
FOR %%i in (%*) DO SET /A _ARGC+=1

IF %_ARGC% NEQ 2 (
  GOTO :PRINT_USAGE
)

IF NOT "%1"=="RELEASE" IF NOT "%1"=="DEBUG" (
  GOTO :PRINT_USAGE
)

ECHO BUILD_DIR: %BUILD_DIR%
IF exist "%BUILD_DIR%" (
  echo The release %BUILD_DIR% exists already. Process aborted.
  GOTO :END
)


REM REM REM REM
REM REM REM REM
REM REM
REM REM Copy Minary files to build directory
REM REM
REM REM REM REM
REM REM REM REM

CALL SCRIPTS\Packaging\Minary.cmd :Initialization %SOLUTIONCONFIG% %RELEASE_NAME% %MINARY_DIR% %BUILD_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL SCRIPTS\Packaging\Minary.cmd :CreateDirectoryStructure
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Minary data
CALL SCRIPTS\Packaging\Minary.cmd :CopyMinaryFiles 
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR


REM REM REM REM
REM REM REM REM
REM REM
REM REM Copy attack service files to build directory
REM REM
REM REM REM REM
REM REM REM REM

:: Copy APE attack services data
CALL SCRIPTS\Packaging\Attackservices\Ape.cmd :CopyAttackServiceFiles %SOLUTIONCONFIG% %ROOT_DIR% %ATTACKSERVICES_DIR% 
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy DnsPoisoning attack services data
CALL SCRIPTS\Packaging\Attackservices\DnsPoisoning.cmd :CopyAttackServiceFiles %SOLUTIONCONFIG% %ROOT_DIR% %ATTACKSERVICES_DIR% 
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Sniffer attack services data
CALL SCRIPTS\Packaging\Attackservices\Sniffer.cmd :CopyAttackServiceFiles %SOLUTIONCONFIG% %ROOT_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HttpReverseProxy attack services data
CALL SCRIPTS\Packaging\Attackservices\HttpReverseProxy.cmd :CopyAttackServiceFiles %SOLUTIONCONFIG% %ROOT_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR



REM REM REM REM
REM REM REM REM
REM REM
REM REM Copy plugins to build directory
REM REM
REM REM REM REM
REM REM REM REM

:: Copy Browser Attack plugin data
CALL SCRIPTS\Packaging\Plugins\BrowserExploitKit.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy DNS Poisoning plugin data
CALL SCRIPTS\Packaging\Plugins\DnsPoisoning.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy DNS Requests plugin data
CALL SCRIPTS\Packaging\Plugins\DnsRequests.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Firewall plugin data
CALL SCRIPTS\Packaging\Plugins\Firewall.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR



:: Copy HTTP Search plugin data
CALL SCRIPTS\Packaging\Plugins\HttpSearch.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR



:: Copy HTTP host mapping plugin data
CALL SCRIPTS\Packaging\Plugins\HttpHostMapping.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HTTP Requests plugin data
CALL SCRIPTS\Packaging\Plugins\HttpRequests.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HTTPS Requests plugin data
CALL SCRIPTS\Packaging\Plugins\HttpsRequests.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HTTP Request Redirect plugin data
CALL SCRIPTS\Packaging\Plugins\HttpRequestRedirect.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Http Inject file plugin data
CALL SCRIPTS\Packaging\Plugins\HttpInjectFile.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Http Inject code plugin data
CALL SCRIPTS\Packaging\Plugins\HttpInjectCode.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy SSLStrip proxy plugin data
CALL SCRIPTS\Packaging\Plugins\SslStrip.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Systems plugin data
CALL SCRIPTS\Packaging\Plugins\Systems.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR



REM REM REM REM
REM REM REM REM
REM REM
REM REM Create zip file
REM REM
REM REM REM REM
REM REM REM REM

CALL SCRIPTS\Packaging\Compress.cmd :CompressFiles BUILDS\%SOLUTIONCONFIG%\ %RELEASE_NAME% %BUILD_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

GOTO :END



:PRINT_USAGE
ECHO Usage:     %~n0%~x0 ^(DEBUG^|RELEASE^) Version
ECHO Example:   %~n0%~x0 RELEASE 1.0.0
ECHO[
EXIT /B 1



:ERROR
ECHO[
ECHO[
ECHO[
ECHO OOPS!! The last command failed!
ECHO[
ECHO[
EXIT /B 1



:END
::CALL BuildScripts\Minary.cmd :FileExistsNotZero
ECHO[
ECHO[
ECHO Build process finished successfully
ECHO[
ECHO[
EXIT /B 0

