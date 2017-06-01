@ECHO OFF

SET DOTNET_DIR=C:\windows\Microsoft.NET\Framework\v4.0.30319\
SET MSBUILD=%DOTNET_DIR%msbuild.exe
SET MINARY_SOLUTION_FILE=Minary\Minary.sln
CLS
ECHO Check .NET directory : %DOTNET_DIR%

IF not exist "%DOTNET_DIR%" (
  ECHO The .Net directory %DOTNET_DIR% does not exist!
  ECHO You need to customize to make this script work properly.
  GOTO :ERROR
)

IF not exist "%MSBUILD%" (
  ECHO The file %MSBUILD% does not exist!
  GOTO :ERROR
)

IF not exist "%MINARY_SOLUTION_FILE%" (
  ECHO The file %MINARY_SOLUTION_FILE% does not exist!
  GOTO :ERROR
)


ECHO Start building solution
%MSBUILD% %MINARY_SOLUTION_FILE% /t:Clean,Build

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

