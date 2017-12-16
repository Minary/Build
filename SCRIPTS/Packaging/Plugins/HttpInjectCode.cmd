..:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: Global variables
  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
  CALL %* 
  EXIT /B
  
  
  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: Global functions
  :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  
  :CopyPluginFiles
  
  ECHO[
  ECHO Copying Inject code Plugin files ...
  
  SET INJECTCODE_ROOT=%ROOT_DIR%Plugins\Plugin_HttpInjectCode\bin\%SOLUTIONCONFIG%\
  SET INJECTCODE_DSTDIR=%PLUGIN_DIR%\Plugin_HttpInjectCode\
  
  MKDIR %INJECTCODE_DSTDIR%
  
  ECHO COPY %INJECTCODE_ROOT%Plugin_HttpInjectCode.dll %INJECTCODE_DSTDIR%
  COPY %INJECTCODE_ROOT%Plugin_HttpInjectCode.dll %INJECTCODE_DSTDIR% >>%OUTPUTFILE%
  IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%
  
  EXIT /B 0