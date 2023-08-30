Get-ChildItem Cert:\LocalMachine   -Recurse
Get-ChildItem Cert:\CurrentUser\My -Recurse

Get-ChildItem -path 'Cert:\*8c7403300d0fbec9ac419d5f2e3b4175ca91253b' -Recurse | select subject, NotBefore, notafter, Issuer, Thumbprint, HasPrivateKey, SubjectAlternativeName

Get-ChildItem -path 'Cert:\*8c7403300d0fbec9ac419d5f2e3b4175ca91253b' -Recurse | Format-List -Property *

create self signed certificate:
New-SelfSignedCertificate -DnsName 172.20.16.96 -CertStoreLocation Cert:\LocalMachine\My