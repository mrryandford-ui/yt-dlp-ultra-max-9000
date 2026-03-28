# YT-DLP ULTRA MAX 9000 - Project Knowledge Base

## Project Overview
PowerShell-based YouTube search and download tool with maximum retro BBS aesthetic. Created for North County San Diego IT consultant Ryan Ford (ZeroPoint IT).

## Core Identity
- **Name:** YT-DLP ULTRA MAX 9000
- **Tagline:** "The extra mostest YouTube downloader ever made"
- **Version:** 2.1 - MAXIMUM NOSTALGIA EDITION
- **Aesthetic:** 1990s BBS/DOS retro with ASCII graphics, colored text, PC speaker beeps
- **Target Users:** Gen-X nostalgia lovers, YouTube archivists, anyone who misses the good old days

## File Structure
```
C:\YTDLP\
├── youtube-search.ps1       (main PowerShell script)
├── youtube-search.bat        (launcher wrapper)
├── yt-dlp-gui.exe           (optional GUI interface)
├── yt-dlp-archive.txt       (tracks downloaded videos to prevent duplicates)
├── youtube-urls.txt         (temp file with search results)
├── downloads\               (all downloaded content goes here)
└── INSTALL.ps1              (installer script for distribution)
```

## Technical Stack
- **Language:** PowerShell
- **Dependencies:** yt-dlp, ffmpeg (auto-installed via winget)
- **Platform:** Windows 10/11
- **Distribution:** IExpress self-extracting EXE or ZIP with installer

## Features
### Implemented
✅ Auto-detection and installation of dependencies (yt-dlp, ffmpeg)
✅ YouTube search with configurable result count (default: 20)
✅ Format selection: Best quality video, MP3 audio, 720p, 1080p
✅ CLI-first approach (GUI as secondary option)
✅ Duplicate detection via download archive
✅ URL list editing in Notepad before download
✅ Retro BBS-style interface with ASCII art, colored text, progress bars, beep sounds
✅ Portable design using relative paths
✅ Organized downloads directory (separates content from program files)
✅ Desktop shortcut creation via installer

### Visual Style Rules
- **NO Unicode characters** (broke PowerShell parser) - ASCII only
- **NO vertical borders** in boxes (alignment issues) - horizontal separators only
- **Colors:** Red (headers), Yellow (prompts), Cyan (info), Green (success), Magenta (options), DarkGray (borders)
- **Symbols:** Use `[+]` for success, `[-]` for errors, `[?]` for prompts, `[!]` for warnings
- **Box drawing:** Use `===` and `---` for horizontal lines, no `|` pipes
- **Spacing:** Consistent 2-space indent for all content

## Key Code Sections

### Format Selection Logic
```powershell
switch ($formatChoice) {
    "1" { $format = ""; $formatDesc = "BEST QUALITY VIDEO"; $formatIcon = "[VIDEO]" }
    "2" { $format = "-x --audio-format mp3"; $formatDesc = "MP3 AUDIO ONLY"; $formatIcon = "[AUDIO]" }
    "3" { $format = "-f 'bestvideo[height<=720]+bestaudio/best[height<=720]'"; $formatDesc = "720P VIDEO"; $formatIcon = "[720P]" }
    "4" { $format = "-f 'bestvideo[height<=1080]+bestaudio/best[height<=1080]'"; $formatDesc = "1080P VIDEO"; $formatIcon = "[1080P]" }
    default { $format = ""; $formatDesc = "BEST QUALITY VIDEO"; $formatIcon = "[VIDEO]" }
}
```

### Download Command
```powershell
yt-dlp -a "$outputFile" --download-archive "$archiveFile" $format --newline -o "$downloadsDir\%(title)s.%(ext)s"
```

### Archive System
- Tracks video IDs in `yt-dlp-archive.txt`
- Videos marked as downloaded persist even if files are moved/deleted
- To re-download: remove entry from archive file OR use separate archive per destination folder

## Bug Fixes Applied
1. **Unicode encoding errors:** Replaced all Unicode box-drawing characters with ASCII
2. **Quote parsing in ReadKey():** Fixed all quote types to prevent parse errors
3. **Vertical border alignment:** Removed all vertical borders, kept horizontal only
4. **Default count bug:** Changed param default from 20 to 0, added fallback logic for empty input
5. **Downloads mixed with program files:** Added dedicated `downloads\` directory with auto-creation

## Distribution Setup
### IExpress Configuration
- **Prompt:** "Install YT-DLP ULTRA MAX 9000 to C:\YTDLP?"
- **License Agreement:** Retro EULA with Gen-X humor and legal disclaimers
- **Command:** `powershell.exe -ExecutionPolicy Bypass -File INSTALL.ps1`
- **Output:** Self-extracting EXE

### Installer (INSTALL.ps1)
- Creates `C:\YTDLP` directory
- Copies all files to installation directory
- Creates `downloads\` subdirectory
- Creates desktop shortcut: "YT-DLP ULTRA MAX 9000.lnk"
- Points to PowerShell with execution policy bypass

## Testing Checklist
- [ ] Run with all dependencies pre-installed (verify skip logic)
- [ ] Run with missing dependencies (verify auto-install)
- [ ] Test format option 1 (best quality video)
- [ ] Test format option 2 (MP3 audio extraction)
- [ ] Test format option 3 (720p video with complex format string)
- [ ] Test format option 4 (1080p video with complex format string)
- [ ] Test CLI download mode with single video
- [ ] Test CLI download mode with 20+ videos
- [ ] Test GUI mode (verify URL clipboard copy)
- [ ] Test duplicate detection (re-run same search)
- [ ] Test with special characters in search query (`&`, `|`, `$`)
- [ ] Test installer on clean system
- [ ] Verify desktop shortcut works
- [ ] Verify downloads directory creation

## Known Constraints
- PowerShell execution policy must allow script execution (installer handles this with `-ExecutionPolicy Bypass`)
- Requires Windows 10/11 with winget available
- Internet connection required for dependency installation and video downloads
- yt-dlp format strings must be properly quoted (single quotes inside double quotes)

## Future Enhancement Ideas
- Add 4K format option
- Add playlist download support
- Add custom output filename templates
- Add download history viewer
- Add video metadata display before download
- Add thumbnail preview in CLI
- Add batch file queue management
- Add scheduled downloads
- Add bandwidth throttling options

## Style Guide for Modifications
- **Keep it retro:** Every screen should feel like logging into a 1995 BBS
- **Keep it loud:** Use beeps, colors, ASCII art generously
- **Keep it functional:** Don't sacrifice usability for aesthetics
- **Keep it Gen-X:** References to the 90s, self-deprecating humor, "totally rad" vibes
- **Keep it honest:** License agreement jokes about copyright liability, no false promises

## Ryan's Preferences
- Direct communication, zero corporate BS
- Working step-by-step, one task at a time
- Prefers practical testing over theoretical discussion
- Values clean separation of concerns (downloads vs program files)
- Appreciates nostalgic aesthetics but demands functionality
