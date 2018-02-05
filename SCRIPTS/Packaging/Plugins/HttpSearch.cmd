::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global variables
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

CALL %* 
EXIT /B


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Global functions
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:CopyPluginFiles

ECHO[
ECHO Copying HTTP search Plugin files ...

SET HTTPSEARCH_ROOT=%ROOT_DIR%Plugins\Plugin_HttpSearch\bin\%SOLUTIONCONFIG%\
SET HTTPSEARCH_DSTDIR=%PLUGIN_DIR%Plugin_HttpSearch\

ECHO PLUGIN_DIR=%PLUGIN_DIR%
ECHO ROOT_DIR=%ROOT_DIR%
ECHO HTTPSEARCH_ROOT=%HTTPSEARCH_ROOT%
ECHO[

MKDIR %HTTPSEARCH_DSTDIR%

ECHO COPY %HTTPSEARCH_ROOT%Plugin_HttpSearch.dll %HTTPSEARCH_DSTDIR%
COPY %HTTPSEARCH_ROOT%Plugin_HttpSearch.dll %HTTPSEARCH_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

::ECHO COPY %HTTPSEARCH_ROOT%app.config %HTTPSEARCH_DSTDIR%
::COPY %HTTPSEARCH_ROOT%app.config %HTTPSEARCH_DSTDIR% >>%OUTPUTFILE%
::IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

EXIT /B 0