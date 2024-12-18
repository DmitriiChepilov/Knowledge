### Stopwatch

```powershell
# Using Stopwatch & Thread.Sleep()
$stopwatch = [Diagnostics.Stopwatch]::new() # Create a timer
$stopwatch.Start() # Start the timer
[System.Threading.Thread]::Sleep(5000) # Sleep for 5 seconds
$stopwatch.Stop() # Stop the timer
$stopwatch.ElapsedMilliseconds # Get time elapsed
$stopwatch.Elapsed.TotalSeconds # Get time elapsed
Write-Host "ElapsedMilliseconds: $($stopwatch.ElapsedMilliseconds) ms"
Write-Host "TotalSeconds: $($($stopwatch.Elapsed).TotalSeconds) seconds"
Write-Host "Timestamp : $($($stopwatch.Elapsed).ToString('hh\:mm\:ss'))"
Write-Host "Timestamp2: $($($stopwatch.Elapsed).ToString('hh\:mm\:ss\.fff'))"
$stopwatch.Restart() # restarts the time, doesn't stop
$stopwatch.Reset() # stops timer and sets to 0
```

### Datetime

```powershell
$time = [System.Datetime]::Now
Write-Host "time: $($time.ToString('HH-mm-ss'))"
```
