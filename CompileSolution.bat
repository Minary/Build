@ECHO OFF

SET MSBuildCmd_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"

SET DOTNET_DIR=C:\Windows\Microsoft.NET\Framework\v4.0.30319\
SET MSBUILD=%DOTNET_DIR%msbuild.exe
SET DOTNET_PLATFORM="AnyCPU"
SET CPP_PLATFORM=x86
SET ROOT_DIR="%cd%"
SET SOLUTIONCONFIG=%1

IF "%~1" == "" GOTO :EXITUSAGE

CLS

IF NOT EXIST %MSBuildCmd_PATH% (
  ECHO[
  ECHO[
  ECHO OOOPS!!  You must set the variable MSBuildCmd_Path to the right location!!
  ECHO          Open this file in a text editor and customize the variable manually.
  ECHO[
  ECHO[
  GOTO :END
)

ECHO Load MSBuild command environment
CALL %MSBuildCmd_PATH% 
cd %ROOT_DIR%

ECHO Check .NET directory : %DOTNET_DIR%
IF NOT EXIST "%DOTNET_DIR%" (
  ECHO The .Net directory %DOTNET_DIR% does not exist!
  ECHO You need to customize to make this script work properly.
  GOTO :ERROR
)




REM REM REM
REM REM REM
REM
REM Build Tools
REM
REM REM REM
REM REM REM

CALL CompileScripts\Tools.cmd :Initialization %SOLUTIONCONFIG% %CPP_PLATFORM% %DOTNET_PLATFORM%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\Tools.cmd :BuildHttpReverseProxy
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\Tools.cmd :BuildApe
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\Tools.cmd :BuildSniffer
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR




REM REM REM
REM REM REM
REM
REM Build AttackServices
REM
REM REM REM
REM REM REM

CALL CompileScripts\AttackServices.cmd :Initialization %SOLUTIONCONFIG% %DOTNET_PLATFORM%
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\AttackServices.cmd :BuildArpPoisoning
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\AttackServices.cmd :BuildSniffer
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\AttackServices.cmd :BuildHttpReverseProxy
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR



REM REM REM
REM REM REM
REM
REM Build Libs
REM
REM REM REM
REM REM REM

ECHO Start building Libs solution %SOLUTIONCONFIG% %DOTNET_PLATFORM%
CALL CompileScripts\Libs.cmd :Initialization
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\Libs.cmd :BuildMinaryLib
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR

CALL CompileScripts\Libs.cmd :BuildNativeWindowsLib
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR




REM REM REM
REM REM REM
REM
REM Build Minary plugins
REM
REM REM REM
REM REM REM

ECHO Start building Minary plugins %SOLUTIONCONFIG% %DOTNET_PLATFORM%
CALL CompileScripts\Plugins.cmd :Initialization
CALL CompileScripts\Plugins.cmd :BuildAllPlugins
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR




REM REM REM
REM REM REM
REM
REM Build Minary plugins
REM
REM REM REM
REM REM REM

ECHO Start building Minary plugins
CALL CompileScripts\Minary.cmd :Initialization %SOLUTIONCONFIG% %DOTNET_PLATFORM%
CALL CompileScripts\Minary.cmd :Build
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR



ECHO Build finished successfully !!
GOTO :END


:ERROR
ECHO[
ECHO[
ECHO[
ECHO OOPS!! The last command failed!
ECHO[
ECHO[
EXIT /B 1


:EXITUSAGE
ECHO[
ECHO[
ECHO[
ECHO Usage: CompileSolution.bat DEBUG/RELEASE
ECHO[
ECHO[
EXIT /B 1

:END

