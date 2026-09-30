# UltraEdge — User Manual (draft)

*Draft for review. Becomes the manual in the public `ultraedge-app` repo. Screenshots to be added
(marked ⟪shot⟫). Written for a pilot who already flies an EdgeTX radio.*

## What UltraEdge is
UltraEdge turns your Android phone into the big touchscreen for an **EdgeTX** radio that only has a
small mono screen and a few buttons. Plug the phone into the radio's USB port and it shows the model
config, mixers, inputs, telemetry, channel monitors, screens and audio on a modern touch display.

**The radio always flies on its own.** The phone is a companion display and editor only — it is never
in the flight-control path. Unplug it mid-flight and nothing about how the radio flies changes.

## What you need
- An **EdgeTX radio** running the UltraEdge companion firmware. Verified radios: **FrSky QX7** and
  **RadioMaster Pocket**. (Firmware is flashed from the EdgeTX-UE project — see the links at the end.)
- An **Android phone**, Android 7.0 or newer, with **USB host / OTG** support (most phones since ~2017).
- A **USB-C-to-USB cable** matching your radio's port (the same cable you'd use for the SD card).

## Install
1. Get UltraEdge from **Google Play** (link at the end). Android 7.0+.
2. Flash the UltraEdge companion firmware to your radio (see the EdgeTX-UE project link). Your radio
   keeps all its normal EdgeTX behavior; the companion is an addition that only activates over USB.

## First connection
1. On the radio, set the USB mode so it can present a serial connection (EdgeTX: **Radio Settings ▸
   Hardware/USB**, or leave it on **Ask**). ⟪shot⟫
2. Plug the phone into the radio with the USB cable.
3. Android asks **"Open UltraEdge for this USB device?"** — tap **OK** (tick "use by default" to skip it
   next time). UltraEdge opens full-screen and connects. ⟪shot⟫
   - *First time after installing:* if it doesn't connect on the very first plug-in, unplug and replug
     once — subsequent connections are automatic.
4. The header shows **Connected · <model name>** when the link is live.

## The screens
- **Home / Screens** — your flight dashboard: trims, sticks, timers, battery, RSSI, flight mode, and any
  telemetry/OSD widgets (including iNav/Yaapu-style Lua screens). Swipe between screens; long-press to
  edit a screen's layout. A **🔊 / 🔇** button in the corner mutes call-outs instantly (see Audio). ⟪shot⟫
- **Monitor** — live channel-output bars.
- **Model config** — Inputs, Mixes, Outputs, Curves, Logical Switches, Special Functions, Global
  Variables, Flight Modes, Telemetry. Tap a row to edit; changes are written to the radio. For a Source
  field you can just **move the stick/switch** and it's selected. ⟪shot⟫
- **Telemetry** — live sensor values; **Discover** adds new sensors to the model (same as the radio's
  own Telemetry ▸ Discover).
- **Radio Settings (System tab)** — Radio Setup (backlight, sticks, units, time, USB), Hardware,
  Switches (name them), **Calibration** (guided stick/pot calibration on the branded radio graphic),
  SD Card / Sounds / Tools, **Backup**, and **Flight Logs**. ⟪shot⟫
- **Flight Logs** — lists the `.csv` logs on your radio's SD card; tap **Pull** to copy one to the phone,
  then **Share** or **Delete** it. *(Cloud backup and 3D replay are coming in a future update.)* ⟪shot⟫
- **App Settings & About** (System ▸ UltraEdge App) — call-out mute, connectivity, version, licenses,
  and support.

## Audio & call-outs
EdgeTX sound events and on-phone Lua call-outs play through the phone speaker. If a script asks for a
voice file you don't have installed, UltraEdge **speaks it with TTS** instead and nudges you to import
the voice pack (Radio Settings ▸ Sounds). To silence everything instantly — e.g. a repeating alarm — use
the **🔊/🔇** button on the flight screen or **App Settings ▸ Mute call-outs**. This leaves your phone's
own media volume untouched.

## Troubleshooting
- **Won't connect the first time after install** — unplug/replug once; it's reliable afterward. If it
  still won't, set the radio USB mode to **Ask** and pick **Serial** when you plug in.
- **Connection drops** — UltraEdge re-connects automatically when you replug. If the app seems stuck,
  swipe it away and reopen.
- **Call-outs are spoken robot-voice (TTS), not real audio** — you don't have the voice pack the script
  expects; import it under Radio Settings ▸ Sounds, or mute call-outs.
- **A log won't pull** — stay on the System tab during the pull (it keeps the link quiet); large logs
  take a few seconds.
- **Something's wrong and you want to report it** — Radio Settings ▸ Diagnostics ▸ **Share log**, and
  attach it to an issue (support link below).

## Safety
- The radio is always in command. UltraEdge cannot send stick/throttle/failsafe — it only reads and
  edits configuration and shows telemetry. If the phone disconnects, crashes, or is unplugged, the radio
  keeps flying the active model from its own memory.
- Always range-check and confirm your model behaves correctly on the radio itself before flight.

## The UltraEdge ecosystem
- **UE Protocol** (the open radio↔phone protocol): `https://github.com/50UR4V/ue-protocol`
- **EdgeTX-UE firmware** (build/flash it for your radio): `https://github.com/50UR4V/edgetx-ue`
- **3D-printable mounts** for phone-on-radio: `https://github.com/50UR4V/ultraedge-mounts`
- **Support / report an issue:** `https://github.com/50UR4V/UltraEdge-app/issues`
