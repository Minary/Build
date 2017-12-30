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
SET AS_SNIFFER_DIR=%3Sniffer\
SET OUTPUTFILE=outer.txt

ECHO XCOPY /s /c /i /y AttackServices\Sniffer\bin\%SOLUTIONCONFIG%\AS_*.dll %AS_SNIFFER_DIR%
XCOPY /s /c /i /y AttackServices\Sniffer\bin\%SOLUTIONCONFIG%\AS_*.dll %AS_SNIFFER_DIR% >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\Sniffer\%SOLUTIONCONFIG%\bin\Sniffer.exe %AS_SNIFFER_DIR%
XCOPY /s /c /i /y Tools\Sniffer\%SOLUTIONCONFIG%\bin\Sniffer.exe %AS_SNIFFER_DIR% >>%OUTPUTFILE%

EXIT /B 0

