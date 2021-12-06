Write-Output 'Custom PowerShell profile in effect!'

<# as being from an external source, sets the Zone.Identifie, Windows will think the file came from the Internet #>
Add-Content -Path '.\MyScript.ps1' -Value "[ZoneTransfer]`nZoneId=3" -Stream 'Zone.Identifier'
<# reversed #>
Clear-Content -Path '.\MyScript.ps1' -Stream 'Zone.Identifier'

if (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{Write-Output 'Running as Administrator!'}
else
{Write-Output 'Running Limited!'}
Pause