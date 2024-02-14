::accesschk %USERNAME% %*
::pause
::RunAdmin.exe "takeown.exe /D S /R /F %*" Administrador 0x41ebx1/*
::wmic group get name,sid
icacls %* /q /c /t /reset

