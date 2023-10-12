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

function Ping-Hosts {
    cl
    $hosts = Read-Host "Enter hostnames or IPs to ping (comma separated)"
    $hostsArray = $hosts -split ","
    foreach ($currentHost in $hostsArray) {
        $result = Test-Connection -ComputerName $currentHost.Trim() -Count 1 -ErrorAction SilentlyContinue
        if ($result) {
            Write-Host "$currentHost is online" -ForegroundColor Green
        } else {
            Write-Host "$currentHost is offline" -ForegroundColor Red
        }
    }
}

function Trace-Route {
    Clear-Host
    $destination = Read-Host "Enter destination hostname or IP for trace route"
    
    $ipVersionChoice = $host.ui.PromptForChoice("IP Version", "Choose the IP version:", @("IPv4", "IPv6", "Both"), 2)
    $useIPv4 = $false
    $useIPv6 = $false
    switch ($ipVersionChoice) {
        0 { $useIPv4 = $true }
        1 { $useIPv6 = $true }
    }
    Clear-Host
    $resolveNames = $true
    if ($host.ui.PromptForChoice("Resolve Names", "Do you want to prevent tracert from resolving names?", @("Yes", "No"), 1) -eq 0) {
        $resolveNames = $false
    }
    Clear-Host
    $timeout = Read-Host "Enter timeout in milliseconds for each reply (default is 4000)"
    if (-not $timeout) { $timeout = 4000 }

    
    $hops = Read-Host "Enter maximum number of hops (default is 10)"
    if (-not $hops) { $hops = 10 }

    $arguments = @()
    if ($useIPv4) { $arguments += "-4" }
    if ($useIPv6) { $arguments += "-6" }
    if (-not $resolveNames) { $arguments += "-d" }
    $arguments += "-w $timeout"
    $arguments += "-h $hops"
    $arguments += $destination
    Clear-Host
    Start-Process tracert -ArgumentList $arguments -NoNewWindow -Wait
}

function Check-PortAvailability {
    Clear-Host
    $server = Read-Host "Enter server name or IP"
    $port = Read-Host "Enter port number"
    $result = Test-NetConnection -ComputerName $server -Port $port -ErrorAction SilentlyContinue
    if ($result.TcpTestSucceeded) {
        Write-Host "Port $port on $server is open" -ForegroundColor Green
    } else {
        Write-Host "Port $port on $server is closed or unreachable" -ForegroundColor Red
    }
}

function PingAndDiagnosticsMenu {
    Clear-Host
    $options = @(
        "Ping Hosts",
        "Trace Route",
        "Check Port Availability",
        "Exit"
    )
    $title = "Ping and Diagnostics Menu"
    $message = "Select an option:"
    $choice = $host.ui.PromptForChoice($title, $message, $options, 0)

    switch ($choice) {
        0 { Ping-Hosts }
        1 { Trace-Route }
        2 { Check-PortAvailability }
        3 { return $false }
    }
    return $true
}

do {
    $continue = PingAndDiagnosticsMenu
    if ($continue) {
        Read-Host "Press Enter to return to menu..."
    }
} while ($continue)