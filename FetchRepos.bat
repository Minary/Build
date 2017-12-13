@echo off

SET MINARY_DIR=Minary
SET PLUGINS_DIR=Plugins
SET TOOLS_DIR=Tools
SET LIBS_DIR=Libs
SET ATTACKSERVICES_DIR=AttackServices

:: Minary   -> Minary/
IF NOT EXIST "%MINARY_DIR%" mkdir %MINARY_DIR% 2> nul
git clone https://github.com/Minary/Minary.git %MINARY_DIR%


:: Plugins  -> Plugins/
IF NOT EXIST "%PLUGINS_DIR%" mkdir %PLUGINS_DIR% 2> nul
git clone https://github.com/Minary/Plugins.git %PLUGINS_DIR%


:: Tools    -> Tools/
IF NOT EXIST "%TOOLS_DIR%" mkdir %TOOLS_DIR% 2> nul
git clone https://github.com/Minary/Tools.git %TOOLS_DIR%


:: Libs     -> Libs/
IF NOT EXIST "%LIBS_DIR%" mkdir %LIBS_DIR% 2> nul
git clone https://github.com/Minary/Libs.git %LIBS_DIR%


:: AttackServices     -> AttackServices/
IF NOT EXIST "%ATTACKSERVICES_DIR%" mkdir %ATTACKSERVICES_DIR% 2> nul
git clone https://github.com/Minary/AttackServices.git %ATTACKSERVICES_DIR%

