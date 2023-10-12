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

function Get-AdapterName {
    Get-NetAdapter | ForEach-Object { Write-Host "$($_.ifIndex): $($_.Name)" }
    $index = Read-Host "Enter the index of the adapter"
    $adapter = Get-NetAdapter | Where-Object { $_.ifIndex -eq $index }
    return $adapter.Name
}

function Enable-Adapter {
    try {
        $adapterName = Get-AdapterName
        Enable-NetAdapter -Name $adapterName
        Write-Host "Adapter enabled successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error enabling adapter: $_" -ForegroundColor Red
    }
}

function Disable-Adapter {
    try {
        $adapterName = Get-AdapterName
        Disable-NetAdapter -Name $adapterName -Confirm:$false
        Write-Host "Adapter disabled successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error disabling adapter: $_" -ForegroundColor Red
    }
}

function Rename-Adapter {
    try {
        $adapterName = Get-AdapterName
        $newName = Read-Host "Enter the new name for the adapter"
        Rename-NetAdapter -Name $adapterName -NewName $newName
        Write-Host "Adapter renamed successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error renaming adapter: $_" -ForegroundColor Red
    }
}

function Set-AdapterPreference {
    try {
        $adapterName = Get-AdapterName
        $metric = Read-Host "Enter the new metric value (1 - 9999, lower is higher priority)"
        Set-NetIPInterface -InterfaceAlias $adapterName -InterfaceMetric $metric
        Write-Host "Adapter preference updated successfully." -ForegroundColor Green
    } catch {
        Write-Host "Error updating adapter preference: $_" -ForegroundColor Red
    }
}

function NetworkManagementMenu {
    $options = @("Enable Network Adapter", "Disable Network Adapter", "Rename Network Adapter", "Change Adapter Preference Order", "Exit")
    $title = "Network Adapter Management"
    $message = "Select an option:"
    $choice = $host.ui.PromptForChoice($title, $message, $options, 0)
    
    switch ($choice) {
        0 { Enable-Adapter }
        1 { Disable-Adapter }
        2 { Rename-Adapter }
        3 { Set-AdapterPreference }
        4 { return $false }
    }
    return $true
}

do {
    $continue = NetworkManagementMenu
    if ($continue) {
        Read-Host "Press Enter to return to menu..."
    }
} while ($continue)