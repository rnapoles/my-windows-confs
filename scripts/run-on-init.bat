@echo off
::explorer C:\Programas\utils\rbtray\RBTray.exe
::explorer %~dp0.\BatteryInfoNotify.exe
call winexec "C:\dev\utils\ClipX\clipx.exe"
explorer "C:\Windows\System32\Taskmgr.exe"
call run-cmd-admin.bat
call winexec  "C:\dev\terminal\ConEmu\ConEmu64.exe" -SetDefTerm -Detached -MinTSA
::call winexec "C:\Programas\system\ConEmu\ConEmu64.exe"
::explorer "C:\Windows\System32\cmd.exe"