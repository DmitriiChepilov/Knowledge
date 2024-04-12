```powershell
Get-ChildItem Cert:\LocalMachine   -Recurse
Get-ChildItem Cert:\CurrentUser\My -Recurse
```

```powershell
Get-ChildItem -path 'Cert:\*8c7403300d0fbec9ac419d5f2e3b4175ca91253b' -Recurse | select subject, NotBefore, notafter, Issuer, Thumbprint, HasPrivateKey, SubjectAlternativeName
```

```powershell
Get-ChildItem -path 'Cert:\*8c7403300d0fbec9ac419d5f2e3b4175ca91253b' -Recurse | Format-List -Property *
```

## Create self signed certificate
```powershell
New-SelfSignedCertificate -DnsName 172.20.16.96 -CertStoreLocation Cert:\LocalMachine\My
```