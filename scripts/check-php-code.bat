:set "uniqueFileName=%tmp%\%RANDOM%.tmp"
set "uniqueFileName=%tmp%\check-code.tmp"
set BASE_DIR=C:\Work\php-project\
set BASE_DIR_0=%BASE_DIR%\app\
set BASE_DIR_1=%BASE_DIR%\bootstrap\
set BASE_DIR_2=%BASE_DIR%\config\
set BASE_DIR_3=%BASE_DIR%\database\
set BASE_DIR_4=%BASE_DIR%\routes\
set BASE_DIR_5=%BASE_DIR%\tests\

FindAndExec.exe %BASE_DIR_0% ".php$" php.bat "-l {}" > %uniqueFileName%
FindAndExec.exe %BASE_DIR_1% ".php$" php.bat "-l {}" >> %uniqueFileName%
FindAndExec.exe %BASE_DIR_2% ".php$" php.bat "-l {}" >> %uniqueFileName%
FindAndExec.exe %BASE_DIR_3% ".php$" php.bat "-l {}" >> %uniqueFileName%
FindAndExec.exe %BASE_DIR_4% ".php$" php.bat "-l {}" >> %uniqueFileName%
FindAndExec.exe %BASE_DIR_5% ".php$" php.bat "-l {}" >> %uniqueFileName%

cat %uniqueFileName% | grep -v "No syntax errors detected in"
::beep.bat
