# UltraEdge

**Your Android phone as the big touchscreen for an EdgeTX radio — over a USB cable, without ever
touching the flight-control path.**

Keep the radio you love in your hands, and let the interface, computing and RF evolve around it.
UltraEdge is building toward a **modular radio control system** — one where the feel of your gimbals,
the placement of your switches and the shape of your case can stay right for you, while the screen,
processing and RF improve at their own pace. The **Android companion** is the first practical step.

<a href="https://play.google.com/store/apps/details?id=com.ultraedge.companion"><img alt="Get it on Google Play" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" width="220"></a>

UltraEdge is an Android companion for compatible [EdgeTX](https://edgetx.org) radios running UltraEdge
firmware. Plug the phone into the radio's USB port and it provides a touch interface for supported
configuration, telemetry and tools — model config, mixers, inputs, telemetry, channel monitors, screens
and audio — on a modern touchscreen. **The radio keeps running its own real-time control processing.**
Unplug the phone and the radio carries on executing its active model; only the companion display,
telemetry, audio and tool sessions are lost.

Note that the phone *can* change supported model and radio settings, and those changes are validated and
applied by the radio — so edit with the same care you would on the radio itself.

> This repository is the app's **public home**: user manual, privacy policy, changelog, and issue
> tracker. The app is distributed **only through Google Play** — there are no APK downloads here, and the
> app source is not published.

## Features
**Today the app works locally over USB.**

- Live dashboard — trims, sticks, timers, battery, RSSI, flight mode, and telemetry/OSD screens
- Full model editing — inputs, mixes, outputs, curves, logical switches, special functions, GVars,
  flight modes, telemetry sensors
- Radio settings — backlight, sticks, units, time, hardware, switch names
- Guided, graphical **stick/pot calibration**
- Live telemetry + sensor **Discover**
- **Flight logs** — pull `.csv` logs off the radio to your phone, share them
- Model + radio-settings **local backup**, SD-card content, sounds and tools
- **Lua tools** — supported tools such as ExpressLRS parameter read/write run inside the app

## Supported radios
Compatible EdgeTX radios running UltraEdge firmware (v1.0.2 documents UE Protocol v4 and app v1.0.7 or
later). Build or flash the firmware from the EdgeTX-UE project (below).

| Radio | Status |
|---|---|
| FrSky **QX7**, RadioMaster **Pocket** | ✅ Verified on hardware |
| RadioMaster **TX16S** | ✅ Verified on hardware — telemetry-screen refresh is slower than on mono radios; ExpressLRS Lua tools verified with an ELRS module |
| RadioMaster **Zorro** | ⚠️ Prebuilt firmware released, **not yet hardware-verified** |

See the [firmware release notes](https://github.com/50UR4V/edgetx-ue/releases) for the current status.

## Get it
1. Install from **[Google Play](https://play.google.com/store/apps/details?id=com.ultraedge.companion)**
   (Android 7.0+, a phone with USB host/OTG).
2. Flash the UltraEdge companion firmware to your radio — see **[EdgeTX-UE](https://github.com/50UR4V/edgetx-ue)**.
3. Plug in over USB and tap **Open UltraEdge**. Full guide: **[User Manual](USER-MANUAL.md)**.

## Screenshots
<table>
  <tr>
    <td width="50%"><img src="screenshots/UE_IMG4.jpeg" alt="Home dashboard — RSSI, battery, timer, model photo"><br><sub>Home dashboard on a RadioMaster radio — live RSSI, battery, timer.</sub></td>
    <td width="50%"><img src="screenshots/UE_IMG3.jpeg" alt="Phone mounted on a RadioMaster Pocket running a Lua telemetry screen"><br><sub>Phone mounted on a Pocket — a Lua telemetry screen on the big display.</sub></td>
  </tr>
  <tr>
    <td width="50%"><img src="screenshots/UE_IMG1.jpeg" alt="Live telemetry sensors grid"><br><sub>Live telemetry — discover and view all your sensors.</sub></td>
    <td width="50%"><img src="screenshots/UE_IMG2.jpeg" alt="Telemetry / OSD screen with artificial horizon"><br><sub>Your radio's telemetry/OSD screens, rendered on the phone.</sub></td>
  </tr>
</table>

## The UltraEdge ecosystem
- **[UE Protocol](https://github.com/50UR4V/ue-protocol)** — the radio↔phone interface UltraEdge speaks
  (spec + reference codec + tests).
- **[EdgeTX-UE](https://github.com/50UR4V/edgetx-ue)** — the EdgeTX companion firmware, offered upstream.
- **[UltraEdge Mounts](https://github.com/50UR4V/ultraedge-mounts)** — community 3D-printable mounts to
  hold the phone on your radio.

## Where we're heading
The Android app is one step toward the modular system. These are **future directions — not available
today**:
- **Modular hardware** *(future)* — a replaceable control-processor daughterboard with clear boundaries
  for power, I/O, controls, RF and display. Designed toward long-term serviceability and upgrades; no
  released module kit, connector standard or date, and no promise of permanent compatibility.
- **Opt-in cloud backup** *(future)* — selected logs and model data could back up automatically after
  setup. The current app is local only.
- **Map view of telemetry** *(future, exploratory)*.
- **External digital-video display** *(future, exploratory)* — DJI, Walksnail, OpenIPC and HDZero are
  research examples, not supported integrations.

UltraEdge builds on what the EdgeTX community has made possible.

## Privacy & licenses
UltraEdge collects **no personal data** and talks only to your radio over USB. See the
**[Privacy Policy](PRIVACY.md)** and **[Open-Source Notices](OPEN-SOURCE-NOTICES.md)** (it embeds
unmodified MIT-licensed Lua; the companion firmware is GPL-3.0). The app itself is proprietary; UE Protocol is open and
will remain open source, and the firmware is GPL-3.0.

## Become a beta tester
UltraEdge is in closed testing on Google Play. Want early access and to help shape it?
**[📧 Request to be a beta tester](mailto:50ur4v.x@gmail.com?subject=UltraEdge%20beta%20tester&body=Hi%2C%20I%27d%20like%20to%20join%20the%20UltraEdge%20beta.%20My%20radio%3A%20____%20%28e.g.%20QX7%2FPocket%29.%20My%20Google%20account%20email%20for%20Play%20access%3A%20____)**
— tell me your radio and the Google account email you use on Google Play, and I'll add you to the test track.

## Support
Found a bug or have a request? **[Open an issue](https://github.com/50UR4V/UltraEdge-app/issues)** —
include the diagnostics log (in-app: Radio Settings ▸ Diagnostics ▸ Share log).

---
*UltraEdge is an independent community project and is not affiliated with or endorsed by EdgeTX or FrSky.
EdgeTX and FrSky are trademarks of their respective owners.*
