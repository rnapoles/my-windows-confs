@echo off

rem Set the serial port and baud rate
set SERIAL_PORT=%1
set BAUD_RATE=9600

rem Set the command to send
set COMMAND=Alive

rem Path to plink.exe
set PLINK_PATH=plink.exe

rem Create a temporary script file
echo. > temp_script.txt
echo SEND %COMMAND% > temp_script.txt

rem Use plink.exe to connect to the serial port
%PLINK_PATH% -serial %SERIAL_PORT% -sercfg %BAUD_RATE%

rem Remove the temporary script file
del temp_script.txt