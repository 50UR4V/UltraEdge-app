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
  then do a **range check** (Model › RF › Range test) before the first flight.
- The firmware is EdgeTX with an additional companion module. Unplug the phone and it behaves like EdgeTX.

## Not yet in the app

Some EdgeTX settings aren't editable from UltraEdge yet. On a **TX16S** (full build) you can still set them on the
radio. On **companion builds** (Pocket, Zorro, QX7) they keep their current values until the app supports them.

| Setting | Status | Workaround |
|---|---|---|
| **Bluetooth trainer pairing** (scan / connect) | Radio-side (TX16S) | The trainer *mode* is set in Model › Trainer |
| Trim **values** | By design: set with the trim buttons | Trim *modes* per flight mode are editable |
| **Vario** settings (source, range, centre) | Planned | — |
| Creating a **blank** model | On the radio's model select | Or duplicate an existing model in Manage Models |
| Global functions (radio-wide special functions) | Planned | Use model special functions |

If you rely on one of these, tell us at <https://github.com/50UR4V/UltraEdge-app/issues>. Requests decide what comes
next.

## Privacy

UltraEdge needs no account and no internet. Models, logs and settings stay on the phone and the radio. The radio's
processor ID is reduced to a short fingerprint used only to keep each radio's caches separate, and it is never sent
anywhere. See the [privacy policy](https://github.com/50UR4V/UltraEdge-app/blob/main/PRIVACY.md).
