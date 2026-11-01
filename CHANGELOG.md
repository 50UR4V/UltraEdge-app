# Changelog

*Production = hardware-verified (Google Play production). Beta = early access (Google Play open
testing); features are emulator-tested and still collecting hardware mileage.*

## v1.6.0 — Production · v1.6.1 — Beta · "One UI" · November 2026
The beta feature set comes to production. Pairs with UltraEdge firmware **v1.2.0** on both tracks
([GitHub](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.2.0)); older firmware works, with a simpler receiver card.
Black-and-white radios (Pocket, Zorro, QX7) move to the companion build, where the phone holds the menus; the
[v1.1.2.4](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.1.2.4) full builds stay available if you want the radio's
own menus. New in production from the 1.4 beta: the flight-log viewer (charts and GPS track) with automatic newest-first
log copy, My Radios, Radio Setup in two panes, flight-mode trim modes, curve presets and mirror, live response preview,
model Trainer mode, timer switch, pre-flight checks (throttle, switches, pots/sliders), GVar values per flight mode,
telemetry alarms and vario, global functions, New model, the radio's firmware version in About and My Radios, and the
USB mode kept until power-off. Beta 1.6.1 is the same app as 1.6.0. One look everywhere:
- **Model** uses the same two panes as the other model pages, with a one-line summary per section.
- **Bind and range check** show what's happening: a timer, *Receiver connected ✓* when telemetry comes in, the live
  signal during a range check, and only the actions your module supports.
- **System** fits on one screen in three groups (Radio, Models and files, App). **Phone storage** replaces SD Card and
  Sounds, with one Import for scripts, sounds, images and packs. Switches and Calibration sit under Hardware, as in
  EdgeTX. **About radio** shows the firmware version and backs up `radio.yml`.
- **My Radios** fixed: a radio whose firmware can't identify itself no longer uses the last radio's lists; each radio
  can be named or forgotten.
- **Plug into another radio and its models are there.** Every time a radio attaches, the app reads its model list by
  itself (Manage Models and the top-bar list show the progress) and never shows the previous radio's models or
  settings meanwhile.
- **All settings** lists every setting in the radio's own words (Multi-module, Per model, Off) instead of stored
  names, and long values such as the firmware line in My Radios wrap instead of squeezing their label.
- **Switch models from the top bar.** The model the radio is flying shows on every page. Tap it for a short list
  (favourites and recent models first), then **press and hold** a model to switch. A tap never switches, and the radio
  still refuses while the throttle isn't at idle.
- **The app always shows the radio's real model.** After a switch, a refused or unanswered switch, a reconnect, or a
  switch made on the radio itself, the app reads the model again and says so until it knows. Firmware v1.2.0 tells the
  app at once; with older firmware a switch on the radio is noticed within about 2 s by the model's name.
- **Report a bug / Request a feature** (System › Feedback): share a bug report with the diagnostic log wherever you
  choose, or open a GitHub issue with your versions filled in. The app sends nothing by itself.

Fixes:
- Trim and key beeps on Android sounded like one flat tone and most were skipped. The phone now plays the radio's own
  tones: the pitch follows the trim, with your Speaker pitch and Beep length.
- Model-tab changes could be undone by a later edit on another model page.
- A bind or range check now stops when you leave the page, background the app or unplug.
- Text fields open ready to type.
- **Manage Models** lists the radio's active model first. On a radio with many models it was far down the list.
  A radio that doesn't answer with its model index now also finds models saved as `model1.yml`…`model9.yml`
  (colour radios).
- A radio that offers more than one USB connection still connects: Android picks the UltraEdge serial link.
- The link reconnects faster after a cable blip.
- Lua screens: EdgeTX's full set of key events is defined, so the iNav stick menu no longer opens on any stick move.

Updates keep your models, SD card files and settings, including from production 1.3.2. (1.5.0–1.5.2 and 1.3.3 were
built but never uploaded; their changes are included here.)

## v1.4.3 — Beta (open testing) · October 2026
Needs UltraEdge firmware **1.1.22** ([GitHub pre-release](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.1.22), 56
radios). Fixes a Special Function set to play once (1x) replaying every second (the Repeat type-in box turned "1x" into
1 s). Background music stops, pauses and resumes with its switch. New App Settings option to show or hide the mute
button. Companion firmware: the USB mode is set on the radio's UltraEdge screen and kept until power-off ([ENTER]
switches it now, a long [ENTER] saves the default), so a loose cable reconnects without asking. About › Radio firmware
and My Radios show the radio's UltraEdge firmware version, commit and build date. Dev builds install separately as
"UltraEdge Dev". Updates keep the virtual SD card, model screens and settings. (1.4.1 and 1.4.2 were never released.)

## v1.3.2 — Production · October 2026
Pairs with firmware **v1.1.2.3** ([GitHub](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.1.2.3)). Fixes a Special
Function set to play once (1x) replaying every second: tapping the Repeat value and saving turned "1x" into 1 s. Background
music now stops and pauses with its switch (needs firmware v1.1.2.3). New App Settings option to show or hide the mute
button. Diagnostics now record the sounds the radio asks the phone to play and each Special Function's repeat setting. Updates keep
the virtual SD card, model screens and settings. (1.3.1 was never released; its changes are included here.)

## v1.4.0 — Beta (open testing) · October 2026
Needs UltraEdge firmware **1.1.18** ([GitHub pre-release](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.1.18)). Adds companion-only firmware for Pocket / QX7 / Zorro (the
phone holds the menus), a built-in flight-log viewer (charts and GPS track) with automatic newest-first log copy,
My Radios (each radio recognised, separate caches), Radio Setup in two panes, flight-mode trim modes, curve presets
and mirror, live response preview, model Trainer mode, timer switch, pre-flight checks (throttle, switches,
pots/sliders), GVar values per flight mode, telemetry alarms and vario, global functions and New model. Also: model
saves confirmed chunk by chunk ("push out of sequence" fixed), the Special Function list taken from the radio, and the
UltraEdge version on the radio's Version page.

## v1.3.0 — Production (first public release) · October 2026
The hardware-verified v1.2.13 feature set, for Google Play production, with: corrected open-source licence notices
(EdgeTX GPL-2.0-only, UE Protocol MIT, fonts under the SIL OFL), User Manual / issue / firmware links and a tappable
contact in About, and Android app-data backup turned off (matches the privacy policy). Pairs with firmware **v1.1.2**.

## v1.2.13 — Manage Models, restore, full model editing, new Monitor
Manage models on the radio from your phone (select, copy, delete), back them up to a library on the phone and
restore them to the radio. Every model page now has an EdgeTX-matched two-pane editor (inputs, mixes, outputs,
curves, logical switches, special functions, GVars, flight modes). Also: Trainer setup, a Monitor showing your
physical sticks, pots and switches, Back that steps back instead of exiting, per-control calibration display,
phone-side backlight/volume/haptics and many fixes. Needs UltraEdge firmware v1.1.2.

## v1.0.7 — Lua tools in the app
Run EdgeTX Lua tools in the app: ExpressLRS (elrsV3.lua) loads, navigates and edits on the phone with the on-radio
look. Smoother Lua imports (choose Tools / Telemetry / Functions), a clearer full-screen tool view, readable errors,
and the "new input nests in the previous line" bug fixed. Pairs with firmware v1.0.1.

## v1.0.0 — first release (testers)
First public release: connect an Android phone to an EdgeTX radio over USB to edit models, view
telemetry, calibrate, and pull flight logs. See the User Manual to get started.
