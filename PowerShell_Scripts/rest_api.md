
## Download file by link
```powershell
$url = "https://www.foo.bar/foobar.bin"
$dest = "C:\temp\testfiles.bin"
Invoke-RestMethod -Uri $url -OutFile $dest
```


## Invoke POST request
```powershell
$link = "https://www.foo.bar/api/foobar"
$json_body = '{"foo": "bar"}'
Invoke-WebRequest -UseBasicParsing $link -ContentType "application/json" -Method POST -Body $json_body
[Console]::ReadKey()
```


## Invoke GET request
```powershell
$link = "https://www.foo.bar/api/foobar"
Invoke-WebRequest -UseBasicParsing $link -Method GET
```

