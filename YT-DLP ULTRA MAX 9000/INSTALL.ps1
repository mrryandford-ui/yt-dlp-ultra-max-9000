# YT-DLP ULTRA MAX 9000 - Installer
# Installs to C:\YTDLP and creates desktop shortcut

$installDir = "C:\YTDLP"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Clear-Host
Write-Host ""
Write-Host "  ###############################################################" -ForegroundColor Red
Write-Host "                                                               " -ForegroundColor Red
Write-Host "          Y T - D L P    U L T R A    M A X    9 0 0 0       " -ForegroundColor Yellow
Write-Host "                                                               " -ForegroundColor Red
Write-Host "                      I N S T A L L E R                       " -ForegroundColor Cyan
Write-Host "                                                               " -ForegroundColor Red
Write-Host "  ###############################################################" -ForegroundColor Red
Write-Host ""
Write-Host "  ---------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "         Installing to: $installDir" -ForegroundColor White
Write-Host "  ---------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

[Console]::Beep(800, 100)

# Create install directory
Write-Host "  [?] Creating installation directory..." -ForegroundColor Cyan
try {
    if (-not (Test-Path $installDir)) {
        New-Item -ItemType Directory -Path $installDir | Out-Null
    }
    Write-Host "  [+] $installDir ready" -ForegroundColor Green
} catch {
    Write-Host "  [-] Failed to create $installDir - try running as Administrator" -ForegroundColor Red
    Write-Host ""
    Write-Host "  Press any key to exit..." -ForegroundColor DarkGray
    $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    exit 1
}

# Create downloads subdirectory
Write-Host "  [?] Creating downloads directory..." -ForegroundColor Cyan
$downloadsDir = Join-Path $installDir "downloads"
if (-not (Test-Path $downloadsDir)) {
    New-Item -ItemType Directory -Path $downloadsDir | Out-Null
}
Write-Host "  [+] $downloadsDir ready" -ForegroundColor Green

# Copy program files
Write-Host "  [?] Copying program files..." -ForegroundColor Cyan
$files = @("youtube-search.bat", "youtube-search.ps1", "yt-dlp-gui.exe", "License agreement.txt")
foreach ($file in $files) {
    $src = Join-Path $scriptDir $file
    if (Test-Path $src) {
        Copy-Item $src $installDir -Force
        Write-Host "  [+] $file" -ForegroundColor Green
    } else {
        Write-Host "  [!] Skipped (not found): $file" -ForegroundColor Yellow
    }
}

# Create desktop shortcut
Write-Host "  [?] Creating desktop shortcut..." -ForegroundColor Cyan
try {
    $shell = New-Object -ComObject WScript.Shell
    $shortcutPath = "$env:USERPROFILE\Desktop\YT-DLP ULTRA MAX 9000.lnk"
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = "powershell.exe"
    $shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$installDir\youtube-search.ps1`""
    $shortcut.WorkingDirectory = $installDir
    $shortcut.Description = "YT-DLP ULTRA MAX 9000 - The extra mostest YouTube downloader ever made"
    $shortcut.IconLocation = "$installDir\yt-dlp-gui.exe,0"
    $shortcut.Save()
    Write-Host "  [+] Desktop shortcut created!" -ForegroundColor Green
} catch {
    Write-Host "  [-] Could not create desktop shortcut: $_" -ForegroundColor Red
}

[Console]::Beep(1200, 100)
Start-Sleep -Milliseconds 200
[Console]::Beep(1500, 150)

Write-Host ""
Write-Host "  ===============================================================" -ForegroundColor Green
Write-Host "                   INSTALLATION COMPLETE!" -ForegroundColor Green
Write-Host "  ===============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "      [+] Files installed to $installDir" -ForegroundColor White
Write-Host "      [+] Desktop shortcut created" -ForegroundColor White
Write-Host "      [+] Downloads folder ready" -ForegroundColor White
Write-Host ""
Write-Host "  Launching now..." -ForegroundColor Cyan
Write-Host ""
Write-Host "  ---------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "  Questions? allofasuddenithappens@gmail.com" -ForegroundColor DarkGray
Write-Host "  ---------------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Start-Sleep -Seconds 2
Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$installDir\youtube-search.ps1`""
[Console]::Beep(800, 100)
