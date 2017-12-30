:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::: Global variables
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


CALL %*
EXIT /B


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::: Global functions
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


REM REM REM REM
REM REM REM REM
REM REM
REM REM Create directory variables
REM REM
REM REM REM REM
REM REM REM REM

:CopyAttackServiceFiles

SET SOLUTIONCONFIG=%1
SET ROOT_DIR=%2
SET ATTACK_SERVICE_DIR=%3
SET AS_HTTPREVERSEPROXY_DIR=%3HttpReverseProxy\
SET AS_PLUGINS_DIR=%AS_HTTPREVERSEPROXY_DIR%Plugins\
SET OUTPUTFILE=outer.txt

REM ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\*.dll %AS_HTTPREVERSEPROXY_DIR%
REM XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\*.dll %AS_HTTPREVERSEPROXY_DIR% >>%OUTPUTFILE%

REM ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\HttpReverseProxy.exe %AS_HTTPREVERSEPROXY_DIR%
REM XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\HttpReverseProxy.exe %AS_HTTPREVERSEPROXY_DIR% >>%OUTPUTFILE%



ECHO XCOPY /s /c /i /y AttackServices\HttpReverseProxy\bin\%SOLUTIONCONFIG%\AS_*.dll %AS_HTTPREVERSEPROXY_DIR%
XCOPY /s /c /i /y AttackServices\HttpReverseProxy\bin\%SOLUTIONCONFIG%\AS_*.dll %AS_HTTPREVERSEPROXY_DIR% >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\*.dll %AS_HTTPREVERSEPROXY_DIR%
XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\*.dll %AS_HTTPREVERSEPROXY_DIR% >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\HttpReverseProxy.exe %AS_HTTPREVERSEPROXY_DIR%
XCOPY /s /c /i /y Tools\HttpReverseProxy\HttpReverseProxy\bin\%SOLUTIONCONFIG%\HttpReverseProxy.exe %AS_HTTPREVERSEPROXY_DIR% >>%OUTPUTFILE%




ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\ClientRequestSniffer\bin\%SOLUTIONCONFIG%\ClientRequestSniffer.dll %AS_PLUGINS_DIR%ClientRequestSniffer\
XCOPY /s /c /i /y Tools\HttpReverseProxy\ClientRequestSniffer\bin\%SOLUTIONCONFIG%\ClientRequestSniffer.dll %AS_PLUGINS_DIR%ClientRequestSniffer\ >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\HostMapping\bin\%SOLUTIONCONFIG%\HostMapping.dll %AS_PLUGINS_DIR%HostMapping\
XCOPY /s /c /i /y Tools\HttpReverseProxy\HostMapping\bin\%SOLUTIONCONFIG%\HostMapping.dll %AS_PLUGINS_DIR%HostMapping\ >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\InjectCode\bin\%SOLUTIONCONFIG%\InjectCode.dll %AS_PLUGINS_DIR%InjectCode\
XCOPY /s /c /i /y Tools\HttpReverseProxy\InjectCode\bin\%SOLUTIONCONFIG%\InjectCode.dll %AS_PLUGINS_DIR%InjectCode\ >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\InjectFile\bin\%SOLUTIONCONFIG%\InjectFile.dll %AS_PLUGINS_DIR%InjectFile\
XCOPY /s /c /i /y Tools\HttpReverseProxy\InjectFile\bin\%SOLUTIONCONFIG%\InjectFile.dll %AS_PLUGINS_DIR%InjectFile\ >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\RequestRedirect\bin\%SOLUTIONCONFIG%\RequestRedirect.dll %AS_PLUGINS_DIR%RequestRedirect\
XCOPY /s /c /i /y Tools\HttpReverseProxy\RequestRedirect\bin\%SOLUTIONCONFIG%\RequestRedirect.dll %AS_PLUGINS_DIR%RequestRedirect\ >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\SslStrip\bin\%SOLUTIONCONFIG%\SslStrip.dll %AS_PLUGINS_DIR%SslStrip\
XCOPY /s /c /i /y Tools\HttpReverseProxy\SslStrip\bin\%SOLUTIONCONFIG%\SslStrip.dll %AS_PLUGINS_DIR%SslStrip\ >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\HttpReverseProxy\Weaken\bin\%SOLUTIONCONFIG%\Weaken.dll %AS_PLUGINS_DIR%Weaken\
XCOPY /s /c /i /y Tools\HttpReverseProxy\Weaken\bin\%SOLUTIONCONFIG%\Weaken.dll %AS_PLUGINS_DIR%Weaken\ >>%OUTPUTFILE%



EXIT /B 0

