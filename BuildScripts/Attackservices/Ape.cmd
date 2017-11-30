:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global variables
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

CALL %* 
EXIT /B


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global functions
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:CopyAttackServiceFiles

ECHO[
ECHO Copying ArpPoisoning ...

SET ROOT_DIR=%1
SET ATTACKSERVICES_DIR=%2
SET APE_DSTDIR=%ATTACKSERVICES_DIR%\ArpPoisoning\
SET APE_ROOT=%ROOT_DIR%Tools\APE\%SOLUTIONCONFIG%\
SET APE_ATTACKSERVICE_DIR=AttackServices\ArpPoisoning\bin\%SOLUTIONCONFIG%\AS_ArpPoisoning.dll

MKDIR %APE_DSTDIR%

ECHO COPY %APE_ROOT%bin\APE.exe %APE_DSTDIR%
COPY %APE_ROOT%bin\APE.exe %APE_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

ECHO COPY %APE_ATTACKSERVICE_DIR% %APE_DSTDIR%
COPY %APE_ATTACKSERVICE_DIR% %APE_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

EXIT /B 0
