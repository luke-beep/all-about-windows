@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
ipconfig /all > ipconfig_backup.txt
set logFile=network_reset_log.txt
echo [%date% %time%] Starting network reset > %logFile%
:checkError
if %ERRORLEVEL% neq 0 (
    echo Failed on %~1
    echo [%date% %time%] Failed on %~1 >> %logFile%
    pause
    exit /b %ERRORLEVEL%
) else (
    echo [%date% %time%] Successfully executed %~1 >> %logFile%
)
echo Resetting Network Configurations...
route -f
call :checkError "route -f"
ipconfig /release
call :checkError "ipconfig /release"
ipconfig /renew
call :checkError "ipconfig /renew"
ipconfig /flushdns
call :checkError "ipconfig /flushdns"
ipconfig /registerdns
call :checkError "ipconfig /registerdns"
netsh int ip delete arpcache
call :checkError "netsh int ip delete arpcache"
netsh int ip delete destinationcache
call :checkError "netsh int ip delete destinationcache"
netsh int ip delete neighbors
call :checkError "netsh int ip delete neighbors"
fsutil resource setautoreset true C:\
call :checkError "fsutil resource setautoreset true C:\"
netsh int ip reset resetlog.txt
call :checkError "netsh int ip reset resetlog.txt"
netsh int ip reset all
call :checkError "netsh int ip reset all"
netsh int ipv4 reset all
call :checkError "netsh int ipv4 reset all"
netsh int ipv6 reset all
call :checkError "netsh int ipv6 reset all"
netsh int httpstunnel reset all
call :checkError "netsh int httpstunnel reset all"
netsh int portproxy reset all
call :checkError "netsh int portproxy reset all"
netsh int tcp reset all
call :checkError "netsh int tcp reset all"
netsh winsock reset all
call :checkError "netsh winsock reset all"
netsh advfirewall reset
call :checkError "netsh advfirewall reset"
arp -d *
call :checkError "arp -d *"
nbtstat -R
call :checkError "nbtstat -R"
nbtstat -RR
call :checkError "nbtstat -RR"
netsh winhttp reset proxy
call :checkError "netsh winhttp reset proxy"
netsh wlan delete profile name=*
call :checkError "netsh wlan delete profile name=*"
netsh branchcache reset
call :checkError "netsh branchcache reset"
for /f "tokens=*" %%a in ('netsh interface show interface ^| findstr /C:"Enabled"') do netsh interface set interface "%%a" admin=disable
call :checkError "for /f "tokens=*" %%a in ('netsh interface show interface ^| findstr /C:"Enabled"') do netsh interface set interface "%%a" admin=disable"
for /f "tokens=*" %%a in ('netsh interface show interface ^| findstr /C:"Disabled"') do netsh interface set interface "%%a" admin=enable
call :checkError "for /f "tokens=*" %%a in ('netsh interface show interface ^| findstr /C:"Disabled"') do netsh interface set interface "%%a" admin=enable"
netsh interface ip delete dnsservers "Local Area Connection" all
call :checkError "netsh interface ip delete dnsservers "Local Area Connection" all"
net stop nlasvc && net start nlasvc
call :checkError "net stop nlasvc && net start nlasvc"
netsh interface ip set address "Local Area Connection" dhcp
call :checkError "netsh interface ip set address "Local Area Connection" dhcp"
netsh interface tcp set global autotuninglevel=normal
call :checkError "netsh interface tcp set global autotuninglevel=normal"
net stop lanmanworkstation && net start lanmanworkstation
call :checkError "net stop lanmanworkstation && net start lanmanworkstation"
net stop lanmanserver && net start lanmanserver
call :checkError "net stop lanmanserver && net start lanmanserver"
echo All commands executed successfully!
pause
exit /b 0