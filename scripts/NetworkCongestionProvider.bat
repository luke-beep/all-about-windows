@echo off
cls

:menu
echo Choose an action:
echo.
echo 1) Show current CongestionProvider
echo 2) Set to BBRv2
echo 3) Set to New-Reno
echo 4) Set to CUBIC
echo 5) Set to CTCP
echo 6) Exit
echo.
set /p choice=Enter your choice: 

if "%choice%"=="1" goto ShowCurrent
if "%choice%"=="2" goto BBRv2
if "%choice%"=="3" goto NewReno
if "%choice%"=="4" goto CUBIC
if "%choice%"=="5" goto CTCP
if "%choice%"=="6" exit

goto menu

:ShowCurrent
cls
echo Current CongestionProvider Settings:
echo -------------------------------------
powershell -command "Get-NetTCPSetting | Select SettingName, CongestionProvider | Format-Table -AutoSize"
echo -------------------------------------
pause
cls
goto menu

:BBRv2
cls
netsh int tcp set supplemental Template=Internet CongestionProvider=bbr2
netsh int tcp set supplemental Template=Datacenter CongestionProvider=bbr2
netsh int tcp set supplemental Template=Compat CongestionProvider=bbr2
netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=bbr2
netsh int tcp set supplemental Template=InternetCustom CongestionProvider=bbr2
goto end

:NewReno
cls
netsh int tcp set supplemental Template=Internet CongestionProvider=NewReno
netsh int tcp set supplemental Template=Datacenter CongestionProvider=NewReno
netsh int tcp set supplemental Template=Compat CongestionProvider=NewReno
netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=NewReno
netsh int tcp set supplemental Template=InternetCustom CongestionProvider=NewReno
goto end

:CUBIC
cls
netsh int tcp set supplemental template=internet congestionprovider=CUBIC
netsh int tcp set supplemental template=internetcustom congestionprovider=CUBIC
netsh int tcp set supplemental Template=Compat CongestionProvider=CUBIC
netsh int tcp set supplemental template=Datacenter congestionprovider=CUBIC
netsh int tcp set supplemental template=Datacentercustom congestionprovider=CUBIC
goto end

:CTCP
cls
netsh int tcp set supplemental template=internet congestionprovider=CTCP
netsh int tcp set supplemental template=internetcustom congestionprovider=CTCP
netsh int tcp set supplemental Template=Compat CongestionProvider=CTCP
netsh int tcp set supplemental template=Datacenter congestionprovider=CTCP
netsh int tcp set supplemental template=Datacentercustom congestionprovider=CTCP
goto end

:end
echo.
echo Operation completed! Press any key to return to the menu...
pause > nul
cls
goto menu