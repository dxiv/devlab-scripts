# PowerShell scripts

Windows-focused utilities for desktop support and EUC: log scanning, temp cleanup, disk space, and quick system info. Dot-source `tools.ps1` then call the functions.

| Function | Use when |
|----------|----------|
| **Get-RecentErrors** | You need the last 50 ERROR lines from an app or system log. |
| **Clean-TempFolder** | You need to clear a temp/cache folder (e.g. before reinstall or to free space). Use `-WhatIf` to preview. |
| **Get-DiskSpaceSummary** | You need drive space at a glance (size, free, free %). |
| **Get-QuickSystemInfo** | You need OS, RAM, and key paths for a ticket or handover note. |

**Usage:**  
```powershell
. .\tools.ps1
Get-RecentErrors -LogPath "C:\ProgramData\MyApp\logs\app.log"
Clean-TempFolder -Path "C:\Users\jdoe\AppData\Local\Temp\MyApp" -WhatIf
Get-DiskSpaceSummary
Get-QuickSystemInfo
```

Requires PowerShell 5.1 or PowerShell Core.
