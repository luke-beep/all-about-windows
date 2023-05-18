@echo off

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
powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
powershell Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
powershell -Command "(irm get.scoop.sh | iex)"
powershell scoop update

set osName=""
for /f "usebackq delims=" %%i in (`powershell -Command "(Get-ComputerInfo -Property 'OsName').OsName"`) do set "osName=%%i"
echo %osName%

REM Install applications
echo %osName% | findstr /C:"11" >nul
if %errorlevel%==0 (
    echo Running Windows 11 
    echo Installing hellzerg/optimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Optimizer.exe" "https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-15.2.exe"
    echo Installing auraside/honectrl.bat
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\HoneCtrl.bat" "https://github.com/auraside/HoneCtrl/releases/latest/download/HoneCtrl.bat"
    echo Installing ProcessLassoSetup64.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\ProcessLassoSetup64.exe" "https://dl.bitsum.com/files/processlassosetup64.exe"
    echo Installing MSIAfterburnerSetup465.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\MSIAfterburnerSetup465.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/afterburner/[Guru3D.com]-MSIAfterburnerSetup465.zip"
    echo Installing DDU.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\DDU.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip"
    echo Installing NVCleanstall.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\NVCleanstall.exe" "https://nl2-dl.techpowerup.com/files/O4wdzP-iUQTNqcH1y7NmOw/1684466823/NVCleanstall_1.15.1.exe"
    echo Installing GPU-Z.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\GPU-Z.exe" "https://nl2-dl.techpowerup.com/files/ouwXl8riPGe6AOaiCw7mZQ/1684466864/GPU-Z.2.53.0.exe"
    echo Installing CPU-Z-Portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Portable.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.zip"
    echo Installing CPU-Z-Setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Setup.exe" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.exe"
    echo Installing WPD.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\WPD.zip" "https://wpd.app/get/latest.zip"
    echo Installing wiztree_4_13_portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_portable.zip" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_portable.zip"
    echo Installing wiztree_4_13_setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_setup.exe" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_setup.exe"
    echo Installing TCPOptimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\TCPOptimizer.exe" "https://www.speedguide.net/files/TCPOptimizer.exe"
    echo Installing BloatyNosyApp.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Windows-11\BloatyNosyApp.zip" "https://github.com/builtbybel/BloatyNosy/releases/latest/download/BloatyNosyApp.zip"
    echo Installing StartAllBack_3.6.4_setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Windows-11\StartAllBack_3.6.4_setup.exe" "https://startisback.sfo3.cdn.digitaloceanspaces.com/StartAllBack_3.6.4_setup.exe"
    echo Installing MicaForEveryone.conf
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\Windows-11\MicaForEveryone.conf" "https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/MicaForEveryone.conf"
    echo Installing Powerplan_LukeHjo2611.pow
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\Powerplan_LukeHjo2611.pow" "https://github.com/luke-beep/guide-to-optimizing-windows/blob/main/configurations/Powerplan_LukeHjo2611.pow"
    echo Installing ProcessLasso_LukeHjo2611.INI
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\ProcessLasso_LukeHjo2611.INI" "https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/ProcessLasso_LukeHjo2611.INI"
    echo Installing LukeHjo_531.79.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\NVIDIA\LukeHjo_531.79.exe" "https://media.githubusercontent.com/media/luke-beep/guide-to-optimizing-windows/main/drivers/LukeHjo_531.79.exe"
    echo Installing amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\AMD\amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe" "https://drivers.amd.com/drivers/installer/22.40/whql/amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe"
    echo Installing installer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\Intel\installer.exe" "https://dsadata.intel.com/installer"
    ) else (
    echo Running Windows 10
    echo Installing hellzerg/optimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\Optimizer.exe" "https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-15.2.exe"
    echo Installing auraside/honectrl.bat
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\HoneCtrl.bat" "https://github.com/auraside/HoneCtrl/releases/latest/download/HoneCtrl.bat"
    echo Installing ProcessLassoSetup64.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\ProcessLassoSetup64.exe" "https://dl.bitsum.com/files/processlassosetup64.exe"
    echo Installing MSIAfterburnerSetup465.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\MSIAfterburnerSetup465.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/afterburner/[Guru3D.com]-MSIAfterburnerSetup465.zip"
    echo Installing DDU.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\DDU.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/[Guru3D.com]-DDU.zip"
    echo Installing NVCleanstall.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\NVCleanstall.exe" "https://nl2-dl.techpowerup.com/files/O4wdzP-iUQTNqcH1y7NmOw/1684466823/NVCleanstall_1.15.1.exe"
    echo Installing GPU-Z.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\GPU-Z.exe" "https://nl2-dl.techpowerup.com/files/ouwXl8riPGe6AOaiCw7mZQ/1684466864/GPU-Z.2.53.0.exe"
    echo Installing CPU-Z-Portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Portable.zip" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.zip"
    echo Installing CPU-Z-Setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\CPU-Z-Setup.exe" "https://download.cpuid.com/cpu-z/cpu-z_2.05-en.exe"
    echo Installing WPD.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\WPD.zip" "https://wpd.app/get/latest.zip"
    echo Installing wiztree_4_13_portable.zip
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_portable.zip" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_portable.zip"
    echo Installing wiztree_4_13_setup.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\wiztree_4_13_setup.exe" "https://antibodysoftware-17031.kxcdn.com/files/20230315/wiztree_4_13_setup.exe"
    echo Installing TCPOptimizer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Applications\TCPOptimizer.exe" "https://www.speedguide.net/files/TCPOptimizer.exe"
    echo Installing Powerplan_LukeHjo2611.pow
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\Powerplan_LukeHjo2611.pow" "https://github.com/luke-beep/guide-to-optimizing-windows/blob/main/configurations/Powerplan_LukeHjo2611.pow"
    echo Installing ProcessLasso_LukeHjo2611.INI
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Configurations\ProcessLasso_LukeHjo2611.INI" "https://raw.githubusercontent.com/luke-beep/guide-to-optimizing-windows/main/configurations/ProcessLasso_LukeHjo2611.INI"
    echo Installing LukeHjo_531.79.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\NVIDIA\LukeHjo_531.79.exe" "https://media.githubusercontent.com/media/luke-beep/guide-to-optimizing-windows/main/drivers/LukeHjo_531.79.exe"
    echo Installing amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\AMD\amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe" "https://drivers.amd.com/drivers/installer/22.40/whql/amd-software-adrenalin-edition-23.4.3-minimalsetup-230427_web.exe"
    echo Installing installer.exe
    curl -g -L -# -o "%SYSTEMDRIVE%\LukeHjo\Drivers\Intel\installer.exe" "https://dsadata.intel.com/installer"
)

REM Open folder
start "LukeHjo" "%SYSTEMDRIVE%\LukeHjo"
