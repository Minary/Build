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
SET AS_APE_DIR=%3ArpPoisoning\
SET OUTPUTFILE=outer.txt

ECHO XCOPY /s /c /i /y AttackServices\ArpPoisoning\bin\%SOLUTIONCONFIG%\*.dll %AS_APE_DIR%
XCOPY /s /c /i /y AttackServices\ArpPoisoning\bin\%SOLUTIONCONFIG%\*.dll %AS_APE_DIR% >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\Ape\%SOLUTIONCONFIG%\bin\APE.exe %AS_APE_DIR%
XCOPY /s /c /i /y Tools\Ape\%SOLUTIONCONFIG%\bin\APE.exe %AS_APE_DIR% >>%OUTPUTFILE%



EXIT /B 0

