@echo off
title NetWatch - Network Scanner
color 0E
mode con: cols=80 lines=25
setlocal EnableDelayedExpansion

:: HEADER
cls
echo ==================================================
echo             NetWatch - Network Scanner
echo --------------------------------------------------
echo        Fast scan for devices on your subnet
echo        Created by B0TxS
echo ==================================================
echo.

:: Get local IP and subnet
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do set ip=%%a
set ip=%ip:~1%
for /f "tokens=1-3 delims=." %%a in ("%ip%") do set subnet=%%a.%%b.%%c

echo Local IP Address: %ip%
echo Scanning subnet: %subnet%.0/24 (quick scan)
echo.

:: Quick ping on first 30 IPs
echo Priming ARP cache...
for /l %%i in (1,1,30) do (
    ping -n 1 -w 5 %subnet%.%%i >nul
)

:: Show table header
echo Detected Devices:
echo --------------------------------------------------
echo IP Address        MAC Address        Device Name
echo --------------------------------------------------

:: Parse ARP and resolve hostnames
for /f "skip=3 tokens=1,2,3" %%a in ('arp -a ^| findstr "%subnet%"') do (
    set ip=%%a
    set mac=%%b
    call :resolveName %%a %%b
)

goto end

:resolveName
set ip=%1
set mac=%2
set name=Unknown
for /f "delims=" %%n in ('nbtstat -A %ip% ^| findstr /i "UNIQUE"') do (
    set line=%%n
    for /f "tokens=1,* delims= " %%x in ("!line!") do set name=%%x
)
echo %ip%     %mac%     %name%
goto :eof

:end
echo.
echo Scan complete. Press any key to exit.
pause >nul
exit
