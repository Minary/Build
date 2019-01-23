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
SET AS_DNSPOISONING_DIR=%3DnsPoisoning\
SET OUTPUTFILE=outer.txt

ECHO XCOPY /s /c /i /y AttackServices\DnsPoisoning\bin\%SOLUTIONCONFIG%\*.dll %AS_DNSPOISONING_DIR%
XCOPY /s /c /i /y AttackServices\DnsPoisoning\bin\%SOLUTIONCONFIG%\*.dll %AS_DNSPOISONING_DIR% >>%OUTPUTFILE%

ECHO XCOPY /s /c /i /y Tools\DnsPoisoning\%SOLUTIONCONFIG%\bin\DnsPoisoning.exe %AS_APE_DIR%
XCOPY /s /c /i /y Tools\DnsPoisoning\%SOLUTIONCONFIG%\bin\DnsPoisoning.exe %AS_APE_DIR% >>%OUTPUTFILE%



EXIT /B 0

