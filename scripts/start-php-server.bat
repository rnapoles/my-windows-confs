@echo off
set freePort=
set startPort=5001

:SEARCHPORT
netstat -o -n -a | find "LISTENING" | find ":%startPort% " > NUL
if "%ERRORLEVEL%" equ "0" (
  echo "port unavailable %startPort%"
  set /a startPort +=1
  GOTO :SEARCHPORT
) ELSE (
  echo "port available %startPort%"
  set freePort=%startPort%
  GOTO :FOUNDPORT
)

:FOUNDPORT
echo free %freePort%

explorer http://127.0.0.1:%freePort%
php -S 127.0.0.1:%freePort% %1