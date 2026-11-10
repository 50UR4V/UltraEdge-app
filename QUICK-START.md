# UltraEdge quick start: install and set up, step by step

From a stock EdgeTX radio to editing models on your phone, in about 20 minutes. Every step links to the full
[User Manual](UserManual/README.md) if you want more detail.

**You need:**
- An EdgeTX radio. Check yours is on the [Supported radios](https://github.com/50UR4V/edgetx-ue/blob/ultraedge/SUPPORTED-RADIOS.md) list.
- An Android phone, Android 7.0 or newer, with USB OTG (most phones made since about 2017).
- A USB **data** cable from the phone to the radio. Many cables only charge; if nothing happens later, swap the cable first.
- A computer with an SD card reader (for the backup and, if you like, the flash).

> [!IMPORTANT]
> The phone is never in the control path: unplug it and the radio flies exactly as EdgeTX does. Still, after any
> change, bench-test with the propeller off before you fly.

---

## Step 1. Back up the radio

1. Switch the radio off and take out its SD card (or connect the radio to the computer in *USB Storage* mode).
2. Copy the whole card to the computer, at least `/MODELS` and `/RADIO`.
3. Note which EdgeTX version you're on (**SYS › Version**), so you can go back to it if you ever want to.

Flashing replaces only the firmware. Your models and settings stay on the SD card.

## Step 2. Download the firmware for your radio

1. Open the [latest UltraEdge firmware release](https://github.com/50UR4V/edgetx-ue/releases/latest).
2. Download the one file for **your exact radio** (the list is in [FLASHING.md](https://github.com/50UR4V/edgetx-ue/blob/ultraedge/FLASHING.md)).
   The QX7 ACCESS is not the QX7 and has its own file.
3. *Optional:* check it with `shasum -a 256 -c SHA256SUMS.txt`.

**Which build is it?**
- **Colour-screen radios** get a **full build**: every EdgeTX menu stays, plus UltraEdge.
- **Black-and-white radios** (Pocket, Zorro, QX7, Boxer…) get a **companion build**: the radio's own model and
  settings menus move to the phone, which frees space for UltraEdge. The radio still flies, shows its main screen and
  lets you pick a model. Prefer the radio's own menus? Use the
  [v1.1.2.4 full builds](https://github.com/50UR4V/edgetx-ue/releases/tag/v1.1.2.4) instead.

## Step 3. Flash it

Flash it exactly as you'd flash official EdgeTX. Pick one way.

**A. From the radio's bootloader (no extra software)**
1. Copy the `.bin` to the `/FIRMWARE` folder on the radio's SD card.
2. With the radio off, hold both horizontal trims toward the centre and switch it on. The EdgeTX bootloader opens.
3. Choose **Write Firmware**, pick the file and confirm. Wait until it says it's done, then exit and restart the radio.

**B. With EdgeTX Buddy**
1. Open <https://buddy.edgetx.org> in Chrome or Edge on the computer.
2. Put the radio in DFU mode the way EdgeTX describes for your radio, and connect it.
3. Choose **Flash local firmware**, pick the `.bin` and flash.

**`.uf2` files** (TX15, TX16S MK3, GX15, T15 Pro, T22, V12, ST16, PA01, Commando 14): use the radio's EdgeTX bootloader,
the same way as an official EdgeTX `.uf2`.

**Check it worked:** on a full build, open **SYS › Version**; on a companion build, open any settings menu to see the
**UltraEdge** screen. Both show `ultraedge-<your radio>` and `UE <version>`.

## Step 4. Install the app

Install **UltraEdge** from [Google Play](https://play.google.com/store/apps/details?id=com.ultraedge.companion).

## Step 5. Connect

1. **Full builds only:** on the radio, set **USB mode** to **Serial** (or **Ask**). Companion builds need nothing.
2. Plug the cable into the radio's **data** USB port. Some radios have a separate charge-only port.
3. Android asks *"Open UltraEdge for this USB device?"*. Tap **OK** (tick *use by default* to skip it next time).
   If the radio asks for a USB mode, choose **Serial**.
4. Wait for the pill at the top right to turn **ATTACHED**.

First plug-in doesn't connect? Unplug and plug in once more, then accept the prompt.

## Step 6. Calibrate (companion builds, first time only)

Open **System › Hardware › Calibration** and follow the two steps: sticks centred, then move everything to its ends.

## Step 7. Get the voice and Lua tools

Open **System › Downloads** and fetch:
- the **EdgeTX voice pack**, so call-outs and alarms speak through the phone,
- any **Lua tools** you want (for example the iNav Lua).

The ExpressLRS Lua runs from **System › Tools** once it's on the radio's SD card, as in EdgeTX.

## Step 8. Make your first change and check it

1. Open a model and change something small, for example a rate or a mix weight.
2. Move the sticks: the live view on the phone follows the radio.
3. Unplug the phone and check the change on the radio's own screen (or by moving the sticks with the propeller off).

You're set up. Next: [Finding your way around](UserManual/03-finding-your-way.md), the
[Recipes](UserManual/13-recipes.md) for common jobs, and [Troubleshooting](UserManual/14-troubleshooting-faq.md).

---

**Going back:** flash your previous firmware (stock EdgeTX or an earlier UltraEdge release) the same way, and copy your
SD card backup back if you need to.

**Help:** [GitHub issues](https://github.com/50UR4V/UltraEdge-app/issues), or **System › Feedback › Report a bug** in
the app.

*UltraEdge is a project built on EdgeTX. It isn't an official EdgeTX app and isn't endorsed by EdgeTX, FrSky,
RadioMaster or ExpressLRS.*
