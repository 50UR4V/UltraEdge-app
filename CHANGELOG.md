# Changelog

*Production = hardware-verified, flightline-ready (Google Play production). Beta = early access (Google Play open
testing); features are emulator-tested and still collecting hardware mileage.*

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
