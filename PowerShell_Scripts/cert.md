## 1. List of certificates

```powershell
# show all certificates
Get-ChildItem Cert:\LocalMachine   -Recurse
Get-ChildItem Cert:\CurrentUser\My -Recurse

# individual cert. v1
Get-ChildItem -path 'Cert:\*8c7403300d0fbec9ac419d5f2e3b4175ca91253b' -Recurse | select subject, NotBefore, notafter, Issuer, Thumbprint, HasPrivateKey, SubjectAlternativeName

# individual cert. v2
Get-ChildItem -path 'Cert:\*8c7403300d0fbec9ac419d5f2e3b4175ca91253b' -Recurse | Format-List -Property *
```

## 2. Create self signed certificate

```powershell
New-SelfSignedCertificate -DnsName 172.20.16.96 -CertStoreLocation Cert:\LocalMachine\My
```

## 3. Update cert for WinRM

```powershell
# удаляем существующий Listener для HTTPS
WinRM delete winrm/config/Listener?Address=*+Transport=HTTPS

# создаём Listener для HTTPS с новым отпечатком (8e92d81ba1cda0f55dd28d3e854768aa87201545)
WinRM create winrm/config/Listener?Address=*+Transport=HTTPS '@{CertificateThumbprint="8e92d81ba1cda0f55dd28d3e854768aa87201545"}'
```
