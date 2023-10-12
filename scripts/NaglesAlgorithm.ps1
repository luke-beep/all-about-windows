$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)
$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator
if ($myWindowsPrincipal.IsInRole($adminRole))
{
   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
   $Host.UI.RawUI.BackgroundColor = "DarkBlue"
   clear-host
}
else
{
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);
   exit
}

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser

$UserChoice = Read-Host -Prompt 'Type "1" to disable Nagle`s Algorithm or "0" to enable it'
$NetAdapterGUIDs = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | ForEach-Object { $_.InterfaceGuid }
foreach($NetAdapterGUID in $NetAdapterGUIDs)
{
    $RegPath = "HKLM:\SYSTEM\CurrentControlSet\services\Tcpip\Parameters\Interfaces\$NetAdapterGUID"
    if(Test-Path $RegPath)
    {
        $CurrentTcpAckFrequency = Get-ItemPropertyValue -Path $RegPath -Name "TcpAckFrequency"
        $CurrentTCPNoDelay = Get-ItemPropertyValue -Path $RegPath -Name "TCPNoDelay"
        Write-Host "Old | Current TcpAckFrequency is $CurrentTcpAckFrequency for $RegPath"
        Write-Host "Old | Current TCPNoDelay is $CurrentTCPNoDelay for $RegPath"

        Set-ItemProperty -Path $RegPath -Name "TcpAckFrequency" -Value $UserChoice
        Write-Host "New | Set TcpAckFrequency to $UserChoice for $RegPath"
        Set-ItemProperty -Path $RegPath -Name "TCPNoDelay" -Value $UserChoice
        Write-Host "New | Set TCPNoDelay to $UserChoice for $RegPath"
    }
    else
    {
        Write-Host "Could not find registry path $RegPath"
    }
}
pause