Import-Module .\script.ps1
SetTimezone
InstallInno
InstallMiktex
InstallRtoolsExe
Invoke-WebRequest $env:MKL_LICENSE_FILE -OutFile $env:LICLOCAL
