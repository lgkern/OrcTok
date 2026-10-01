# First in-game run: checklist

Everything outside the game is tested (70 specs, luacheck clean). This list
covers what only the game can show. The items are in order, and each one names
the fix if it fails.

## 1. Load

- Copy or link the repo folder to `Interface/AddOns/OrcTok`, then log in to Forever.
- The addon list should show "OrcTok" as up to date (Interface 16001).
- If a Lua error appears, the error text points at the line.

## 2. Phone + TTS (`/orctok`)

- The phone appears at the right of the screen. A voice reads the post title while the white Reddit card shows.
- **If the voice reads tags aloud** ("less than bookmark mark…"), the client is not parsing SAPI XML. Run `/orctok captions` to turn it off. From the second utterance on, the addon already falls back to plain text when no bookmark event arrives.
- Captions should change word by word in step with the voice. If they drift, run `/orctok captions` to switch to the timing estimate and compare.
- No voice at all: run `/orctok voice` to list voices. With none installed, captions still play.

## 3. The scene (`/orctok tune`)

The defaults come from the models' M2 vertices and an offline point-cloud
render, not from looking at them in game. That render assumed the ModelScene
FOV is vertical. If the view looks zoomed out, with lots of empty water, the
FOV is probably horizontal, so lower Field of view to about 50. Expect to
adjust:

| Symptom | Slider |
|---|---|
| Nothing visible or all black | Field of view (try 40–90); Camera back/height |
| Looking at the sky or the floor | Camera pitch |
| Runner too small or large vs lanes | Runner scale, Lane width |
| Tram cars float or sink | Train z (≈ 16.9 × Train scale puts the car bottom on the floor) |
| Barriers face the wrong way | Barrier yaw (90 vs 0) |
| Gravel too coarse/fine, busy or bright | Ground tile yards, Ground texture, Ground brightness |
| Ground fades too early/late | Haze start |
| Gaps or overlaps between track pieces | Track spacing |
| Objects pop in or fade too early | View distance, Fade-in length |
| Sky cut off or missing | Sky radius (the far clip is 1.5× this) |

Use "Pause" to freeze the course while you adjust. "Export" prints the non-default
values. Paste them back into `Config.TUNE` defaults in `core/config.lua`.

If a model looks bad, type a different file id into its box. The swap is live.
Candidates already checked to exist in Forever:

- Barriers: 192879 Hellfire_barrier, 194893 ND_Human_Barrier, 189827 ElwynnMineCart
- Tracks: 189622 GoldmineTracks
- Scenery: 197688 GnomeSubwaySign, 197753 UnderwaterLightShaft, 189825 LampPost
- Coins: 200137 GoldPilesmall01
- Ground textures: 186856 AshzaraBeachGravelGrey (default), 187140 ElwynnRockGravel, 186855 AshzaraBeachGravel, 187415 SilverMystDirtRoad, 187666 DB_TitanRoadE

Every session picks a random skybox from `Scene.SKIES` in `ui/scene.lua`.

## 4. Flight path

- Take a flight path. The phone should appear within about 1 second of takeoff and hide on landing.
- `/orctok auto` turns auto-start off.

## 5. Retail

- Same checks on retail (Interface 120007/120100). The code uses the same API calls on both.
