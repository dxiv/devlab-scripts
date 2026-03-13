<#
.SYNOPSIS
  Utilities for desktop/EUC work: log scan, temp cleanup, disk space, quick system info.

.DESCRIPTION
  Get-RecentErrors, Clean-TempFolder, Get-DiskSpaceSummary, Get-QuickSystemInfo.
  Dot-source this file, then call the functions. Use -WhatIf with Clean-TempFolder to preview.
#>

function Get-RecentErrors {
    param(
        [Parameter(Mandatory = $true)]
        [string]$LogPath
    )

    if (-Not (Test-Path $LogPath)) {
        Write-Host "[!] Log file not found: $LogPath" -ForegroundColor Red
        return
    }

    Write-Host "[+] Reading last 50 lines containing 'ERROR' from $LogPath" -ForegroundColor Cyan
    Select-String -Path $LogPath -Pattern "ERROR" | Select-Object -Last 50
}

function Clean-TempFolder {
    [CmdletBinding(SupportsShouldProcess)]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )

    if (-Not (Test-Path $Path)) {
        Write-Host "[!] Path not found: $Path" -ForegroundColor Red
        return
    }

    if ($WhatIfPreference) {
        $count = (Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue).Count
        Write-Host "[WhatIf] Would remove $count items under: $Path" -ForegroundColor Yellow
        return
    }
    Write-Host "[+] Cleaning temp folder: $Path" -ForegroundColor Yellow
    Get-ChildItem -Path $Path -Recurse -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
    Write-Host "[+] Temp folder cleaned." -ForegroundColor Green
}

function Get-DiskSpaceSummary {
    <#
    .SYNOPSIS
      Report drive letter, size, free space, and free % for all local fixed disks.
    #>
    Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" |
        Select-Object DeviceID,
            @{N='SizeGB';E={[math]::Round($_.Size/1GB,2)}},
            @{N='FreeGB';E={[math]::Round($_.FreeSpace/1GB,2)}},
            @{N='FreePct';E={[math]::Round(100*$_.FreeSpace/$_.Size,1)}} |
        Format-Table -AutoSize
}

function Get-QuickSystemInfo {
    <#
    .SYNOPSIS
      One-line summary: OS, RAM, and key paths (temp, user profile) for tickets or notes.
    #>
    $os = Get-CimInstance -ClassName Win32_OperatingSystem
    $cs = Get-CimInstance -ClassName Win32_ComputerSystem
    $totalGB = [math]::Round($cs.TotalPhysicalMemory/1GB, 2)
    $freeGB = [math]::Round($os.FreePhysicalMemory/1MB, 2)
    Write-Host "OS: $($os.Caption) | Build: $($os.BuildNumber)" -ForegroundColor Cyan
    Write-Host "RAM: $totalGB GB total, $freeGB GB free" -ForegroundColor Cyan
    Write-Host "Temp: $env:TEMP" -ForegroundColor Gray
    Write-Host "Profile: $env:USERPROFILE" -ForegroundColor Gray
}
