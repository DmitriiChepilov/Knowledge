# create credentials
$username = "$(DeployUserName)"
$password = ConvertTo-SecureString "$(DeployUserPassword)" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList ($username, $password)

#create session
$session = New-PSSession -ComputerName $(Machine) -Credential $cred -UseSSL

#copy archive
$pathToZipFile = "myProject\drop\$(Project.Name).zip"
Copy-Item -Path $pathToZipFile -Destination "C:\Install" -ToSession $session -Verbose

#copy versionInfo.json
$pathToVersionInfo = "myProject\drop\versionInfo.$(Project.WebsiteName).json"
Copy-Item -Path $pathToVersionInfo -Destination "C:\Install" -ToSession $session -Verbose

$session | Remove-PSSession