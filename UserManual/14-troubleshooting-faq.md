# 14. Troubleshooting & FAQ

[← Recipes](13-recipes.md) · [Contents](README.md) · [Next: Safety & current limits →](15-safety-and-limits.md)

## "Can it do…?"

| Question | Answer |
|---|---|
| **Edit my models on the phone?** | Yes. Inputs, mixes, outputs, curves, logical switches, special functions, flight modes, timers, RF, failsafe. Changes are saved to the radio as you make them. |
| **Edit without the radio attached?** | You can browse cached models, your library, logs and settings. Edits need the radio attached, because the radio holds the model. |
| **Copy a model between radios?** | Yes: Export/library → **Restore to radio** on the other one. See [Models & backups](10-models-and-backups.md#copy-a-model-to-another-radio). |
| **Back up all my models?** | Export each one as an archive (model + image + logs + scripts) and keep them in the phone's library. **System › Backup** also saves the radio settings. |
| **Show telemetry on the phone?** | Yes: live tiles (**Telem**), widgets and full-size Lua telemetry screens (for example iNav OSD) on **Home**. No Bluetooth module or special build needed; it all goes over the USB cable. |
| **Voice call-outs through the phone?** | Yes. Radio sounds and Lua call-outs play on the phone's speaker, with text-to-speech when a voice file is missing. |
| **Show my flight on a map / find a lost model?** | The log viewer draws the **GPS track** from your SD logs, so the end of the track is where to look. Logging must be on and GPS telemetry present. |
| **View logs without a PC?** | Yes: **System › Flight Logs** copies them automatically and charts them. |
| **Run the ExpressLRS Lua?** | Yes, full size: **System › Tools**. |
| **Use iNav / Betaflight / Yaapu Lua?** | Single-file telemetry/OSD and tool scripts (iNav OSD, ExpressLRS) run on the phone's Lua engine; import them under **System › SD Card**. Scripts shipped as compiled multi-file `.luac` packages, such as **Yaapu**, don't run in the app yet. They still run on the radio itself. |
| **Use the radio as a simulator joystick?** | Yes, that's the radio's own feature. Set **USB mode: Ask** (System › Radio Setup › Sticks & ports) and pick *Joystick* when plugged into the PC. Companion builds: press ENTER on the UltraEdge screen ([how](02-getting-started.md#usb-mode-on-companion-builds)). |
| **Fly the model from the phone?** | **No, deliberately.** The phone never sends control signals. |
| **Work with iPhone?** | Not at the moment. Android only. |
| **Need internet or an account?** | No. Everything runs over USB and stays on the phone. |
| **Which radios?** | Made for any EdgeTX radio. Ready-made, verified firmware: RadioMaster Pocket, Zorro, TX16S; FrSky QX7 / QX7S (not the ACCESS model). Beta 1.1.22: ready-made builds for 56 radios. Others: build it yourself or ask. See [Supported radios](02-getting-started.md#supported-radios). |

## Connection problems

| Symptom | Fix |
|---|---|
| Nothing happens when I plug in | Use a **data** cable (many cables only charge). Set the radio's **USB mode** to *Ask* or *Serial*, not *Joystick* or *Storage*. Try the other end of an OTG adapter. |
| Phone won't connect to a **companion-build** radio | A companion build has no Radio Setup page, so the USB mode is set on the radio's **UltraEdge** screen (press the menu key). **1.1.22 and newer:** the radio keeps UltraEdge mode until you switch it off and never asks on connect; **USB now** must say *UltraEdge*. ENTER switches straight away (UltraEdge → Simulator → SD card), and a long ENTER saves the default. **1.1.20:** the screen shows **USB mode**; press ENTER until it says *Serial* (or *Ask*), then replug. **Older firmware, or no screen access:** on a computer, set `USBMode: 3` in `RADIO/radio.yml` on the SD card. |
| "USB permission not confirmed" | Unplug, replug, and accept Android's prompt. Tick *use by default*. |
| Stuck on **LINKING** | Unplug and replug once. Check the radio has UltraEdge firmware (Version page: `ultraedge-…`). Stock EdgeTX doesn't talk to the app. |
| Disconnects now and then | Check the cable and connector. The app reconnects by itself when you replug, and unsaved edits show a **Retry** dialog. |
| First connection after installing fails | Unplug and replug once; after that it's reliable. |

## Editing and saving

| Symptom | Fix |
|---|---|
| **"Edit not saved"** dialog | The radio didn't confirm the save, usually because the cable moved. Tap **Retry**. If it keeps happening, tap **Share diagnostics** and send it to us. |
| "Reading the model from the radio…" then a failure card | Tap **↻ Try again**. If the radio is busy (for example copying a log), it continues once that finishes. |
| A page says "Attach the radio to edit" | The pill is **DETACHED**. Plug the radio in. |
| The Function list is missing an option I've seen in videos | Your radio's firmware doesn't include that function (for example Lua on a radio built without it). UltraEdge shows only what your radio can run. |
| Changed something on the radio's own screen (TX16S) and the app doesn't show it | Leave the page and come back; the app re-reads the model. |

## The usual EdgeTX headaches

| Headache | What to do in UltraEdge |
|---|---|
| **"Throttle not idle" at every power-on** | Lower the throttle, or (only if you know why) turn off **Model › Pre-flight checks › Throttle warning**. Make sure the throttle isn't reversed by mistake (**Model › Throttle › Reversed**). |
| **"Switch warning" at power-on** | A switch isn't where the model expects. Move it, or change the expected position in **Model › Pre-flight checks** (or set *No check*). |
| **"Failsafe not set" warning** | **Model › Internal/External RF › Failsafe**: choose a setting. See the [failsafe recipe](13-recipes.md#failsafe). |
| **Switches don't reach Betaflight** | Every switch needs a **mix onto a channel**. See the [arm switch recipe](13-recipes.md#arm-switch-for-betaflight--inav-aux1--ch5). Check in **Monitor** that the channel moves. |
| **A servo goes the wrong way** | **Outputs › Inverted** on that channel. |
| **"Inputs vs Mixes" confusion** | Feel goes in Inputs, routing in Mixes, mechanics in Outputs. See [the three layers](06-inputs-mixes-outputs.md#the-three-layers-in-one-paragraph). |
| **ELRS Lua stuck on "Loading…"** | Module Type = CRSF, matching ELRS Lua version, correct baud rate. See [ExpressLRS](12-lua-tools-sd-sounds.md#expresslrs-and-other-tools). |
| **Sticks drift / don't reach the ends** | **System › Calibration**, especially after a firmware flash. |
| **Models lost after an upgrade** | Export archives before you flash; **Restore to radio** afterwards. |
| **Sound list empty / wrong voice** | The voice pack folder must match your language (`SOUNDS/en`…). **Import pack (.zip)**. |
| **Cryptic logical switch values** | UltraEdge shows and accepts real units (V, m, %, mm:ss). |

## Getting help

1. **System › Diagnostics › Share log** (or **Share diagnostics** on any error card).
2. Open an issue at <https://github.com/50UR4V/UltraEdge-app/issues>. Include your radio, its Version page
   lines (FW, VERS, GIT#, DATE), the app version (**System › About & Licenses**) and the log.
