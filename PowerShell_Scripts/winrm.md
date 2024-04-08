# WinRM (Windows Remote Management)

Enable the WS-Management protocol on the local computer, and set up the default configuration for remote management with the command:
winrm quickconfig

Open port 5986 for HTTPS transport to work:
winrm quickconfig -transport:https

### Use the winrm command to locate listeners and the addresses by typing the following command at a command prompt.
```powershell
winrm enumerate winrm/config/listener
```


### To check the state of configuration settings, type the following command.
```powershell
winrm get winrm/config
```


### Add Listener for HTTPS
```powershell
WinRM create winrm/config/Listener?Address=*+Transport=HTTPS '@{Hostname="qwerty.com"; CertificateThumbprint="C834AFE03F665EDE8FA2483105AA8D1B105E588F"}'
```

### Delete Listener for HTTPS
```powershell
WinRM delete winrm/config/Listener?Address=*+Transport=HTTPS
```

https://learn.microsoft.com/en-us/windows/win32/winrm/installation-and-configuration-for-windows-remote-management


### How can I know if I can connect?
```powershell
#On Mac/Linux:
  nc -z -w1 <IP or host name> 5985;echo $?
#On Windows:
  Test-WSMan -ComputerName server001
  Test-WSMan -ComputerName server001 -UseSSL
```
http://www.hurryupandwait.io/blog/understanding-and-troubleshooting-winrm-connection-and-authentication-a-thrill-seekers-guide-to-adventure



Configure policies
https://serverfault.com/questions/777726/winrm-service-is-running-but-cant-be-reached
https://serverfault.com/questions/1002098/winrm-will-not-connect-to-remote-computer-in-my-domain


## How to add more than one machine to the trusted hosts list using winrm
```powershell
Get TrustedHosts
  Get-Item WSMan:\localhost\Client\TrustedHosts
Set TrustedHosts
  Set-Item WSMan:\localhost\Client\TrustedHosts -Value 'machineA,machineB'
```
https://stackoverflow.com/questions/21548566/how-to-add-more-than-one-machine-to-the-trusted-hosts-list-using-winrm