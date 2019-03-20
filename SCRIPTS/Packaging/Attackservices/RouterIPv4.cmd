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
SET AS_ROUTERIPV4_DIR=%3RouterIPv4\
SET OUTPUTFILE=outer.txt

ECHO XCOPY /s /c /i /y AttackServices\RouterIPv4\bin\%SOLUTIONCONFIG%\*.dll %AS_ROUTERIPV4_DIR%
XCOPY /s /c /i /y AttackServices\RouterIPv4\bin\%SOLUTIONCONFIG%\*.dll %AS_ROUTERIPV4_DIR% >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\RouterIPv4\%SOLUTIONCONFIG%\bin\RouterIPv4.exe %AS_ROUTERIPV4_DIR%
XCOPY /s /c /i /y Tools\RouterIPv4\%SOLUTIONCONFIG%\bin\RouterIPv4.exe %AS_ROUTERIPV4_DIR% >>%OUTPUTFILE%



EXIT /B 0

