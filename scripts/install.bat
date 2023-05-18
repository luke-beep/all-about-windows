@echo off
net session >nul 2>&1
if %errorlevel% equ 0 (
    echo Please don't run this script as an administrator.
    pause
    exit /b
)

REM Create folders
mkdir %SYSTEMDRIVE%\LukeHjo >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Applications >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Configurations >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Drivers >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Drivers\AMD >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Drivers\NVIDIA >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Drivers\Intel >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Applications\Windows-10 >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Applications\Windows-11 >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Configurations\Windows-10 >nul 2>&1
mkdir %SYSTEMDRIVE%\LukeHjo\Configurations\Windows-11 >nul 2>&1

REM Install Chocolatey and Scoop
echo Installing Chocolatey
powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
echo Installing Scoop
powershell Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
powershell -Command "(irm get.scoop.sh | iex)"
echo Updating scoop
powershell scoop update

set osName=""
for /f "usebackq delims=" %%i in (`powershell -Command "(Get-ComputerInfo -Property 'OsName').OsName"`) do set "osName=%%i"
echo User is running %osName%

REM Install applications
echo %osName% | findstr /C:"11" >nul
if %errorlevel%==0 (
    echo Starting the Windows 11 installation process...
    echo Downloading hellzerg/optimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Optimizer.exe" "https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-15.2.exe"
    echo Downloading auraside/honectrl.bat
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\HoneCtrl.bat" "https://github.com/auraside/HoneCtrl/releases/latest/download/HoneCtrl.bat"
    echo Downloading ProcessLassoSetup64.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\ProcessLassoSetup64.exe" "https://dl.bitsum.com/files/processlassosetup64.exe"
    echo Downloading MSIAfterburnerSetup465.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\MSIAfterburnerSetup465.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/afterburner/[Guru3D.com]-MSIAfterburnerSetup465.zip"
    echo Downloading DDU.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\DDU.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip"
    echo Downloading NVCleanstall.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\NVCleanstall.exe" "https://nl2-dl.techpowerup.com/files/O4wdzP-iUQTNqcH1y7NmOw/1684466823/NVCleanstall_1.15.1.exe"
    echo Downloading GPU-Z.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\GPU-Z.exe" "https://nl2-dl.techpowerup.com/files/ouwXl8riPGe6AOaiCw7mZQ/1684466864/GPU-Z.2.53.0.exe"
    echo Downloading CPU-Z-Portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Portable.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.zip"
    echo Downloading CPU-Z-Setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Setup.exe" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.exe"
    echo Downloading WPD.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\WPD.zip" "https://wpd.app/get/latest.zip"
    echo Downloading MicaForEveryone-x64-Release.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Windows-11\MicaForEveryone-x64-Release.exe" "https://github.com/MicaForEveryone/MicaForEveryone/releases/latest/download/MicaForEveryone-x64-Release-Installer.exe"
    echo Downloading wiztree_4_13_portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_portable.zip" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_portable.zip"
    echo Downloading wiztree_4_13_setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_setup.exe" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_setup.exe"
    echo Downloading TCPOptimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\TCPOptimizer.exe" "https://www.speedguide.net/files/TCPOptimizer.exe"
    echo Downloading BloatyNosyApp.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Windows-11\BloatyNosyApp.zip" "https://github.com/builtbybel/BloatyNosy/releases/latest/download/BloatyNosyApp.zip"
    echo Downloading StartAllBack_3.6.4_setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Windows-11\StartAllBack_3.6.4_setup.exe" "https://startisback.sfo3.cdn.digitaloceanspaces.com/StartAllBack_3.6.4_setup.exe"
    echo Downloading MicaForEveryone.conf
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\Windows-11\MicaForEveryone.conf" "https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/MicaForEveryone.conf"
    echo Downloading Powerplan_LukeHjo2611.pow
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\Powerplan_LukeHjo2611.pow" "https://github.com/luke-beep/guide-to-optimizing-windows/blob/main/configurations/Powerplan_LukeHjo2611.pow"
    echo Downloading ProcessLasso_LukeHjo2611.INI
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\ProcessLasso_LukeHjo2611.INI" "https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/ProcessLasso_LukeHjo2611.INI"
    echo Downloading LukeHjo_531.79.exe. WARNING: this might take a while.
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\NVIDIA\LukeHjo_531.79.exe" "https://media.githubusercontent.com/media/luke-beep/guide-to-optimizing-windows/main/drivers/LukeHjo_531.79.exe"
    echo Downloading amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe
    echo Skipping, the file is corrupted and cannot be downloaded.
    echo Downloading installer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\Intel\installer.exe" "https://dsadata.intel.com/installer"
    ) else (
    echo Starting the Windows 10 installation process...
    echo Downloading hellzerg/optimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Optimizer.exe" "https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-15.2.exe"
    echo Downloading auraside/honectrl.bat
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\HoneCtrl.bat" "https://github.com/auraside/HoneCtrl/releases/latest/download/HoneCtrl.bat"
    echo Downloading ProcessLassoSetup64.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\ProcessLassoSetup64.exe" "https://dl.bitsum.com/files/processlassosetup64.exe"
    echo Downloading MSIAfterburnerSetup465.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\MSIAfterburnerSetup465.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/afterburner/[Guru3D.com]-MSIAfterburnerSetup465.zip"
    echo Downloading DDU.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\DDU.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip"
    echo Downloading NVCleanstall.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\NVCleanstall.exe" "https://nl2-dl.techpowerup.com/files/O4wdzP-iUQTNqcH1y7NmOw/1684466823/NVCleanstall_1.15.1.exe"
    echo Downloading GPU-Z.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\GPU-Z.exe" "https://nl2-dl.techpowerup.com/files/ouwXl8riPGe6AOaiCw7mZQ/1684466864/GPU-Z.2.53.0.exe"
    echo Downloading CPU-Z-Portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Portable.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.zip"
    echo Downloading CPU-Z-Setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Setup.exe" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.exe"
    echo Downloading WPD.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\WPD.zip" "https://wpd.app/get/latest.zip"
    echo Downloading wiztree_4_13_portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_portable.zip" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_portable.zip"
    echo Downloading wiztree_4_13_setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_setup.exe" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_setup.exe"
    echo Downloading TCPOptimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\TCPOptimizer.exe" "https://www.speedguide.net/files/TCPOptimizer.exe"
    echo Downloading Powerplan_LukeHjo2611.pow
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\Powerplan_LukeHjo2611.pow" "https://github.com/luke-beep/guide-to-optimizing-windows/blob/main/configurations/Powerplan_LukeHjo2611.pow"
    echo Downloading ProcessLasso_LukeHjo2611.INI
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\ProcessLasso_LukeHjo2611.INI" "https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/ProcessLasso_LukeHjo2611.INI"
    echo Downloading LukeHjo_531.79.exe. WARNING: this might take a while.
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\NVIDIA\LukeHjo_531.79.exe" "https://media.githubusercontent.com/media/luke-beep/guide-to-optimizing-windows/main/drivers/LukeHjo_531.79.exe"
    echo Downloading amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe
    echo Skipping, the file is corrupted and cannot be downloaded.
    echo Downloading installer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\Intel\installer.exe" "https://dsadata.intel.com/installer"
)

REM Open folder
start "LukeHjo" "%SYSTEMDRIVE%\LukeHjo"
