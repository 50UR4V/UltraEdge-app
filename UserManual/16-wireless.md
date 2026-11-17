# 16. Wireless (Bluetooth)

[← Safety & current limits](15-safety-and-limits.md) · [Contents](README.md)

*App 1.7.1 and UltraEdge firmware v1.2.2 or newer.*

Love UltraEdge but hate cables? **UltraEdge Wireless is here.** An **UltraEdge Baylink** (the wireless module) in the
radio's module bay links the radio and the app over Bluetooth. Everything you do over USB works the same way: read and save models,
telemetry, Lua, flight logs.

The radio still flies on its own. The module only carries the app's messages, exactly like the USB cable does; the
radio checks and saves every change itself.

## 1. What you need

| | |
|---|---|
| **Radio** | A radio with a module bay and UltraEdge firmware v1.2.2: RadioMaster **Pocket** or **Zorro** (nano bay), RadioMaster **TX16S** (JR bay). FrSky **QX7 / QX7S** (JR bay): only with the model's Internal RF Off (section 3). Other radios with a bay: later ([Supported radios](https://github.com/50UR4V/edgetx-ue/blob/ultraedge/SUPPORTED-RADIOS.md)) |
| **Firmware** | One file per radio. It carries the bay link and AUX1, so nothing is chosen when you flash and you can add a module later. A QX7 whose Bluetooth module has been replaced by the C3 uses the `-auxmod` file (modified radios only) |
| **Module** | An UltraEdge Baylink: an ESP32-C3 board in a printed shell that fits the bay ([2-in-1 or Pocket shell](https://github.com/50UR4V/ultraedge-mounts/tree/main/wireless-module), CC BY-SA 4.0). Do-it-yourself option, a **Baylink on AUX1**: the same kind of board wired to the radio's **AUX1** port, on radios that have one (TX16S, Pocket, Zorro). A build guide with the wiring follows |
| **Phone** | Android with Bluetooth LE. Android asks for **Nearby devices** (Android 12 and later) or **Location** (Android 11 and older, only to find the module) |

## 2. Get the module firmware
The Baylink is flashed once over USB, before it goes into its shell, from a desktop browser (Chrome or Edge) or Android
Chrome on **https://ultraedge.app**. No sign-in is needed. The page asks **where the module will go: Module bay or AUX1
port**; pick the right one, because a Bluetooth update can't change it later (only another USB flash can).

Registering the Baylink (free, Google sign-in) comes later and happens in the app, over Bluetooth: the shell stays
closed. A Baylink that isn't registered still works in this release. Its licence belongs to the module, not to a phone
or a radio.

> [!NOTE]
> **Coming soon.** Registration and the browser flasher open on ultraedge.app shortly after this release. The page
> will also have the wiring guide for each radio and the printable case
> ([ultraedge-mounts](https://github.com/50UR4V/ultraedge-mounts), CC BY-SA 4.0).

## 3. Module in the bay
The bay belongs to the model first. The radio gives the bay to the module only while the current model's **External RF**
is **Off**. A model with an external RF module in the bay, or a trainer that uses the bay (Master/SBUS Module,
Master/CPPM Module), takes the bay back, and the Bluetooth link stops while that model is loaded.

**Turn it on**, with the radio off, the module in the bay, and a model with External RF Off:
1. Switch the radio on and connect the phone by **USB** once.
2. In the app, **System › Call-outs and phone › Wireless link:** turn it on. With it off, the app never uses Bluetooth.
3. The app asks **Where is your wireless module?** Tap **Module bay**. The app sets this model's External RF to
   **UE-BLE**; the radio checks the request, turns its bay link on and saves the setting itself. From then on every model
   with External RF Off shows UE-BLE. Setting External RF back to **Off** on such a model turns the bay link off for the
   radio.

   Or on the radio: open the **ULTRAEDGE** screen (black-and-white radios: hold **MDL** or **SYS**; TX16S: **SYS › Radio
   settings › UltraEdge**) and set **Connect: BLE bay**. On a black-and-white radio a long **ENTER** saves it as the
   default for the next start; on the TX16S use **Save as default**.
4. Unplug the USB cable. On the connect screen, tap **Connect over Bluetooth**. The app searches for the module and
   connects. The radio's status line says **Bay on, waiting for phone** until it does.

**Switching models.** Before the app switches to a model that uses the bay (an external RF module or a bay trainer), it
warns you: switching ends the Bluetooth link; reconnect by USB. The radio asks the same before it loads such a model from
its own model list (**ENTER** to continue, **EXIT** to cancel). Switch back to a model with External RF Off and
Bluetooth comes back.

**FrSky QX7 / QX7S: Internal RF Off.** On the QX7 the internal XJT module shares its wire with the bay, so the bay link
runs only while the model's **Internal RF** is Off as well. The app tells you and offers **Turn Internal RF off**. With
Internal RF Off the model has no RF link, so on a QX7 the Baylink is a **bench link**: set the model up, then turn
Internal RF back on before you fly that model (the Bluetooth link then ends). The radio's status line says **Bay: internal RF on** while it blocks the link.

## 4. Module on AUX1 (do it yourself)
On radios with an **AUX1** port (TX16S, Pocket, Zorro) the module can be wired to AUX1 instead of sitting in the bay.
1. Connect the phone by **USB** and turn on **Wireless link** (section 3, step 2).
2. When the app asks **Where is your wireless module?**, tap **AUX1 port**. If AUX1 is off, the app asks the radio to set
   it to **UltraEdge (wireless)**; the radio checks the request and saves the setting itself. If AUX1 is already used for
   something else (trainer, telemetry, GPS), the app says so and changes nothing; change it on the radio if you want
   wireless.
3. On the radio's ULTRAEDGE screen, **Connect: BLE AUX** is offered once AUX1 is UltraEdge.
4. Unplug the USB cable and tap **Connect over Bluetooth**.

**USB always comes first.** Plug the cable in and the app uses it; the app shows **Radio is on its USB cable. Bluetooth
comes back when you unplug it.** Unplug it and the wireless link is used again. The radio never switches links in the
middle of a save.

## 5. Pairing
The module talks only to phones it has paired with, and the link is encrypted. A phone can pair only while the module's
**pairing window** is open, for **2 minutes**:
- after the radio is switched on, while the module has **no paired phone yet** (a new module, or after you cleared it,
  below);
- after a **short press of the module's BOOT button**, to add another phone. The phones already paired stay paired.

While the window is open the module's LED blinks fast. It lets in one phone, then closes.

**First time:**
1. Switch the radio on and keep the phone close. If the USB setup (section 3, steps 1–3) took longer than 2 minutes,
   switch the radio off and on again now, so the window is open.
2. Connect over Bluetooth (section 3 or 4). The app lists the UltraEdge modules in range: **Choose your radio's wireless
   module**. Each line says **ready to pair** or **pairing closed**; pick yours (just switched on, ready to pair,
   usually the strongest signal).
3. Accept Android's pairing request.

The app **remembers** that module for this radio and from then on connects only to it, without asking. If your module
isn't in range but others are, the app says so and lets you choose once.

**A second phone:** press BOOT on the module once, then pair the new phone as above. A module remembers up to 4 phones;
when a fifth pairs, the oldest is forgotten.

> [!NOTE]
> In a closed shell the BOOT button can't be reached, so for now a Baylink in the bay takes **one phone**. Switching the
> phone means making the module forget every phone (below) and pairing the new one. **Add another phone** from a phone
> that is already paired comes in a later update.

**Forget a module on this phone:** **System › Call-outs and phone › Wireless module › Forget this module**. The app
removes it and Android's pairing with it; the next connection asks you to choose again.

**Make the module forget every phone:** hold BOOT for **10 seconds**, or switch the radio **on and off three times in a
row, each time within 10 seconds** (for a module you can't reach, in a case or a bay). The module then accepts a new
phone for 2 minutes. Every phone has to pair again. This is also the way out when your phone is **lost** or replaced:
the lost phone can't connect any more.

**Try it on a friend's radio.** Your friend's radio needs UltraEdge firmware first (stock EdgeTX can't talk to the
Baylink). They back up their SD card and firmware, flash UltraEdge ([FLASHING](https://github.com/50UR4V/edgetx-ue/blob/ultraedge/FLASHING.md))
and can flash their old firmware back later. Then move your Baylink into their bay and use **your own phone**: it
remembers the module, not the radio, so it connects without pairing and shows their models. Their model needs External
RF Off (**Module bay** in the app sets UE-BLE).

**Giving away or selling your Baylink:** make it forget every phone first. Its licence belongs to the module, so it
works for the new owner.

If something goes wrong the app says what and waits for **Retry**:

| The app says | What to do |
|---|---|
| **… isn't accepting a new phone** | The pairing window is closed. Switch the radio off and on (a module with no paired phone), or press BOOT once, then tap Retry |
| **… no longer knows this phone** | The module's pairings were cleared. Open the window as above and tap Retry: the app pairs again |
| **Pairing with … didn't finish** | Tap Retry and accept the phone's pairing request |

> [!NOTE]
> While the window is open, anyone in range could pair first. The window closes after one phone, so you would notice:
> your phone can't pair. Clear the module's pairings and pair again.

## 6. The module page
**System › Call-outs and phone › Wireless module** shows, while you are connected over Bluetooth:
- the module's firmware version, its chip ID and its licence state;
- **Update module firmware**: download the update file (`.ueimg`) for your kind of module (bay or AUX1) from
  **ultraedge.app** on the phone, then tap **Update module firmware** and pick it. The app checks the file's UltraEdge signature first, and
  the module checks it again before it changes anything. Keep the phone close to the radio and the app open; if the
  update stops, the module keeps its current firmware. The radio link pauses during the update and comes back after
  the module restarts.

A module that isn't registered yet still works in this release; the page says so.

## 7. Power and the settings file (advanced)
The link is **always on at low power** by default: about 0 dBm on air, well below what a typical RC link transmits.
In our RF test on a TX16S with the module on AUX1, the module did not affect the ExpressLRS link
([test report](https://github.com/50UR4V/UltraEdge-app/blob/main/docs/rf-tests/2026-11-11-tx16s-ble/README.md)). A module
in the bay sits closer to the RC module and has not had that test yet; check your own setup, as in the warning below.

On its first start with wireless, the radio writes **`/UE/WIRELESS.TXT`** on its SD card, with a note for each option:

| Line | Default | Meaning |
|---|---|---|
| `arm_switch=` | `none` | A switch that turns the link off while it is on, written as in the model file (`SF2` = SF down, `!SA0`, `L5`). `none` = always on |
| `power_dbm=` | `2` | The module's Bluetooth power. The module uses 3 dB steps and rounds down: `2` gives 0 dBm, `9` gives 9 dBm, `20` gives 18 dBm |

Edit it on a computer (a card reader, or the radio's USB storage mode); the app doesn't write to `/UE/`. The radio reads it again every 5 seconds and never overwrites it.
If you used `/UE/AUXARM.TXT` before, its switch is carried over the first time.

> [!WARNING]
> Raising the power or flying with the link on is your choice. Check your RC link's range with the module on, at the
> power you set, before you fly.

## Troubleshooting

| Problem | Try |
|---|---|
| **No UltraEdge radio in Bluetooth range** | Is the radio on, and its Connect line on **BLE bay** (or **BLE AUX** for an AUX1 module)? Is the module powered? Move the phone closer |
| **Radio is on its USB cable. Bluetooth comes back when you unplug it.** | A USB cable has the link. Unplug it to go back to Bluetooth |
| **The radio says Bay used by model RF** | This model has an external RF module or a bay trainer. Load a model with External RF Off |
| **The radio says Bay: internal RF on** (QX7) | Set this model's Internal RF to Off for the bay link (section 3). Turn it back on before you fly that model |
| **Bluetooth permission is needed** | Allow Nearby devices (or Location on Android 11 and older) for UltraEdge in Android's settings |
| **The Bluetooth link to the module dropped** | Out of range, or `arm_switch` turned it off. Tap **Connect over Bluetooth** again; an edit that wasn't confirmed offers **Retry** |
| **AUX port used for something else** | AUX1 is set to another mode on the radio. Change it there if you want wireless |
| **The app doesn't find my module, but another one** | The app connects only to the module it remembers. If you changed modules, choose the new one when asked, or Forget the old one (section 5) |

