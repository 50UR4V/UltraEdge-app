# UltraEdge — Open-Source Notices

[![App: proprietary](https://img.shields.io/badge/app-proprietary-lightgrey.svg)](#ultraedge-app)
[![Firmware: GPL v2](https://img.shields.io/badge/firmware-GPL%20v2-blue.svg)](#edgetx-and-the-edgetx-ue-firmware--gpl-20-only)
[![Protocol: MIT](https://img.shields.io/badge/protocol-MIT-yellow.svg)](#ue-protocol--mit-code-cc-by-40-specification)
[![Fonts: OFL 1.1](https://img.shields.io/badge/fonts-OFL%201.1-orange.svg)](#fonts--sil-open-font-license-11)

The UltraEdge Android app is proprietary software. It embeds, and works with, the open-source components below.
Their licences and notices are reproduced or referenced here. In the app: **System › About and licences**.

---

## Lua 5.4 — MIT License
UltraEdge embeds the unmodified Lua 5.4 interpreter to run on-phone Lua telemetry scripts.

```
Copyright © 1994–2024 Lua.org, PUC-Rio.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge, publish, distribute,
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or
substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
More: https://www.lua.org/license.html

---

## Fonts — SIL Open Font License 1.1
The app bundles these typefaces, unmodified, under the [SIL Open Font License, Version 1.1](https://openfontlicense.org)
(the licence text ships with the app in `assets/fonts/OFL.txt`):
- **Barlow** (Regular, Medium, SemiBold) — Copyright 2017 The Barlow Project Authors (https://github.com/jpt/barlow)
- **Rajdhani** (Medium, SemiBold, Bold) — Copyright (c) 2014 Indian Type Foundry (info@indiantypefoundry.com).
  "Rajdhani" is a trademark of Indian Type Foundry.

## AndroidX, Kotlin and Compose Multiplatform — Apache License 2.0
AndroidX Core, AppCompat and DrawerLayout © The Android Open Source Project; the Kotlin standard library,
Compose Multiplatform (runtime, foundation, UI, resources), kotlinx.coroutines and kotlinx.serialization
© JetBrains s.r.o. and Kotlin contributors; and Ktor (network) © JetBrains s.r.o. and Ktor contributors, are used
under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).

## EdgeTX and the EdgeTX-UE firmware — GPL-2.0-only
[![GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)

UltraEdge is a companion for EdgeTX radios. It talks to the **EdgeTX-UE** firmware, which is EdgeTX plus the UltraEdge
companion overlay. EdgeTX is licensed under the **GNU General Public License version 2 only (GPL-2.0-only)**. The
EdgeTX-UE firmware is a derivative work and is distributed under the same **GPL-2.0-only** terms. The complete
corresponding source for every firmware release is published at https://github.com/50UR4V/edgetx-ue.

The UltraEdge Android app does **not** contain or link EdgeTX code. It is a separate program that talks to the radio
over USB using the UE Protocol (below).
- EdgeTX: https://github.com/EdgeTX/edgetx · EdgeTX-UE: https://github.com/50UR4V/edgetx-ue

## UE Protocol — MIT (code), CC BY 4.0 (specification)
[![MIT](https://img.shields.io/badge/code-MIT-yellow.svg)](https://opensource.org/license/mit) [![CC BY 4.0](https://licensebuttons.net/l/by/4.0/80x15.png)](https://creativecommons.org/licenses/by/4.0/)

The open radio↔phone protocol UltraEdge speaks. The reference codec is © 2026 Sourav Karmakar (UltraEdge), released
under the **MIT License**. The app's Kotlin implementation of the wire format is by the same author. The specification
text is under **CC BY 4.0**, so any radio, app or accessory can implement it. https://github.com/50UR4V/ue-protocol
(Releases before 2026-10-18 were published under Apache-2.0.)

## Downloaded on request, not bundled
System › Downloads fetches these, only when you ask, from their own GitHub releases into the phone's UltraEdge folder.
They are not part of the app, and their licences stay with them:
- **EdgeTX voice packs** (edgetx-sdcard-sounds), © the EdgeTX project and contributors, **GPL-2.0**.
  https://github.com/EdgeTX/edgetx-sdcard-sounds
- **iNav Lua Telemetry** (OpenTX-Telemetry-Widget), © the iNav project and contributors, **GPL-3.0**. The app installs
  its SCRIPTS/ part. https://github.com/iNavFlight/OpenTX-Telemetry-Widget

## UltraEdge app
© 2026 Sourav Karmakar. All rights reserved. The app is proprietary and is distributed through Google Play.

---

*Trademarks: EdgeTX, FrSky and RadioMaster are trademarks of their respective owners. UltraEdge is an independent
community project and is not affiliated with or endorsed by them.*
