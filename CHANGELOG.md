# Changelog

*Production = Google Play production, hardware-verified. Beta = Google Play open testing, early access to the next
version. In release 1.6 both tracks run the same app.*

## v1.6.6 — Production · v1.6.7 — Beta · November 2026
- Pairs with UltraEdge firmware **v1.2.1**, as 1.6.4 did. No firmware update needed.
- **Lua works more like on the radio.** Lua screens and widgets animate smoothly, and their call-outs play on Home
  (iNav's armed, GPS and battery call-outs were silent since 1.5.1). Values come back as the radio gives them, so
  iNav shows "14" satellites, not "14.0". Maths such as `atan2` works, and more EdgeTX scripts run.
- **Lua tools** draw sharp and fast and read your sticks live, so StickTime can be flown as a tool.
- **A script that misbehaves can't spoil the session.** A stuck script is stopped with a message and the app keeps
  running. A widget that hits an error stops instead of repeating its call-outs, and starts again when the radio
  reconnects or the model changes.
- **System › Downloads** now reads its list from UltraEdge's public GitHub page, so new entries appear without an app
  update. New: the StickTime simulator and the ExpressLRS V3 and V4 Lua scripts.
- Lua widgets can draw at the widget's own size.
- Updates keep your models, files and settings.

## v1.6.4 — Production · v1.6.5 — Beta · November 2026
- Pairs with UltraEdge firmware **v1.2.1** on both tracks ([GitHub](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.2.1)).
  Firmware v1.2.0 still works; the app then says which features need the update and how to get it.
- **Saves take about a second.** A small change (a weight, a name) is shown at once and saved in the background, with a
  thin line at the top while it runs; nothing locks. The change stays on the phone until the radio confirms it.
- **Special functions work as on the radio.** New function opens the full editor on the first free slot, and you can set
  the function before the trigger or the other way round. The trigger list is the radio's own: switches, trims,
  logical switches, ON, One, flight modes, telemetry, Act and Trn, with Invert. Play Track and Background music list the
  radio's sounds, Play Script only its `SCRIPTS/FUNCTIONS` scripts. The row menu says Clear, which is what it does.
- **Your radio's own names.** The app lists only the switches your radio has, by the radio's names (on a QX7 the fifth
  switch is SF), without a middle position on a two-position switch, and shows inputs by their names (Ail, Ele…).
- **New mix and New input go on the channel you pick**, from the list of channels or inputs without lines, as on the
  radio. Before, New mix added a line to the selected line's channel.
- **System › Files:** the radio's SD card on the phone. Copy files between the radio and the phone, make folders, and
  delete files and empty folders (long-press a folder). The radio's MODELS and RADIO folders are never written.
- **Move a stick or switch to find it**, in every source and switch list: its row is highlighted; tap it to choose it,
  or go back to keep what was there (as on a colour EdgeTX radio).
- **Calibration shows every pot, slider and 6-position switch** your radio has, by its own names. The 6-pos counts 1–6
  as you press its buttons, and the app warns before saving with only some of them. With firmware v1.2.1 a 6-pos that a
  settings reset left uncalibrated works again at start-up (TX16S and similar).
- **QX7 and similar radios are recognised** (STM32F2 radios, with firmware v1.2.1), so each keeps its own lists.
- **Home screens survive the firmware update.** Screens saved while the radio couldn't identify itself (firmware v1.2.0
  on a QX7 and similar) or by an older app come back when the radio first identifies itself. When there is more than one
  saved copy, **Upgrade saved Home screens** lists each with its date and widgets so you pick. Nothing is deleted.
- Back from older versions: the live output bar on each Mixes channel, text fields that stop at the radio's length
  limit, every voice language in Sounds, and model backups that include the radio settings.
- Beta 1.6.5 is the same app as 1.6.4.

## v1.6.2 — Production · v1.6.3 — Beta · November 2026
- Pairs with UltraEdge firmware **v1.2.0** on both tracks ([GitHub](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.2.0)).
  Older firmware works, with a simpler receiver card.
- Pocket, Zorro and QX7 move to the companion build, where the phone holds the menus. Want the radio's own menus? Use
  the [v1.1.2.4](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.1.2.4) full builds.
- New in production from the 1.4 beta: flight-log viewer (charts and GPS track) with automatic newest-first log copy,
  My Radios, Radio Setup in two panes, flight-mode trim modes, curve presets and mirror, live response preview, model
  Trainer mode, timer switch, pre-flight checks (throttle, switches, pots/sliders), GVar values per flight mode,
  telemetry alarms and vario, global functions, New model, the radio's firmware version in About radio and My Radios,
  and the USB mode kept until power-off.
- Beta 1.6.3 is the same app as 1.6.2.

One look everywhere:
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
- **Voice packs and iNav Lua in the app** (System › Downloads, or Phone storage › Get packs): the EdgeTX voice pack and
  iNav's Lua telemetry, downloaded only when you ask, with size, version and licence shown first and every file checked.
- **GPS on Value and Big value widgets**, in the radio's own format (degrees-minutes-seconds or NMEA).
- **One change at a time.** While the app writes to the radio (a save, a new mix or input, a model switch, duplicate,
  delete or restore, radio settings, calibration) it shows what it is doing and can't be tapped until the radio
  confirms, so two changes never cross. If a save fails, the card offers Retry, Discard and Diagnostics; unplugging
  mid-save keeps your change on the phone for a Retry.
- **The radio is identified first.** On every connect the app asks the radio who it is before reading anything, so on
  firmware that identifies the radio (all except STM32F2 radios until v1.2.1, see Known issue) one radio's models, Home
  screens and settings never show up on another. The model list in the top bar loads by itself.
- **Report a bug / Request a feature** (System › Feedback): share a bug report with the diagnostic log wherever you
  choose, or open a GitHub issue with your versions filled in. The app sends nothing by itself.

Fixes:
- Changes made in the app could be lost on the radio when you moved to another page while a save was finishing, or
  when a save failed. They are now kept and sent, and the app says when one couldn't be.
- **Home** came back empty after an update or restart on some phones. Your screens are now kept per radio and model,
  and screens saved by older versions are carried over.
- **＋ New mix / ＋ New input** now show progress and open the new line; a refusal says why, with Retry.
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

Known issue: FrSky QX7 and other radios with an STM32F2 processor (X9D, X9D+, X9 Lite, T12, TX12, T8 and similar) can't
tell the app who they are on firmware v1.2.0, so My Radios and per-radio lists use one shared set for them. Fixed in
firmware v1.2.1.

Updates keep your models, SD card files and settings, including from production 1.3.2. (1.5.0–1.5.2, 1.3.3 and
1.6.0/1.6.1 were built but never released; their changes are included here.)

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
