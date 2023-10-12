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


function Set-CloudflareDNS {
    $interface = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
    Set-DnsClientServerAddress -InterfaceIndex $interface.ifIndex -ServerAddresses ("1.1.1.1", "1.0.0.1", "2606:4700::1111", "2606:4700:4700::1001")
}

function Set-GoogleDNS {
    $interface = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
    Set-DnsClientServerAddress -InterfaceIndex $interface.ifIndex -ServerAddresses ("8.8.8.8", "8.8.4.4", "2001:4860:4860::8888", "2001:4860:4860::8844")
}

function Set-Quad9DNS {
    $interface = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }
    Set-DnsClientServerAddress -InterfaceIndex $interface.ifIndex -ServerAddresses ("9.9.9.9", "149.112.112.112", "2620:fe::fe", "2620:fe::9")
}

function Set-DNSServers {
    Get-CurrentDNSSettings
    $choice = $host.ui.PromptForChoice("Select DNS Provider", "Choose your DNS provider:", @("Cloudflare", "Google", "Quad9"), 0)
    switch ($choice) {
        0 { Set-CloudflareDNS }
        1 { Set-GoogleDNS }
        2 { Set-Quad9DNS }
    }
}

function Get-CurrentDNSSettings {
    $interface = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

    $dnsSettings = Get-DnsClientServerAddress -InterfaceIndex $interface.ifIndex

    Write-Output "Current DNS Servers for $($interface.Name):"
    $dnsSettings.ServerAddresses | ForEach-Object {
        Write-Output $_
    }
}

Set-DNSServers