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
ECHO Copying Sessions Plugin files ...

SET SESSIONS_ROOT=%ROOT_DIR%Plugins\Plugin_Sessions\bin\%SOLUTIONCONFIG%\
SET SESSIONS_DSTDIR=%PLUGIN_DIR%\Plugin_Sessions\

MKDIR %SESSIONS_DSTDIR%

ECHO COPY %SESSIONS_ROOT%Plugin_Sessions.dll %SESSIONS_DSTDIR%
COPY %SESSIONS_ROOT%Plugin_Sessions.dll %SESSIONS_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

ECHO COPY %SESSIONS_ROOT%app.config %SESSIONS_DSTDIR%
COPY %SESSIONS_ROOT%app.config %SESSIONS_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

EXIT /B 0