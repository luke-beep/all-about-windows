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

function Add-HostsEntry {
    Clear-Host
    $hostname = Read-Host "Enter the hostname (e.g., example.com)"
    $ipAddress = Read-Host "Enter the IP address (e.g., 192.168.1.1)"

    try {
        Add-Content -Path $env:windir\System32\drivers\etc\hosts -Value "$ipAddress`t$hostname"
        Write-Host "Entry added successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error adding entry: $_" -ForegroundColor Red
    }
}

function Remove-HostsEntry {
    Clear-Host
    $hostname = Read-Host "Enter the hostname to remove"

    try {
        $content = Get-Content -Path $env:windir\System32\drivers\etc\hosts
        $content = $content | Where-Object { $_ -notmatch $hostname }
        $content | Set-Content -Path $env:windir\System32\drivers\etc\hosts
        Write-Host "Entry removed successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error removing entry: $_" -ForegroundColor Red
    }
}

function Modify-HostsEntry {
    Clear-Host
    $oldHostname = Read-Host "Enter the existing hostname to modify"
    $newHostname = Read-Host "Enter the new hostname"
    $newIpAddress = Read-Host "Enter the new IP address"

    try {
        $content = Get-Content -Path $env:windir\System32\drivers\etc\hosts
        $content = $content | ForEach-Object {
            if ($_ -match $oldHostname) {
                "$newIpAddress`t$newHostname"
            } else {
                $_
            }
        }
        $content | Set-Content -Path $env:windir\System32\drivers\etc\hosts
        Write-Host "Entry modified successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error modifying entry: $_" -ForegroundColor Red
    }
}

function List-HostsEntries {
    Clear-Host
    $entries = Get-Content -Path $env:windir\System32\drivers\etc\hosts | Where-Object { $_ -notmatch "^#" -and $_.Trim() -ne "" }
    Write-Host $entries
}

function HostsFileMenu {
    Clear-Host
    $options = @(
        "List Hosts Entries",
        "Add Hosts Entry",
        "Remove Hosts Entry",
        "Modify Hosts Entry",
        "Exit Hosts Management"
    )
    $title = "Hosts File Management"
    $message = "Select an option:"
    $choice = $host.ui.PromptForChoice($title, $message, $options, 0)

switch ($choice) {
    0 { List-HostsEntries }
    1 { Add-HostsEntry }
    2 { Remove-HostsEntry }
    3 { Modify-HostsEntry }
    4 { return $false }
}
    return $true
}

do {
    $continue = HostsFileMenu
    if ($continue) {
        Read-Host "Press Enter to return to Hosts File menu..."
    }
} while ($continue)