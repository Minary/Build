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
SET AS_ARPSCAN_DIR=%3ArpScan\
SET OUTPUTFILE=outer.txt

ECHO XCOPY /s /c /i /y AttackServices\ArpScan\bin\%SOLUTIONCONFIG%\AS_*.dll %AS_ARPSCAN_DIR%
XCOPY /s /c /i /y AttackServices\ArpScan\bin\%SOLUTIONCONFIG%\AS_*.dll %AS_ARPSCAN_DIR% >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\ArpScan\%SOLUTIONCONFIG%\ArpScan.exe %AS_ARPSCAN_DIR%
XCOPY /s /c /i /y Tools\ArpScan\%SOLUTIONCONFIG%\ArpScan.exe %AS_ARPSCAN_DIR% >>%OUTPUTFILE%

EXIT /B 0

