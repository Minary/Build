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
ECHO Copying Inject payload Plugin files ...

SET REQUESTREDIRECT_ROOT=%ROOT_DIR%Plugins\Plugin_HttpRequestRedirect\bin\%SOLUTIONCONFIG%\
SET REQUESTREDIRECT_DSTDIR=%PLUGIN_DIR%\Plugin_HttpRequestRedirect\

MKDIR %REQUESTREDIRECT_DSTDIR%

ECHO COPY %REQUESTREDIRECT_ROOT%Plugin_HttpRequestRedirect.dll %REQUESTREDIRECT_DSTDIR%
COPY %REQUESTREDIRECT_ROOT%Plugin_HttpRequestRedirect.dll %REQUESTREDIRECT_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

EXIT /B 0