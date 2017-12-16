:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global variables
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

CALL %* 
EXIT /B


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global functions
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:CopyPluginFiles

ECHO[
ECHO Copying Systems Plugin files ...

SET SYSTEMS_ROOT=%ROOT_DIR%Plugins\Plugin_Systems\bin\%SOLUTIONCONFIG%\
SET SYSTEMS_DEFAULTDATA_ROOT=%ROOT_DIR%DEFAULT_DATA\
SET EXTERNAL_DIR=EXTERNAL\
SET SYSTEMS_DSTDIR=%PLUGIN_DIR%Plugin_Systems\

MKDIR %SYSTEMS_DSTDIR%

ECHO COPY %SYSTEMS_ROOT%Plugin_Systems.dll %SYSTEMS_DSTDIR%
COPY %SYSTEMS_ROOT%Plugin_Systems.dll %SYSTEMS_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

ECHO COPY %SYSTEMS_ROOT%app.config %SYSTEMS_DSTDIR%
COPY %SYSTEMS_ROOT%app.config %SYSTEMS_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

ECHO COPY %EXTERNAL_DIR%MacVendors.txt %SYSTEMS_DSTDIR%
COPY %EXTERNAL_DIR%MacVendors.txt %SYSTEMS_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

EXIT /B 0