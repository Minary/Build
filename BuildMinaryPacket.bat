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
:: SET ROOT_DIR=..\Minary\
SET ROOT_DIR=.\
SET MINARY_DIR=Minary\
SET BUILD_DIR=BUILDS\%SOLUTIONCONFIG%\%TIMESTAMP%\
SET ATTACKSERVICES_DIR=%BUILD_DIR%\attackservices\

CLS

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

CALL BuildScripts\Minary.cmd :Initialization %SOLUTIONCONFIG% %MINARY_DIR% %BUILD_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL BuildScripts\Minary.cmd :CreateDirectoryStructure
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Minary data
CALL BuildScripts\Minary.cmd :CopyMinaryFiles 
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR


REM REM REM REM
REM REM REM REM
REM REM
REM REM Copy attack service files to build directory
REM REM
REM REM REM REM
REM REM REM REM

:: Copy APE attack services data
CALL BuildScripts\Attackservices\Ape.cmd :CopyAttackServiceFiles %ROOT_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy ApeSniffer attack services data
CALL BuildScripts\Attackservices\ApeSniffer.cmd :CopyAttackServiceFiles %ROOT_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy ArpScan attack services data
CALL BuildScripts\Attackservices\ArpScan.cmd :CopyAttackServiceFiles %ROOT_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HttpReverseProxy attack services data
CALL BuildScripts\Attackservices\HttpReverseProxy.cmd :CopyAttackServiceFiles %ROOT_DIR% %ATTACKSERVICES_DIR%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR



REM REM REM REM
REM REM REM REM
REM REM
REM REM Copy plugins to build directory
REM REM
REM REM REM REM
REM REM REM REM

:: Copy Browser Attack plugin data
CALL BuildScripts\Plugins\BrowserExploitKit.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy DNS Poisoning plugin data
CALL BuildScripts\Plugins\DnsPoisoning.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy DNS Requests plugin data
CALL BuildScripts\Plugins\DnsRequests.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Firewall plugin data
CALL BuildScripts\Plugins\Firewall.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HTTP accounts plugin data
CALL BuildScripts\Plugins\HttpAccounts.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HTTP host mapping plugin data
CALL BuildScripts\Plugins\HttpHostMapping.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HTTP Requests plugin data
CALL BuildScripts\Plugins\HttpRequests.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy HTTP Request Redirect plugin data
CALL BuildScripts\Plugins\HttpRequestRedirect.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Http Inject file plugin data
CALL BuildScripts\Plugins\HttpInjectFile.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Http Inject code plugin data
CALL BuildScripts\Plugins\HttpInjectCode.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Sessions
CALL BuildScripts\Plugins\Sessions.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy SSLStrip proxy plugin data
CALL BuildScripts\Plugins\SslStrip.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

:: Copy Systems plugin data
CALL BuildScripts\Plugins\Systems.cmd :CopyPluginFiles
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

GOTO :END

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
