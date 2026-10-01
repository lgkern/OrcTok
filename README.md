# OrcTok

OrcTok brainrot for your flight paths. When you take a flight path, a 9:16 phone
appears. Your character runs through a procedurally generated Deeprun Tram course
while a text-to-speech voice reads a WoW-parody Reddit story, with word-by-word
captions.

- Auto-starts on flight paths and stops when you land.
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
| `/orctok scale <0.5..2>` | phone size (drag to move, right-click to close) |
| `/orctok captions` | toggle word-synced captions (SAPI bookmarks) |
| `/orctok tune` | live tuning panel for camera, models and fog |
| `/orctok reset` | reset phone position and size |

## Adding stories

All stories live in [stories.lua](stories.lua). Copy an entry to add one, and
delete an entry to remove one. Titles must be unique, because the shuffle bag keys
stories by title. The file header lists the optional fields.

## Layout

| File | Role |
|---|---|
| `core/rng.lua` | seeded PRNG (deterministic courses) |
| `core/text.lua` | story → utterances, SAPI bookmark XML, caption timing estimate |
| `core/sim.lua` | 3-lane runner + autopilot bot. Each row reserves a safe lane, so the bot never crashes. |
| `core/playlist.lua` | shuffle bag over `stories.lua` |
| `core/narrator.lua` | TTS queue and caption state machine, with fallbacks |
| `core/config.lua` | SavedVariables defaults + the `/orctok tune` table |
| `core/session.lua` | ties phone, scene and narrator together |
| `ui/scene.lua` | ModelScene renderer (pooled actors) |
| `ui/phone.lua` | OrcTok chrome: search bar, post card, captions, rail, watermark |
| `ui/tune.lua` | tuning panel |
| `main.lua` | SavedVariables, flight-path/combat triggers, slash commands |

## Tests

From the repo root, run in PowerShell:

```powershell
& "C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\systree\bin\busted.bat"
& "C:\ProgramData\chocolatey\lib\luarocks\luarocks-2.4.4-win32\systree\bin\luacheck.bat" . --no-color -q
```

CI (`.github/workflows/ci.yml`) runs both on every push.

`ui_smoke_spec` runs the real UI files against permissive widget fakes. It catches
Lua errors, but it cannot check layout or rendering. Only the game can check those.

## Releasing

Push a version tag: `git tag v0.1.0 && git push origin v0.1.0`. The BigWigs packager
(`.github/workflows/release.yml`, configured by `.pkgmeta`) builds `OrcTok-v0.1.0.zip`
with the `OrcTok/` folder and fills in `@project-version@`. It then attaches the zip to
a GitHub release. CurseForge and Wago uploads start once their secrets
(`CF_API_KEY`, `WAGO_API_TOKEN`) and TOC ids (`X-Curse-Project-ID`, `X-Wago-ID`) exist.
