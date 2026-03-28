# YT-DLP ULTRA MAX 9000 v3.0 - MAXIMUM NOSTALGIA EDITION
param(
    [string]$query,
    [int]$count = 0
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Load WinForms for MessageBox popups
Add-Type -AssemblyName System.Windows.Forms

# ============================================================================
# UTILITY FUNCTIONS
# ============================================================================

function Write-Retro {
    param([string]$text, [string]$color = "White", [int]$delay = 20)
    foreach ($char in $text.ToCharArray()) {
        Write-Host $char -NoNewline -ForegroundColor $color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Show-Loading {
    param([string]$message, [int]$duration = 15)
    Write-Host "  $message " -NoNewline -ForegroundColor Yellow
    $spinner = @('|','/','-','\')
    for ($i = 0; $i -lt $duration; $i++) {
        Write-Host $spinner[$i % $spinner.Length] -NoNewline -ForegroundColor Cyan
        Start-Sleep -Milliseconds 100
        Write-Host "`b" -NoNewline
    }
    Write-Host "[OK]" -ForegroundColor Green
}

function Show-ProgressBar {
    param([string]$label, [int]$percent, [int]$width = 50)
    $filled = [math]::Floor($width * $percent / 100)
    $empty = $width - $filled
    
    Write-Host "  $label [" -NoNewline -ForegroundColor White
    Write-Host ("#" * $filled) -NoNewline -ForegroundColor Green
    Write-Host ("." * $empty) -NoNewline -ForegroundColor DarkGray
    Write-Host "] " -NoNewline -ForegroundColor White
    Write-Host "$percent%" -ForegroundColor Cyan
}

function Test-Command {
    param([string]$command)
    $null = Get-Command $command -ErrorAction SilentlyContinue
    return $?
}

# ============================================================================
# EPIC STARTUP SEQUENCE
# ============================================================================
Clear-Host
Write-Host ""
Write-Host "  ##########################################################" -ForegroundColor Red
Write-Host "                                                             " -ForegroundColor Red
Write-Host "          Y T - D L P    U L T R A    M A X    9 0 0 0                 " -ForegroundColor Yellow
Write-Host "                                                             " -ForegroundColor Red
Write-Host "              +++COMPLETE DOWNLOADER SYSTEM+++               " -ForegroundColor Cyan
Write-Host "                                                             " -ForegroundColor Red
Write-Host "       M A X I M U M    N O S T A L G I A    E D I T I O N    " -ForegroundColor Magenta
Write-Host "                                                             " -ForegroundColor Red
Write-Host "  ##########################################################" -ForegroundColor Red
Write-Host ""
Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host "         Version 3.0 - MAXIMUM NOSTALGIA EDITION" -ForegroundColor White
Write-Host "      The extra mostest YouTube downloader ever made" -ForegroundColor DarkCyan
Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

[Console]::Beep(800, 100)
Start-Sleep -Milliseconds 500

# ============================================================================
# SYSTEM INITIALIZATION & DEPENDENCY CHECK
# ============================================================================

Write-Host "  ==========================================================" -ForegroundColor Yellow
Write-Host "                   SYSTEM INITIALIZATION" -ForegroundColor Yellow
Write-Host "  ==========================================================" -ForegroundColor Yellow
Write-Host ""

Show-Loading "     > Checking system requirements" 10
Show-Loading "     > Scanning for dependencies" 10
Write-Host "       > Updating yt-dlp engine " -NoNewline -ForegroundColor Yellow
try {
    $updateOutput = & yt-dlp -U 2>&1
    if ($updateOutput -match "up-to-date|up to date|Latest") {
        Write-Host "[OK] (latest)" -ForegroundColor Green
    } elseif ($updateOutput -match "Updated|Updating") {
        Write-Host "[OK] (updated!)" -ForegroundColor Cyan
    } else {
        Write-Host "[OK]" -ForegroundColor Green
    }
} catch {
    Write-Host "[SKIP] (offline?)" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "  ---[ DEPENDENCY STATUS ]----------------------------------" -ForegroundColor DarkGray
Write-Host ""

# Check yt-dlp
Write-Host "    yt-dlp.............. " -NoNewline -ForegroundColor DarkGray
if (Test-Command "yt-dlp") {
    Write-Host "[+] INSTALLED" -ForegroundColor Green
    $ytdlpInstalled = $true
} else {
    Write-Host "[-] MISSING" -ForegroundColor Red
    $ytdlpInstalled = $false
}

# Check ffmpeg
Write-Host "    ffmpeg.............. " -NoNewline -ForegroundColor DarkGray
if (Test-Command "ffmpeg") {
    Write-Host "[+] INSTALLED" -ForegroundColor Green
    $ffmpegInstalled = $true
} else {
    Write-Host "[-] MISSING" -ForegroundColor Red
    $ffmpegInstalled = $false
}

Write-Host ""
Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

# Install missing dependencies
if (-not $ytdlpInstalled -or -not $ffmpegInstalled) {
    [Console]::Beep(1000, 200)
    Write-Host "  ==========================================================" -ForegroundColor Red
    Write-Host "              MISSING DEPENDENCIES DETECTED!" -ForegroundColor Red
    Write-Host "  ==========================================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "  The following components need to be installed:" -ForegroundColor Yellow
    Write-Host ""
    if (-not $ytdlpInstalled) {
        Write-Host "    * yt-dlp     (YouTube download engine)" -ForegroundColor White
    }
    if (-not $ffmpegInstalled) {
        Write-Host "    * ffmpeg     (Audio/video processing)" -ForegroundColor White
    }
    Write-Host ""
    Write-Host "  ---[ INSTALL NOW? ]" -ForegroundColor DarkGray
    Write-Host "  --> " -NoNewline -ForegroundColor DarkGray
    $install = Read-Host "(Y/N)"
    
    if ($install -eq "Y" -or $install -eq "y") {
        Write-Host ""
        Write-Host "  ==========================================================" -ForegroundColor Green
        Write-Host "                  INSTALLING DEPENDENCIES" -ForegroundColor Green
        Write-Host "  ==========================================================" -ForegroundColor Green
        Write-Host ""
        
        if (-not $ytdlpInstalled) {
            Write-Host "  ---[ INSTALLING YT-DLP ]---------------------------------------" -ForegroundColor DarkGray
            Write-Host ""
            Write-Host "    > Downloading from GitHub..." -ForegroundColor White
            Write-Host ""
            
            for ($i = 0; $i -le 100; $i += 10) {
                Show-ProgressBar "    Progress" $i 45
                Start-Sleep -Milliseconds 200
            }
            
            Write-Host ""
            Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
            Write-Host ""
            
            winget install yt-dlp.yt-dlp --silent --accept-source-agreements --accept-package-agreements
            
            Write-Host "  [+] yt-dlp installation complete!" -ForegroundColor Green
            Write-Host ""
            [Console]::Beep(1200, 100)
        }
        
        if (-not $ffmpegInstalled) {
            Write-Host "  ---[ INSTALLING FFMPEG ]---------------------------------------" -ForegroundColor DarkGray
            Write-Host ""
            Write-Host "    > Downloading media processor..." -ForegroundColor White
            Write-Host ""
            
            for ($i = 0; $i -le 100; $i += 10) {
                Show-ProgressBar "    Progress" $i 45
                Start-Sleep -Milliseconds 200
            }
            
            Write-Host ""
            Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
            Write-Host ""
            
            winget install Gyan.FFmpeg --silent --accept-source-agreements --accept-package-agreements
            
            Write-Host "  [+] ffmpeg installation complete!" -ForegroundColor Green
            Write-Host ""
            [Console]::Beep(1200, 100)
        }
        
        Write-Host "  ==========================================================" -ForegroundColor Green
        Write-Host "              ALL DEPENDENCIES INSTALLED!" -ForegroundColor Green
        Write-Host "  ==========================================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "  Please restart this script to continue..." -ForegroundColor Yellow
        Write-Host ""
        Write-Host "  Press any key to exit..." -ForegroundColor DarkGray
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        exit
    } else {
        Write-Host ""
        Write-Host "  [-] Cannot proceed without required dependencies." -ForegroundColor Red
        Write-Host ""
        Write-Host "  Press any key to exit..." -ForegroundColor DarkGray
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
        exit
    }
}

Write-Host "  [+] ALL SYSTEMS OPERATIONAL!" -ForegroundColor Green
Write-Host ""
[Console]::Beep(1200, 100)
Start-Sleep -Milliseconds 500

# ============================================================================
# MAIN LOOP - supports Search Again
# ============================================================================

$firstRun = $true
$keepRunning = $true
while ($keepRunning) {
    if (-not $firstRun) { $query = ""; $count = 0 }
    $firstRun = $false

# ============================================================================
# SEARCH PARAMETERS
# ============================================================================

Write-Host "  ==========================================================" -ForegroundColor Yellow
Write-Host "                      SEARCH PARAMETERS" -ForegroundColor Yellow
Write-Host "  ==========================================================" -ForegroundColor Yellow
Write-Host ""

if ([string]::IsNullOrWhiteSpace($query)) {
    Write-Host "  [?] SEARCH QUERY: " -NoNewline -ForegroundColor Cyan
    $query = Read-Host
}

if ($count -eq 0) {
    Write-Host "  [?] RESULT COUNT: " -NoNewline -ForegroundColor Cyan
    $countInput = Read-Host "(default: 20)"
    if (![string]::IsNullOrWhiteSpace($countInput)) { $count = [int]$countInput } else { $count = 20 }
}

Write-Host ""
[Console]::Beep(900, 100)

# ============================================================================
# FORMAT SELECTION
# ============================================================================

Write-Host "  ==========================================================" -ForegroundColor Magenta
Write-Host "                       FORMAT SELECTION" -ForegroundColor Magenta
Write-Host "  ==========================================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "      [1] > VIDEO - BEST QUALITY   [DEFAULT]" -ForegroundColor Green
Write-Host "            +- Maximum resolution, highest bitrate" -ForegroundColor DarkGray
Write-Host ""
Write-Host "      [2] > AUDIO ONLY - MP3" -ForegroundColor Yellow
Write-Host "            +- Extract audio, convert to MP3" -ForegroundColor DarkGray
Write-Host ""
Write-Host "      [3] > VIDEO - 720P MAX" -ForegroundColor Yellow
Write-Host "            +- Balanced quality and file size" -ForegroundColor DarkGray
Write-Host ""
Write-Host "      [4] > VIDEO - 1080P MAX" -ForegroundColor Yellow
Write-Host "            +- High quality, reasonable size" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  ==========================================================" -ForegroundColor Magenta
Write-Host ""
Write-Host "  ---[ SELECT FORMAT ]" -ForegroundColor DarkGray
Write-Host "  --> " -NoNewline -ForegroundColor DarkGray
$formatChoice = Read-Host "(default: 1)"
if ([string]::IsNullOrWhiteSpace($formatChoice)) { $formatChoice = "1" }

switch ($formatChoice) {
    "1" { 
        $format = ""
        $formatDesc = "BEST QUALITY VIDEO"
        $formatIcon = "[VIDEO]"
    }
    "2" { 
        $format = "-x --audio-format mp3"
        $formatDesc = "MP3 AUDIO ONLY"
        $formatIcon = "[AUDIO]"
    }
    "3" { 
        $format = "-f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"
        $formatDesc = "720P VIDEO"
        $formatIcon = "[720P]"
    }
    "4" { 
        $format = "-f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]'"
        $formatDesc = "1080P VIDEO"
        $formatIcon = "[1080P]"
    }
    default { 
        $format = ""
        $formatDesc = "BEST QUALITY VIDEO"
        $formatIcon = "[VIDEO]"
    }
}

Write-Host ""
[Console]::Beep(1100, 100)

$outputFile = Join-Path $scriptDir "youtube-urls.txt"
$archiveFile = Join-Path $scriptDir "yt-dlp-archive.txt"
$downloadsDir = Join-Path $scriptDir "downloads"
if (-not (Test-Path $downloadsDir)) { New-Item -ItemType Directory -Path $downloadsDir | Out-Null }

# ============================================================================
# SEARCH EXECUTION
# ============================================================================

Write-Host "  ==========================================================" -ForegroundColor Cyan
Write-Host "                    INITIATING SEARCH..." -ForegroundColor Cyan
Write-Host "  ==========================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "  ---[ SEARCH PARAMETERS ]---------------------------------------" -ForegroundColor DarkGray
Write-Host ""
Write-Host "    Query:  '$query'" -ForegroundColor White
Write-Host "    Count:  $count results" -ForegroundColor White
Write-Host "    Format: $formatIcon $formatDesc" -ForegroundColor White
Write-Host ""
Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
Write-Host ""

Write-Host "  [" -NoNewline -ForegroundColor Yellow
for ($i = 0; $i -lt 50; $i++) {
    Write-Host "#" -NoNewline -ForegroundColor Green
    Start-Sleep -Milliseconds 20
}
Write-Host "] 100%" -ForegroundColor Yellow

Write-Host ""
yt-dlp "ytsearch${count}:$query" --flat-playlist --print "%(url)s - %(title)s" | Out-File -FilePath $outputFile -Encoding UTF8

[Console]::Beep(1200, 150)
Write-Host "  [+] SEARCH COMPLETE!" -ForegroundColor Green
Write-Host ""
Start-Sleep -Milliseconds 500

# ============================================================================
# DOWNLOAD METHOD SELECTION
# ============================================================================

Write-Host "  ==========================================================" -ForegroundColor Red
Write-Host "                     DOWNLOAD METHOD" -ForegroundColor Red
Write-Host "  ==========================================================" -ForegroundColor Red
Write-Host ""
Write-Host "      [1] > COMMAND LINE MODE (RECOMMENDED)" -ForegroundColor Yellow
Write-Host "            +- Automatic download with progress display" -ForegroundColor DarkGray
Write-Host "            +- Duplicate detection enabled" -ForegroundColor DarkGray
Write-Host "            +- Real-time speed and file count display" -ForegroundColor DarkGray
Write-Host ""
Write-Host "      [2] > GUI MODE" -ForegroundColor Yellow
Write-Host "            +- Launch graphical interface" -ForegroundColor DarkGray
Write-Host "            +- Manual control over downloads" -ForegroundColor DarkGray
Write-Host "            +- No automatic duplicate checking" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  ==========================================================" -ForegroundColor Red
Write-Host ""
Write-Host "  ---[ SELECT METHOD ]" -ForegroundColor DarkGray
Write-Host "  --> " -NoNewline -ForegroundColor DarkGray
$method = Read-Host "(default: 1)"

if ([string]::IsNullOrWhiteSpace($method)) { $method = "1" }

$total = 0

Write-Host ""
[Console]::Beep(1000, 100)

# ============================================================================
# URL EDITING
# ============================================================================

Write-Host "  ==========================================================" -ForegroundColor Yellow
Write-Host "                    OPENING URL EDITOR" -ForegroundColor Yellow
Write-Host "  ==========================================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "  > Delete unwanted URLs and save the file..." -ForegroundColor Cyan
Write-Host "  > Close Notepad when ready to proceed..." -ForegroundColor Cyan
Write-Host ""
Start-Sleep -Milliseconds 1000

# Popup instructions before Notepad opens
[System.Windows.Forms.MessageBox]::Show(
    "Notepad is opening with your search results.`n`n" +
    "  > DELETE lines for videos you DON'T want`n" +
    "  > KEEP lines for videos you DO want`n`n" +
    "Save the file and close Notepad when done.`n" +
    "Downloads will begin automatically.",
    "YT-DLP ULTRA MAX 9000  --  URL EDITOR",
    [System.Windows.Forms.MessageBoxButtons]::OK,
    [System.Windows.Forms.MessageBoxIcon]::Information
) | Out-Null

Start-Process notepad.exe $outputFile -Wait

[Console]::Beep(900, 100)
Write-Host ""
Write-Host "  [+] URL SELECTION COMPLETE!" -ForegroundColor Green
Write-Host ""

# ============================================================================
# DOWNLOAD EXECUTION
# ============================================================================

if ($method -eq "1") {
    Write-Host "  ==========================================================" -ForegroundColor Green
    Write-Host "               COMMENCING DOWNLOAD SEQUENCE" -ForegroundColor Green
    Write-Host "  ==========================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "  ---[ DOWNLOAD ENGINE ]------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "    Format:      $formatIcon $formatDesc" -ForegroundColor White
    Write-Host "    Archive:     yt-dlp-archive.txt" -ForegroundColor White
    Write-Host "    Duplicates:  Auto-skip enabled" -ForegroundColor Green
    Write-Host ""
    Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host ""
    Write-Host "  ==========================================================" -ForegroundColor Cyan
    Write-Host "                     DOWNLOAD PROGRESS" -ForegroundColor Cyan
    Write-Host "  ==========================================================" -ForegroundColor Cyan
    Write-Host ""
    
    $urlLines = @(Get-Content $outputFile | Where-Object { $_ -notmatch '^\s*$' -and $_ -notmatch '^#' })
    $total = $urlLines.Count

    if ($total -eq 0) {
        Write-Host "  [-] No URLs found in selection!" -ForegroundColor Red
    } else {
        $current = 0
        foreach ($line in $urlLines) {
            $url = ($line -split ' - ')[0].Trim()
            $current++
            Write-Host ""
            Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
            Write-Host "  [>>] FILE $current of $total" -ForegroundColor Cyan
            Write-Host "  ----------------------------------------------------------" -ForegroundColor DarkGray
            Write-Host ""
            $cmd = "yt-dlp `"$url`" --download-archive `"$archiveFile`" $format -o `"$downloadsDir\%(title)s.%(ext)s`" --progress-template `"  [%(progress._percent_str)s] %(progress._downloaded_bytes_str)s / %(progress._total_bytes_str)s  %(progress._speed_str)s`""
            Invoke-Expression $cmd
            Write-Host ""
        }
    }
    
    Write-Host ""
    Write-Host "  ==========================================================" -ForegroundColor Green
    Write-Host "                    DOWNLOAD COMPLETE!" -ForegroundColor Green
    Write-Host "  ==========================================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "      [+] All files downloaded successfully" -ForegroundColor White
    Write-Host "      [+] Archive updated" -ForegroundColor White
    Write-Host "      [+] Duplicates skipped" -ForegroundColor White
    Write-Host ""
    Write-Host "  ==========================================================" -ForegroundColor Green
    [Console]::Beep(1500, 200)
    [Console]::Beep(1500, 200)
    
} else {
    Write-Host "  ==========================================================" -ForegroundColor Cyan
    Write-Host "                   PREPARING GUI MODE..." -ForegroundColor Cyan
    Write-Host "  ==========================================================" -ForegroundColor Cyan
    Write-Host ""
    
    Show-Loading "     > Extracting URLs from selection" 10
    Show-Loading "     > Copying to system clipboard" 10
    
    $urls = Get-Content $outputFile | ForEach-Object { ($_ -split ' - ')[0] }
    $urls -join "`n" | Set-Clipboard
    
    Write-Host ""
    Write-Host "  [+] URLs COPIED TO CLIPBOARD!" -ForegroundColor Green
    Write-Host ""
    
    Show-Loading "     > Launching GUI interface" 10
    
    $guiPath = Join-Path $scriptDir "yt-dlp-gui.exe"
    if (Test-Path $guiPath) {
        Start-Process $guiPath
    } else {
        Write-Host "  [-] GUI not found at: $guiPath" -ForegroundColor Red
        Write-Host "  URLs are still in your clipboard - paste them anywhere!" -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "  ==========================================================" -ForegroundColor Yellow
    Write-Host "                        INSTRUCTIONS" -ForegroundColor Yellow
    Write-Host "  ==========================================================" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "      1. Press CTRL+V in the GUI to paste URLs" -ForegroundColor White
    Write-Host "      2. Configure format settings manually" -ForegroundColor White
    Write-Host "      3. Click Download to begin" -ForegroundColor White
    Write-Host ""
    Write-Host "      [!] Note: GUI does not auto-skip duplicates" -ForegroundColor Red
    Write-Host ""
    Write-Host "  ==========================================================" -ForegroundColor Yellow
    [Console]::Beep(1200, 150)
}

    # ============================================================================
    # SUMMARY POPUP
    # ============================================================================

    [Console]::Beep(1500, 200)
    [Console]::Beep(1500, 200)

    $summaryMsg =
        "DOWNLOADS COMPLETE!`n`n" +
        "  Files processed : $total`n" +
        "  Format          : $formatDesc`n" +
        "  Saved to        : $downloadsDir`n`n" +
        "Search again?"

    $result = [System.Windows.Forms.MessageBox]::Show(
        $summaryMsg,
        "YT-DLP ULTRA MAX 9000  --  COMPLETE",
        [System.Windows.Forms.MessageBoxButtons]::YesNo,
        [System.Windows.Forms.MessageBoxIcon]::Information
    )

    $keepRunning = ($result -eq [System.Windows.Forms.DialogResult]::Yes)
    if ($keepRunning) { Clear-Host }
    if (-not $keepRunning -and (Test-Path $downloadsDir)) { Start-Process explorer.exe $downloadsDir }

} # end main loop
