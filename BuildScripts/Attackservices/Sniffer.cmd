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
ECHO Copying Sniffer ...

SET ROOT_DIR=%1
SET ATTACKSERVICES_DIR=%2
SET SNIFFER_DSTDIR=%ATTACKSERVICES_DIR%\Sniffer\
SET SNIFFER_ROOT=%ROOT_DIR%Tools\Sniffer\%SOLUTIONCONFIG%\
SET SNIFFER_ATTACKSERVICE_DIR=AttackServices\Sniffer\bin\%SOLUTIONCONFIG%\AS_Sniffer.dll

MKDIR %SNIFFER_DSTDIR%

ECHO COPY %SNIFFER_ROOT%bin\Sniffer.exe %SNIFFER_DSTDIR%
COPY %SNIFFER_ROOT%bin\Sniffer.exe %SNIFFER_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

ECHO COPY %SNIFFER_ATTACKSERVICE_DIR% %SNIFFER_DSTDIR%
COPY %SNIFFER_ATTACKSERVICE_DIR% %SNIFFER_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%




EXIT /B 0
