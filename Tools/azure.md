
List of all refs
https://learn.microsoft.com/en-us/rest/api/azure/devops/git/refs/list?view=azure-devops-rest-5.0&tabs=HTTP


## Control Options > Custom condition
```cs
and(succeeded(), eq(variables.Environment, 'Production'))
```
| type        |         Variable name               |             example                             |
|-------------|-------------------------------------|-------------------------------------------------|
| source      | $(Build.SourcesDirectory)           | C:\Agents\vsts-agent-win-x64-2.149.2\_work\11\s |
| artifacts   | $(Build.ArtifactStagingDirectory)   | c:\Agents\vsts-agent-win-x64-2.149.2\_work\11\a |
| bin         | $(Build.BinariesDirectory)          | c:\Agents\vsts-agent-win-x64-2.149.2\_work\11\b |


C:\Agents\vsts-agent-win-x64-2.149.2\_work\11

|Name        |
|------------|
|a           |
|b           |
|Nuget       |
|s           |
|TestResults |