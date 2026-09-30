# UltraEdge — Open-Source Notices (draft)

*Draft for review. Publish in the app (App Settings ▸ About already summarizes this) and/or the
`ultraedge-app` repo. Satisfies the attribution obligations of the components UltraEdge embeds.*

UltraEdge is proprietary software. It embeds and interoperates with the following open-source
components, whose licenses and notices are reproduced or referenced below.

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

## EdgeTX — GPL-3.0-or-later
UltraEdge is a companion for EdgeTX radios and talks to the EdgeTX-UE companion firmware. The firmware
overlay is offered under **GPL-3.0-or-later** (as a fork of EdgeTX). The UltraEdge Android app does **not**
link EdgeTX GPL code — it is an independent implementation of the UE Protocol wire format in Kotlin.
- EdgeTX: https://github.com/EdgeTX/edgetx  ·  EdgeTX-UE fork: https://github.com/50UR4V/edgetx-ue

## UE Protocol — permissive
The open radio↔phone protocol UltraEdge speaks. The reference codec is offered under a permissive
license so any radio or app can implement it. https://github.com/50UR4V/ue-protocol

---

*Trademarks: EdgeTX and FrSky are trademarks of their respective owners. UltraEdge is an independent
community project and is not affiliated with or endorsed by them.*
