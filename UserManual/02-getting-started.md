# 2. Getting started

[← Overview](01-overview.md) · [Contents](README.md) · [Next: Finding your way →](03-finding-your-way.md)

## What you need

- **A supported radio** with UltraEdge firmware. See [Supported radios](#supported-radios).
- **An Android phone**: Android 7.0 or newer with USB host (OTG) support. Most phones made since about 2017 have it.
- **A USB data cable** from the phone to the radio's USB port. Some cables only carry charge; if the radio is never
  detected, try a different cable first.
- *Optional:* a phone mount for the radio.

## Supported radios

UltraEdge is **made for any EdgeTX radio**. Ready-made firmware is verified on the radios below; more radios are
added as they're verified by us, our testers or the community. For another EdgeTX radio, build the firmware yourself
(see the EdgeTX-UE `BUILD-HOWTO.md`) or ask for it on [GitHub issues](https://github.com/50UR4V/UltraEdge-app/issues).

| Radio | Production firmware (v1.1.2.3) | ![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) Beta firmware (1.1.22) |
|---|---|---|
| RadioMaster **Pocket** | Full build: all EdgeTX menus *plus* UltraEdge | Companion build |
| RadioMaster **Zorro** | Full build | Companion build |
| FrSky **QX7 / QX7S (not the ACCESS model)** | Full build | Companion build |
| RadioMaster **TX16S** | Full build | Full build |

![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) *Beta: needs app 1.4 (Play open testing) and firmware 1.1.22. See [Which version?](README.md#which-version)*

**Companion builds** remove the radio's own model and radio-settings menus. That frees space for UltraEdge, and on a
128×64 screen you'd use the phone for those settings anyway.

The radio still flies and still shows its main view, and you can still pick a model on it. If you open a settings
menu on the radio, it shows:

```
      ULTRAEDGE
 Model & radio settings
 are in the UltraEdge app.
```

> [!NOTE]
> **EdgeTX ↔ UltraEdge:** on a companion build, **stick calibration is done from the phone**
> (System › Calibration). If the radio needs calibration at boot, it tells you so: *"Connect the phone and calibrate in
> UltraEdge: System > Calibration"*.

## 1. Back up first

Before flashing, copy the radio's SD card (especially `/MODELS` and `/RADIO`) to a computer. Flashing replaces only
the firmware, so your models and settings stay on the SD card. Still, a backup takes two minutes, and not having one
is the mistake people regret most.

## 2. Flash the UltraEdge firmware

Download the `.bin` for your radio from the
[EdgeTX-UE releases](https://github.com/50UR4V/edgetx-ue/releases). Check it against `SHA256SUMS.txt`, then flash it
one of these ways:

- **EdgeTX Buddy** (easiest). Open <https://buddy.edgetx.org> in Chrome or Edge and choose **Flash local
  firmware**. Put the radio in bootloader/DFU mode (hold both horizontal trims inward while powering on) and plug in
  USB.
- **From the radio's SD card.** Copy the `.bin` into `/FIRMWARE`, then on the radio: *SD card › FIRMWARE › your file ›
  Flash firmware*. On a full build this is under SYS; companion builds keep the bootloader flasher.
- **STM32 DFU tools.** Flash at `0x08000000`.

After flashing, the radio boots into EdgeTX as normal. ![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) On beta firmware, the radio's **Version** page shows `ultraedge-<radio>` and
`UE <version> [companion]`, so you can confirm what's installed.

## 3. Install the app

Install **UltraEdge** from Google Play.

## 4. First connection

1. **Full builds (production):** on the radio, set **USB mode** to **Serial** (no question on connect) or **Ask**.
   Later you can change it from the app under System › Radio Setup › Sticks & ports.
   ![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) **Companion builds:** nothing to set. The radio connects
   to UltraEdge without asking. See [USB mode on companion builds](#usb-mode-on-companion-builds).
2. Plug the phone into the radio's USB port.
3. Android asks *"Open UltraEdge for this USB device?"*. Tap **OK**. Tick *use by default* to skip the question next
   time. If the radio asks for a USB mode, choose **Serial**.
4. The app shows its start-up screen while it prepares the phone and reads the radio. Then the status pill at the
   top right turns to **ATTACHED**.

| Pill | Meaning |
|---|---|
| **DETACHED** | No radio connected. You can still browse cached models, logs and your library. |
| **LINKING** | Radio found; the app is agreeing a protocol with it. |
| **ATTACHED** | Ready. Edits are written straight to the radio. |

> [!TIP]
> **First plug-in after installing doesn't connect?** Unplug and plug back in once. If Android says *"USB permission
> not confirmed"*, unplug and replug, then accept the prompt.

### USB mode on companion builds
![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) *Firmware 1.1.22 or newer.*

- **Flying days:** plug in and go. The radio connects to UltraEdge without asking. If the cable drops out, it
  reconnects in the same mode by itself, also without asking. Every UltraEdge build keeps the USB mode until you
  switch the radio off.
- **Simulator practice:** press the radio's menu key to open the **UltraEdge** screen, then press **ENTER**. "USB now"
  steps through **UltraEdge → Simulator (joystick) → SD card** and switches straight away, with no need to replug.
  It lasts until you switch the radio off, so your next flying day starts in UltraEdge again.
- **Make it permanent:** hold **ENTER** to save the current mode as the **Default**.

## 5. Calibrate (companion builds, first time)

![Beta](https://img.shields.io/badge/-Beta-8b5cf6.svg) *Beta: needs app 1.4 (Play open testing) and firmware 1.1.22. See [Which version?](README.md#which-version)*

Open **System › Calibration** and follow the two steps (centre, then move to the extremes). See
[Calibration](09-radio-settings.md#calibration).

## 6. Learn your way around

Read [Finding your way around](03-finding-your-way.md) (a two-minute read). Or jump to the
[Recipes](13-recipes.md) if you have a specific job to do.
