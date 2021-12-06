@REM @ECHO OFF
@REM PowerShell.exe -Command "& '%~dpn0.ps1'"
@REM PAUSE

@REM #Getting around the ExecutionPolicy#
@REM PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1'"

@REM #Getting Administrator access#
@REM PowerShell.exe -Command "& {Start-Process PowerShell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"

@REM #without the profile entirely#
@REM PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"

@REM #without the profile entirely, without Administrator#
@REM PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1'"

@REM #Without Admin Access#
@REM @ECHO OFF
@REM PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1'"
@REM PAUSE#>

@REM #With Admin Access#
@ECHO OFF
PowerShell.exe -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dpn0.ps1""' -Verb RunAs}"
PAUSE