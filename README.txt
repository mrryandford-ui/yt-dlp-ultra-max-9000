===============================================================================
                    YT-DLP ULTRA MAX 9000
                 MAXIMUM NOSTALGIA EDITION
                        Version 2.1
===============================================================================

The extra mostest YouTube downloader ever made!

-------------------------------------------------------------------------------
INSTALLATION
-------------------------------------------------------------------------------

1. Run the installer (double-click the .exe)
2. Accept the totally rad license agreement
3. Files will be installed to C:\YTDLP
4. Desktop shortcut will be created automatically

That's it! You're ready to download.

-------------------------------------------------------------------------------
QUICK START
-------------------------------------------------------------------------------

1. Double-click "YT-DLP ULTRA MAX 9000" on your desktop
2. Enter your search query (e.g., "80s music videos")
3. Choose how many results (press Enter for 20)
4. Select your format:
   - [1] Best quality video (recommended)
   - [2] MP3 audio only
   - [3] 720p video (smaller files)
   - [4] 1080p video (HD quality)
5. Choose CLI mode (recommended) or GUI mode
6. Notepad will open - delete any videos you DON'T want
7. Save and close Notepad
8. Downloads start automatically!

All downloads are saved to: C:\YTDLP\downloads\

-------------------------------------------------------------------------------
FIRST RUN - DEPENDENCY INSTALLATION
-------------------------------------------------------------------------------

The first time you run the program, it will check for required software:
- yt-dlp (the download engine)
- ffmpeg (audio/video processing)

If these aren't installed, the program will offer to install them automatically.
This is a ONE-TIME setup and takes about 2-3 minutes.

Just press Y when prompted and let it do its thing!

-------------------------------------------------------------------------------
DUPLICATE DETECTION
-------------------------------------------------------------------------------

YT-DLP ULTRA MAX 9000 remembers what you've downloaded!

The file "yt-dlp-archive.txt" keeps track of every video ID. If you search
for the same video again, it will automatically skip it - no wasted bandwidth!

IMPORTANT: Moving or deleting downloaded files does NOT remove them from the
archive. If you want to re-download something:
- Open yt-dlp-archive.txt in Notepad
- Find and delete the line with that video ID
- Save and close

-------------------------------------------------------------------------------
CLI MODE vs GUI MODE
-------------------------------------------------------------------------------

CLI MODE (Recommended):
+ Automatic downloads with progress display
+ Duplicate detection enabled
+ Real-time speed and ETA
+ Just works!

GUI MODE:
+ Visual interface for manual control
+ Good for one-off downloads
+ No automatic duplicate checking
+ URLs copied to clipboard for you

Most users should stick with CLI mode!

-------------------------------------------------------------------------------
TROUBLESHOOTING
-------------------------------------------------------------------------------

"Script won't run" / "Execution policy error"
→ Run the desktop shortcut (it's configured correctly)
→ Don't try to run the .ps1 file directly

"Dependencies won't install"
→ Make sure you have an internet connection
→ Try running as Administrator
→ Check Windows Update is working

"Downloads are very slow"
→ This is normal for large video files
→ YouTube throttles download speeds sometimes
→ Be patient, young padawan

"I get copyright warnings"
→ You're downloading copyrighted content
→ Use responsibly and within legal limits
→ We told you in the license agreement! 😉

-------------------------------------------------------------------------------
FILE LOCATIONS
-------------------------------------------------------------------------------

Installation directory:    C:\YTDLP\
Downloaded files:          C:\YTDLP\downloads\
Archive database:          C:\YTDLP\yt-dlp-archive.txt
Temp search results:       C:\YTDLP\youtube-urls.txt

-------------------------------------------------------------------------------
UNINSTALLING
-------------------------------------------------------------------------------

1. Delete the desktop shortcut
2. Delete C:\YTDLP folder
3. (Optional) Uninstall yt-dlp and ffmpeg via Windows Settings

That's it - no registry entries, no hidden files.

-------------------------------------------------------------------------------
VERIFYING THE INSTALLER (OPTIONAL)
-------------------------------------------------------------------------------

Paranoid? Good. You can verify the installer hasn't been tampered with
by checking the file hashes. Right-click the EXE, Properties, or use
a tool like 7-Zip or CertUtil:

  certutil -hashfile "YT-DLP ULTRA MAX 9000.EXE" SHA256

Expected hashes for v3.0 (MAXIMUM NOSTALGIA EDITION):

  MD5     f8e90a64d144db77141dc65e9afc6492
  SHA-1   a07f717414c9539d3acf44d614403e0c614d0dde
  SHA-256 c897c8579447a8ca354f80a2b486ac392d0f657c3b99771ecaf2952e4802edeb

You can also verify at: https://www.virustotal.com

Note: Windows may show a SmartScreen warning on first run since the
EXE is unsigned. Click "More info" then "Run anyway" to proceed.

-------------------------------------------------------------------------------
CREDITS & LICENSE
-------------------------------------------------------------------------------

Created by: Ryan Ford / ZeroPoint IT
Website: https://zeropoint.llc

Built with:
- yt-dlp (https://github.com/yt-dlp/yt-dlp)
- ffmpeg (https://ffmpeg.org)
- PowerShell
- Maximum nostalgia vibes

This software is provided AS-IS with no warranty. Use responsibly.
Respect copyright laws. Don't be a jerk.

===============================================================================
               Keep the retro vibes alive! - v2.1
===============================================================================
