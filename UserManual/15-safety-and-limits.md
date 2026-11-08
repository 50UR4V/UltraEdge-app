# 15. Safety & current limits

[← Troubleshooting & FAQ](14-troubleshooting-faq.md) · [Contents](README.md)

## Safety

- **The radio is always in command.** UltraEdge never sends stick, throttle, arm or failsafe commands. It reads and
  edits configuration, and shows telemetry and logs.
- **If the phone disconnects, crashes or is unplugged** (even in flight), the radio keeps flying the active model
  from its own memory, exactly as configured.
- **Edits take effect on the radio straight away.** Don't edit a model you are flying. Make changes on the ground with
  the model disarmed and, for anything powered, the **propeller off**.
- **After every change:** check control directions, the arm switch, the throttle cut and the failsafe on the bench,
  then do a **range check** (Model › Internal/External RF › Range test) before the first flight.
- The firmware is EdgeTX with an additional companion module, so the radio flies exactly as EdgeTX does.
  - **Full builds (TX16S and other colour radios; the v1.1.2.4 fallback on Pocket, Zorro, QX7):** unplug the phone and
    the radio is ordinary EdgeTX, menus included.
  - **Companion builds (v1.2.1 on Pocket, Zorro, QX7, and other black-and-white radios):** the radio's model and radio-settings menus are removed. Without
    a working phone you can't change settings, bind or range-check at the field, so carry a spare phone or cable.

## Not yet in the app

Some EdgeTX settings aren't editable from UltraEdge yet. On a **TX16S** (full build) you can still set them on the
radio. On **companion builds** (black-and-white radios such as Pocket, Zorro, QX7) they keep their current values until the app supports them.

| Setting | Status | Workaround |
|---|---|---|
| **Bluetooth trainer pairing** (scan / connect) | Radio-side (TX16S) | The trainer *mode* is set in Model › Trainer |
| Trim **values** | By design: set with the trim buttons | Trim *modes* per flight mode are editable |

If you rely on one of these, tell us at <https://github.com/50UR4V/UltraEdge-app/issues>. Requests decide what comes
next.

## Privacy

UltraEdge needs no account. It uses the internet only when you ask **System › Downloads** for a voice pack or the iNav Lua telemetry. Models, logs and settings stay on the phone and the radio. The radio's
processor ID is reduced to a short fingerprint used only to keep each radio's caches separate, and it is never sent
anywhere. See the [privacy policy](https://bampi2k.com/ultraedge/privacy).
