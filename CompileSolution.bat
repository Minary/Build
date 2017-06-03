@ECHO OFF

SET MSBuildCmd_PATH="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"

SET DOTNET_DIR=C:\windows\Microsoft.NET\Framework\v4.0.30319\
SET MSBUILD=%DOTNET_DIR%msbuild.exe
SET MINARY_SOLUTION_FILE=Minary\Minary.sln
SET PLUGINS_SOLUTION_FILE=Plugins\Plugins.sln
SET TOOLS_SOLUTION_FILE=Tools\Tools.sln
SET LIBS_SOLUTION_FILE=Libs\Libs.sln


CLS

IF NOT EXIST %MSBuildCmd_PATH% (
  ECHO The MS Build command file does not exist
  GOTO :ERROR
)

ECHO Load MSBuild command environment
CALL %MSBuildCmd_PATH% 

ECHO Check .NET directory : %DOTNET_DIR%
IF NOT EXIST "%DOTNET_DIR%" (
  ECHO The .Net directory %DOTNET_DIR% does not exist!
  ECHO You need to customize to make this script work properly.
  GOTO :ERROR
)

IF not exist "%MINARY_SOLUTION_FILE%" (
  ECHO The file %MINARY_SOLUTION_FILE% does not exist!
  GOTO :ERROR
)


ECHO Start building Minary solution
msbuild %MINARY_SOLUTION_FILE% /t:Clean,Rebuild /p:Configuration=Release /p:WarningLevel=0
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR


ECHO Start building Plugins solution
msbuild %PLUGINS_SOLUTION_FILE% /t:Clean,Rebuild /p:Configuration=Release /p:WarningLevel=0
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR


ECHO Start building Tools solution
msbuild %TOOLS_SOLUTION_FILE% /t:Clean,Rebuild /p:Configuration=Release /p:WarningLevel=0
IF %ERRORLEVEL% NEQ 0 GOTO :ERROR


ECHO Start building Libs solution
msbuild %LIBS_SOLUTION_FILE% /t:Clean,Rebuild /p:Configuration=Release /p:WarningLevel=0
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


:END

