# YT-DLP ULTRA MAX 9000 - Change Log

## Version 2.1 - MAXIMUM NOSTALGIA EDITION (2025-01-XX)

### Added
- Organized downloads directory (separates content from program files)
- IExpress installer with retro license agreement
- Desktop shortcut auto-creation
- Comprehensive README for end users
- Project knowledge base for development
- Test suite for feature verification

### Fixed
- Default result count bug (now properly prompts with default: 20)
- Download directory auto-creation
- Installer working directory configuration

### Changed
- Rebranded from "MAXIMUM GRAPHICS EDITION" to "MAXIMUM NOSTALGIA EDITION"
- Updated tagline to "The extra mostest YouTube downloader ever made"
- Simplified installation process

---

## Version 2.0 - MAXIMUM GRAPHICS EDITION (2025-01-XX)

### Added
- Complete retro BBS aesthetic overhaul
- ASCII art banner and section headers
- Color-coded interface (Red/Yellow/Cyan/Green/Magenta)
- PC speaker beeps at key moments
- Animated loading spinners
- Progress bars with visual feedback
- Status symbols ([+], [-], [?], [!])
- Format selection menu (Best/MP3/720p/1080p)
- CLI and GUI download modes
- Duplicate detection via archive system
- URL editing in Notepad before download
- Portable file structure using relative paths
- Desktop shortcut creation script (SETUP.bat)

### Fixed
- Unicode encoding issues in PowerShell (replaced all Unicode with ASCII)
- Quote parsing errors in ReadKey() calls
- Box border alignment issues (removed vertical borders)
- Dependency check logic
- Format string handling for 720p/1080p options

### Changed
- Renamed from "youtube-search.ps1" branding to "YT-DLP ULTIMATE"
- Moved from generic utility to full retro experience
- CLI-first approach (GUI as secondary option)

---

## Version 1.0 - Initial Release (2025-01-XX)

### Added
- Basic YouTube search functionality
- yt-dlp integration
- Format selection (video/audio)
- Dependency checking
- Simple text-based interface

---

## Development Notes

### Design Philosophy
- **Nostalgia First:** Every interaction should feel like 1995 BBS/DOS
- **Function Over Form:** Style never compromises functionality
- **Gen-X Energy:** Self-aware humor, no corporate BS
- **User Respect:** Clear prompts, sensible defaults, honest about limitations

### Technical Decisions
- PowerShell chosen for Windows integration and dependency management
- ASCII-only to avoid encoding issues across different console configurations
- Horizontal separators only after vertical border alignment proved unreliable
- winget for dependency installation (modern, reliable, built into Win10/11)
- Archive system prevents duplicate downloads without complex database

### Known Limitations
- Windows-only (PowerShell dependency)
- Requires internet for initial dependency installation
- YouTube download speeds limited by YouTube's throttling
- Copyright responsibility on end user

### Future Considerations
- Cross-platform support via PowerShell Core
- 4K/8K format options
- Playlist batch processing
- Download queue management
- Thumbnail preview system
- Video metadata display
- Bandwidth throttling controls
