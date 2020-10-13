Import-Module .\script.ps1
SetTimezone
InstallInno
InstallMiktex
InstallRtoolsExe
Invoke-WebRequest $env:MKL_LICENSE_FILE -OutFile $env:LICLOCAL
C:\rtools40\usr\bin\bash --login -c "./full-build.sh"
