set REDIS_DIR=C:\dev\db\redis\
set PROJECT_DIR_1=C:\Work\project1\
set PROJECT_DIR_2=C:\Work\project2\
set TERMINAL="C:\dev\terminal\ConEmu\ConEmu64.exe"

call set-PHP74.bat

::%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "app-start-server" -cur_console:n
%TERMINAL% -here -dir "%REDIS_DIR%"   -run "start-redis.bat" -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_1%"  -run "php artisan serve --port=8001 " -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_1%"  -run "cmd /k title cmd-crm" -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "php artisan serve --port=8000 " -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "php artisan queue:work -vvv" -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "artisan-dump-server" -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "tail.exe -f storage\logs\query.log" -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "tail.exe -f storage\logs\laravel.log" -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "tinker" -cur_console:n
%TERMINAL% -here -dir "%PROJECT_DIR_2%" -run "cmd /k title cmd-cryp" -cur_console:n

::START /B CMD /C CALL
::call winexec SQLiteSpy.exe "%BACKEND_DIR%var\data.db"
::explorer http://127.0.0.1:8021/
