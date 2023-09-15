
## Run Chrome with temp settings and without CORS checking
Create file run_chrome.cmd in folder C:\Temp\Chrome\
```powershell
"C:\Program Files\Google\Chrome\Application\chrome.exe" --disable-web-security --disable-gpu --user-data-dir=C:\Temp\Chrome\chromeTemp
```
And run it