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
ECHO Copying Inject file Plugin files ...

SET INJECTFILE_ROOT=%ROOT_DIR%Plugins\Plugin_HttpInjectFile\bin\%SOLUTIONCONFIG%\
SET INJECTFILE_DSTDIR=%PLUGIN_DIR%\Plugin_HttpInjectFile\

MKDIR %INJECTFILE_DSTDIR%

ECHO COPY %INJECTFILE_ROOT%Plugin_HttpInjectFile.dll %INJECTFILE_DSTDIR%
COPY %INJECTFILE_ROOT%Plugin_HttpInjectFile.dll %INJECTFILE_DSTDIR% >>%OUTPUTFILE%
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

EXIT /B 0