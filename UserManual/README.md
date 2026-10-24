# UltraEdge User Manual

UltraEdge turns your Android phone into the touchscreen for your **EdgeTX** radio. Plug the phone into the
radio's USB port and you can set up models, read telemetry, watch the flight screen, bind receivers, run ExpressLRS
Lua and review flight logs. You do all of it on a large touch display, without scrolling through menus on a 128×64
screen.

![The UltraEdge Home screen](media/home.jpg)

> If you already fly EdgeTX, the manual uses EdgeTX names throughout (Inputs, Mixes, Logical Switches…), so everything you know carries over. Look for
> **EdgeTX ↔ UltraEdge** boxes where something is different.

## Which version?

| | App | Firmware | Status |
|---|---|---|---|
| **Production** | 1.3.2 (Google Play) | v1.1.2.3, full build | Tested on real hardware: Pocket, Zorro, TX16S, QX7 |
| ![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) **Beta** | 1.4 (Google Play open testing) | 1.1.22 (GitHub pre-release) | Early access. Tested on the emulator; still collecting hardware mileage. Bench-test before flying. |

Sections marked ![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) describe beta features. Everything else works in the production app.

## Contents

| # | Section | What's in it |
|---|---|---|
| 1 | [Overview](01-overview.md) | What UltraEdge is and isn't, how it compares to EdgeTX, safety model |
| 2 | [Getting started](02-getting-started.md) | Supported radios, flashing, installing, first connection, companion builds |
| 3 | [Finding your way around](03-finding-your-way.md) | Tabs, two-pane editing, saving, Back, status messages |
| 4 | [Home, Monitor & Telemetry](04-home-monitor-telemetry.md) | Flight screens & widgets, channel monitor, sensors, call-outs |
| 5 | [Model setup & RF](05-model-setup.md) | Name, timers, trims, throttle, **binding, range check, failsafe** |
| 6 | [Inputs, Mixes & Outputs](06-inputs-mixes-outputs.md) | Rates & expo, the mixer, servo direction/limits, live response preview |
| 7 | [Curves](07-curves.md) | Curve editor, presets, mirror |
| 8 | [Logic, Functions, GVars & Flight modes](08-logic-functions-gvars-modes.md) | Logical switches, special functions, global variables, flight modes & trims |
| 9 | [Radio settings](09-radio-settings.md) | Radio Setup, Hardware, Switches, Trainer, **Calibration**, My Radios |
| 10 | [Models & backups](10-models-and-backups.md) | Manage Models, duplicate/delete/select, library, archives, copy between radios |
| 11 | [Flight logs](11-flight-logs.md) | Logging, automatic copy, the built-in log viewer (charts + GPS track) |
| 12 | [Lua, Tools, SD card & Sounds](12-lua-tools-sd-sounds.md) | ExpressLRS Lua, Lua widgets, importing scripts & voice packs |
| 13 | [Recipes: how do I…?](13-recipes.md) | Step-by-step for the common jobs (see the finder below) |
| 14 | [Troubleshooting & FAQ](14-troubleshooting-faq.md) | "Can it do X?", fixes for the usual EdgeTX headaches |
| 15 | [Safety & current limits](15-safety-and-limits.md) | What the app never does, what still needs the radio |

## "How do I…?" finder

| I want to… | Go to |
|---|---|
| Bind or re-bind a receiver (ELRS, FrSky, Multi) | [Recipe: bind](13-recipes.md#bind-or-re-bind-a-receiver) |
| Set up an **arm switch** for Betaflight / INAV | [Recipe: arm switch](13-recipes.md#arm-switch-for-betaflight--inav-aux1--ch5) |
| Set **failsafe** correctly (and know when it doesn't matter) | [Recipe: failsafe](13-recipes.md#failsafe) |
| Add a **throttle cut** / throttle hold | [Recipe: throttle cut](13-recipes.md#throttle-cut--throttle-hold) |
| Set up **dual rates & expo** | [Recipe: rates & expo](13-recipes.md#dual-rates--expo-on-a-switch) |
| Mix a **flying wing (elevons)**, **V-tail**, **flaperons** | [Recipes: wings & tails](13-recipes.md#elevon-flying-wing--delta-mixing) |
| Reverse a servo, set endpoints / subtrim | [Outputs](06-inputs-mixes-outputs.md#outputs) |
| Get a **battery-voltage / RSSI warning** | [Recipe: telemetry alarms](13-recipes.md#low-battery--link-quality-warning) · [Telem › ⚠ Alarms](04-home-monitor-telemetry.md#telemetry) |
| Make a **timer** that runs with the throttle | [Recipe: throttle timer](13-recipes.md#a-flight-timer-that-runs-with-the-throttle) |
| Run the **ExpressLRS Lua** (power, packet rate, model match, WiFi) | [ExpressLRS](12-lua-tools-sd-sounds.md#expresslrs-and-other-tools) |
| Hear **voice call-outs** | [Recipe: call-outs](13-recipes.md#voice-call-outs-on-a-switch) |
| Turn on **flight logging** and see the flight on a map | [Flight logs](11-flight-logs.md) |
| Back up a model or **copy it to another radio** | [Models & backups](10-models-and-backups.md) |
| Start a **new model** from scratch | [Manage Models › ＋ New model](10-models-and-backups.md#manage-models) |
| Same function on **every model** (volume knob, voltage call-out) | [Global functions](08-logic-functions-gvars-modes.md#global-functions) |
| **Calibrate** sticks and pots | [Calibration](09-radio-settings.md#calibration) |
| Stop the model starting **armed / at full throttle / with flaps out** (switch, throttle & pot warnings) | [Pre-flight checks](05-model-setup.md#pre-flight-checks) |
| Use a **buddy box / trainer** | [Recipe: trainer](13-recipes.md#trainer--buddy-box) · [Model › Trainer](05-model-setup.md#trainer-buddy-box) |

## How these images were made

Every still and clip in this manual comes from the UltraEdge **demo** app running on an Android emulator. The demo
has a synthetic radio and a sample flying-wing model ("DEMO WING"), so names and values in the pictures are examples.
Grey dots in the clips show where a finger touched.

## The UltraEdge ecosystem

- **UltraEdge app** (this manual, issues, changelog): <https://github.com/50UR4V/UltraEdge-app>
- **EdgeTX-UE firmware** (download/flash for your radio): <https://github.com/50UR4V/edgetx-ue>
- **UE Protocol** (the open radio↔phone protocol): <https://github.com/50UR4V/ue-protocol>
- **3D-printable phone mounts**: planned

[![App: proprietary](https://img.shields.io/badge/app-proprietary-lightgrey.svg)](https://github.com/50UR4V/UltraEdge-app/blob/main/OPEN-SOURCE-NOTICES.md)
[![Firmware: GPL v2](https://img.shields.io/badge/firmware-GPL%20v2-blue.svg)](https://github.com/50UR4V/edgetx-ue)
[![Protocol: MIT](https://img.shields.io/badge/protocol-MIT-yellow.svg)](https://github.com/50UR4V/ue-protocol)
[![Manual: CC BY 4.0](https://licensebuttons.net/l/by/4.0/80x15.png)](https://creativecommons.org/licenses/by/4.0/)

---
UltraEdge is a community project. It is not affiliated with or endorsed by EdgeTX, FrSky, RadioMaster or ExpressLRS.
