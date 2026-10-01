# OrcTok

OrcTok brainrot for your flight paths. When you take a flight path, a phone screen
appears. Your character runs through a procedurally generated Deeprun Tram course
while a text-to-speech voice reads a WoW-parody Reddit story, with word-by-word
captions.

- Auto-starts on flight paths and stops when you land.
- Drag the phone up, TikTok style, to swipe to the next story.
- `/orctok` (or a keybind) toggles it by hand for long runs. Entering combat ends a manual session.
- Works on Forever (Interface 16001) and retail.

## Commands

| Command | Effect |
|---|---|
| `/orctok` | toggle the phone |
| `/orctok auto` | toggle auto-start on flight paths |
| `/orctok next` | skip to the next story |
| `/orctok voice [n\|default]` | list or pick a TTS voice |
| `/orctok rate <-10..10>` / `volume <0..100>` | speech speed / volume |
| `/orctok scale <0.5..2>` | phone size (Shift-drag to move, right-click to close) |
| `/orctok captions` | toggle word-synced captions (SAPI bookmarks) |
| `/orctok tune` | live tuning panel for camera, models and fog |
| `/orctok reset` | reset phone position and size |