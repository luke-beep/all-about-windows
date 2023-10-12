$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

if (-not ($myWindowsPrincipal.IsInRole($adminRole)))
{
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell"
   $newProcess.Arguments = "-ExecutionPolicy Bypass -NoProfile -File `"$($myInvocation.MyCommand.Path)`""
   $newProcess.Verb = "runas"
   [System.Diagnostics.Process]::Start($newProcess)
   exit
}

function Install-Iperf3 {
    if (-not (Get-Command iperf3 -ErrorAction SilentlyContinue)) {
        $iperfUrl = "https://files.budman.pw/iperf3.14_64.zip"
        $downloadPath = "$env:TEMP\iperf3.14_64.zip"
        $extractPath = "$env:TEMP\iperf3"
        $permanentLocation = "C:\iperf3"
        $permanentExecutable = "C:\iperf3\iperf3.14_64"

        Invoke-WebRequest -Uri $iperfUrl -OutFile $downloadPath > $null 2>&1
        Expand-Archive -Path $downloadPath -DestinationPath $extractPath > $null 2>&1

        if (-not (Test-Path $permanentLocation)) {
            New-Item -Path $permanentLocation -ItemType Directory > $null 2>&1
        }
        Move-Item -Path "$extractPath\iperf3.14_64" -Destination $permanentLocation > $null 2>&1

        $envPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
        $newPath = "$envPath;$permanentExecutable"
        [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine) > $null 2>&1

        Write-Host "iperf3 downloaded, extracted, and added to system PATH" -ForegroundColor Green
    } else {
        Write-Host "iperf3 is already installed." -ForegroundColor Yellow
    }
}

function Run-Iperf3-Test {
Clear-Host
$mainMenuChoices = @(
    'Europe',
    'Asia',
    'Oceania',
    'Americas',
    'Custom'
)

$regionIndex = $host.ui.PromptForChoice("Select a Region", "Please select a region:", $mainMenuChoices, 0)
Clear-Host
switch ($regionIndex) {
    0 {
        $europeServers = @(
            @{Name="iperf.par2.as49434.net"; Port=9200},
            @{Name="paris.testdebit.info"; Port=9200},
            @{Name="speed.as208196.net"; Port=5200},
            @{Name="speedtest.serverius.net"; Port=5002},
            @{Name="nl.iperf.014.fr"; Port=10415},
            @{Name="ch.iperf.014.fr"; Port=15315},
            @{Name="iperf.eenet.ee"; Port=5201},
            @{Name="iperf.astra.in.ua"; Port=5201},
            @{Name="iperf.volia.net"; Port=5201}
        )
        $serverIndex = $host.ui.PromptForChoice("Select a Server", "You selected Europe. Please select a server:", ($europeServers | ForEach-Object { $_.Name }), 0)
    }
    1 { 
        $asiaServers = @(
            @{Name="speedtest.uztelecom.uz"; Port=5200},
            @{Name="iperf.it-north.net"; Port=5200},
            @{Name="iperf.biznetnetworks.com"; Port=5201}
        )
        $serverIndex = $host.ui.PromptForChoice("Select a Server", "You selected Asia. Please select a server:", ($asiaServers | ForEach-Object { $_.Name }), 0)
    }
    2 { 
        $oceaniaServers = @(
            @{Name="speedtest-iperf-akl.vetta.online"; Port=5200}
        )
        $serverIndex = $host.ui.PromptForChoice("Select a Server", "You selected Oceania. Please select a server:", ($oceaniaServers | ForEach-Object { $_.Name }), 0)
    }
    3 { 
        $americasServers = @(
            @{Name="iperf.scottlinux.com"; Port=5201},
            @{Name="iperf.he.net"; Port=5201}
        )
        $serverIndex = $host.ui.PromptForChoice("Select a Server", "You selected Americas. Please select a server:", ($americasServers | ForEach-Object { $_.Name }), 0)
    }
    4 {
        $customServer = Read-Host "IP address"
        $customPort = Read-Host "Port"
    }
}
$serverAddress = "";
$serverPort = "";
Clear-Host
switch ($regionIndex) {
    0 { 
        Write-Host "You selected: $($mainMenuChoices[$regionIndex]) -> $($europeServers[$serverIndex].Name):$($europeServers[$serverIndex].Port)" 
        $serverAddress = $europeServers[$serverIndex].Name
        $serverPort = $europeServers[$serverIndex].Port
    }
    1 { 
        Write-Host "You selected: $($mainMenuChoices[$regionIndex]) -> $($asiaServers[$serverIndex].Name):$($asiaServers[$serverIndex].Port)"
        $serverAddress = $asiaServers[$serverIndex].Name        
        $serverPort = $asiaServers[$serverIndex].Port
    }
    2 { 
        Write-Host "You selected: $($mainMenuChoices[$regionIndex]) -> $($oceaniaServers[$serverIndex].Name):$($oceaniaServers[$serverIndex].Port)" 
        $serverAddress = $oceaniaServers[$serverIndex].Name
        $serverPort = $oceaniaServers[$serverIndex].Port
    }
    3 { 
        Write-Host "You selected: $($mainMenuChoices[$regionIndex]) -> $($americasServers[$serverIndex].Name):$($americasServers[$serverIndex].Port)" 
        $serverAddress = $americasServers[$serverIndex].Name
        $serverPort = $americasServers[$serverIndex].Port
    }
    4 {
    Write-Host "You selected: $($customServer):$($customPort)"
        $serverAddress = $customServer
        $serverPort = $customPort
    }
}
Write-Host " "
$interval = Read-Host "Enter the interval in seconds (e.g., 1, 2, 5, etc.)"
$threads = Read-Host "Enter the amount of threads that'll be used (e.g. 1, 2, 5, etc.)"
Clear-Host
if ($serverAddress) {
    $testModes = @("TCP", "UDP", "Reverse", "Bidirectional")
    $testModeChoice = $host.ui.PromptForChoice("Select Test Mode", "Please select a test mode:", $testModes, 0)
    $iperfArgs = @("-c", $serverAddress, "-p", $serverPort, "-i", $interval, "-P", $threads)

    switch ($testModeChoice) {
        0 { }
        1 { $iperfArgs += "-u" }
        2 { $iperfArgs += "-R" }
        3 { $iperfArgs += "--bidir" }
    }
    Start-Process -NoNewWindow -FilePath "iperf3" -ArgumentList $iperfArgs
} else {
    Write-Host "No server selected or invalid selection."
}

}

function IperfMenu {
    Clear-Host
    $options = @(
        "Start",
        "Exit"
    )
    $title = "Bandwidth Diagnostics Menu"
    $message = "Select an option:"
    $choice = $host.ui.PromptForChoice($title, $message, $options, 0)
    switch ($choice) {
        0 { Run-Iperf3-Test }
        1 { return $false }
    }
    return $true

}

Install-Iperf3

do {
    $continue = IperfMenu
    if ($continue) {
        Read-Host "Press Enter to return to menu..."
    }
} while ($continue)