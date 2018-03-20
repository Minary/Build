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
ECHO Copying HTTPS Requests Plugin files ...

SET HTTPSREQUESTS_ROOT=%ROOT_DIR%Plugins\Plugin_HttpsRequests\bin\%SOLUTIONCONFIG%\
SET HTTPSREQUESTS_DSTDIR=%PLUGIN_DIR%Plugin_HttpsRequests\

MKDIR %HTTPSREQUESTS_DSTDIR%

ECHO COPY %HTTPSREQUESTS_ROOT%Plugin_HttpSRequests.dll %HTTPSREQUESTS_DSTDIR%
COPY %HTTPSREQUESTS_ROOT%Plugin_HttpsRequests.dll %HTTPSREQUESTS_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

EXIT /B 0