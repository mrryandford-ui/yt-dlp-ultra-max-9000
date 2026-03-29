===============================================================================
                     YT-DLP ULTRA MAX 9000
                  MAXIMUM NOSTALGIA EDITION
                         Version 3.0
===============================================================================

The extra mostest YouTube downloader ever made!

-------------------------------------------------------------------------------
INSTALLATION
-------------------------------------------------------------------------------

1. Run the installer (double-click the .exe)
2. Accept the totally rad license agreement
3. Files will be installed to C:\YTDLP
4. Desktop shortcut created automatically
5. App launches automatically when install completes

That's it! You're ready to download.

-------------------------------------------------------------------------------
QUICK START
-------------------------------------------------------------------------------

1. Double-click "YT-DLP ULTRA MAX 9000" on your desktop
2. Enter your search query (e.g., "80s music videos")
3. Choose how many results (press Enter for 20)
4. Select your format (press Enter for Best Quality):
   [1] Best quality video  ** DEFAULT **
   [2] MP3 audio only
   [3] 720p video (smaller files)
   [4] 1080p video (HD quality)
5. A popup will open - delete lines for videos you DON'T want
6. Save and close Notepad
7. Downloads start automatically with live progress!
8. When done, a summary popup lets you Search Again or Close
9. On close, your downloads folder opens automatically

All downloads saved to: C:\YTDLP\downloads\

-------------------------------------------------------------------------------
FIRST RUN - DEPENDENCY INSTALLATION
-------------------------------------------------------------------------------

On first run the app checks for required software:
  - yt-dlp  (the download engine)
  - ffmpeg  (audio/video processing)

If missing, the app will offer to install them automatically via winget.
One-time setup, takes about 2-3 minutes. Press Y when prompted.

The app also auto-updates yt-dlp every time it launches so you always
have the latest YouTube compatibility fixes.

-------------------------------------------------------------------------------
DUPLICATE DETECTION
-------------------------------------------------------------------------------

YT-DLP ULTRA MAX 9000 remembers what you've downloaded!

The file "yt-dlp-archive.txt" tracks every downloaded video ID. If you
search for the same video again it will skip it automatically - no wasted
bandwidth, no duplicate files.

To re-download something you've already downloaded:
  - Open C:\YTDLP\yt-dlp-archive.txt in Notepad
  - Find and delete the line with that video's ID
  - Save and close, then download again

-------------------------------------------------------------------------------
TROUBLESHOOTING
-------------------------------------------------------------------------------

"Script won't run" / "Execution policy error"
  -> Use the desktop shortcut (it's configured correctly)
  -> Don't run the .ps1 file directly by double-clicking it

"Dependencies won't install"
  -> Make sure you have an internet connection
  -> Try running as Administrator
  -> Check that Windows Update is working

"Downloads are slow"
  -> Normal for large video files
  -> YouTube throttles speeds sometimes - be patient

"I get copyright warnings"
  -> You're downloading copyrighted content
  -> Use responsibly and within legal limits
  -> We warned you in the license agreement!

"SmartScreen warning on install"
  -> Expected - the EXE is not code-signed
  -> Click "More info" then "Run anyway" to proceed
  -> Verify the file hash below if you want to be sure

-------------------------------------------------------------------------------
FILE LOCATIONS
-------------------------------------------------------------------------------

  Installation directory:   C:\YTDLP\
  Downloaded files:         C:\YTDLP\downloads\
  Archive database:         C:\YTDLP\yt-dlp-archive.txt
  Temp search results:      C:\YTDLP\youtube-urls.txt

-------------------------------------------------------------------------------
UNINSTALLING
-------------------------------------------------------------------------------

1. Delete the desktop shortcut
2. Delete the C:\YTDLP folder
3. (Optional) Uninstall yt-dlp and ffmpeg via Windows Settings -> Apps

No registry entries. No hidden files. Clean uninstall.

-------------------------------------------------------------------------------
VERIFYING THE INSTALLER
-------------------------------------------------------------------------------

Verify the installer hasn't been tampered with using CertUtil:

  certutil -hashfile "YT-DLP ULTRA MAX 9000.EXE" SHA256

Expected hashes for v3.0 (MAXIMUM NOSTALGIA EDITION):

  MD5:    A1F93F67D7741EDB41B03E95F12D843B
  SHA1:   5B1EC3BFC08DBC4E30CCD407C95E78C1E1E14353
  SHA256: DDFA009D82B77B0F3142FAA688ED794CCD968733278EBF112690D1CE3962445E

Source code available at: https://github.com/mrryandford-ui/yt-dlp-ultra-max-9000

-------------------------------------------------------------------------------
CREDITS & LICENSE
-------------------------------------------------------------------------------

Created by: Ryan Ford / ZeroPoint IT
Website:    https://zeropoint.llc
Source:     https://github.com/mrryandford-ui/yt-dlp-ultra-max-9000

Powered by:
  - yt-dlp  (https://github.com/yt-dlp/yt-dlp)  [Unlicense]
  - ffmpeg  (https://ffmpeg.org)                  [LGPL]
  - PowerShell + Maximum Nostalgia Vibes

This software is provided AS-IS with no warranty.
Use responsibly. Respect copyright laws. Don't be a jerk.

Released under the MIT License.

===============================================================================
                  Keep the retro vibes alive! -- v3.0
===============================================================================