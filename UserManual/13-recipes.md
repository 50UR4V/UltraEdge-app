# 13. Recipes: how do I…?

[← Lua, Tools, SD card & Sounds](12-lua-tools-sd-sounds.md) · [Contents](README.md) · [Next: Troubleshooting & FAQ →](14-troubleshooting-faq.md)

These are the jobs people most often get stuck on with EdgeTX radios, done the UltraEdge way. Each recipe assumes the
radio is **ATTACHED** and the right model is **active** (System › Manage Models › *Set as active*).

> [!IMPORTANT]
> After any change that affects the motor or control surfaces, **test on the bench with the propeller off** before
> flying: check directions, the arm switch, throttle cut and failsafe.

---

## Bind or re-bind a receiver

**ExpressLRS (internal module on Pocket/Zorro/TX16S, or an external ELRS module)**
1. **Model › Internal RF** (or External RF): **Type = CRSF**.
2. *Easiest:* use a **bind phrase**. If the receiver was flashed with the same phrase as the module, it connects as
   soon as both are powered, with nothing to press.
3. *Without a phrase:* power-cycle the receiver **3 times** (or hold its button) so its LED blinks fast (bind mode).
   Then tap **Bind receiver**, or run **System › Tools › ExpressLRS › [Bind]**.
4. The receiver LED goes solid when it's bound. The link pill and RSSI/LQ appear in **Telem**.

**FrSky (ACCST/ACCESS) or a MULTI module**
1. **Model › Internal/External RF**: set **Type** (and sub-protocol for MULTI).
2. Put the receiver in bind mode (hold its F/S or bind button while powering it).
3. Tap **Bind receiver**. When the receiver LED shows bound, tap **Stop** and power-cycle the receiver.

> [!TIP]
> **Re-binding after a firmware update?** Usually not needed. You only re-bind when you change the module, the
> protocol, the ELRS bind phrase, or the model's receiver number.

## Arm switch for Betaflight / INAV (AUX1 = CH5)

Betaflight reads switches only through **channels**. A switch that isn't mixed onto a channel is invisible to the
flight controller. That is the number-one "my arm switch doesn't work" cause.

1. **Mixes › ＋ New mix**. It adds a line on the next free channel; with CH1–4 used for sticks, that's **CH5**. Check
   the channel header.
2. **Source:** tap it and **flip your arm switch** (for example SA). It's picked automatically. Weight **100%**.
3. Open **Monitor** and flip the switch: **CH5** should jump between −100 and +100.
4. In **Betaflight › Modes**, assign **ARM** to **AUX1** in the range where the switch is "on".

> [!NOTE]
> **ExpressLRS expects arm on CH5 (AUX1).** Leave it there; ELRS sends CH5 at full rate and uses it for its own
> armed-state behaviour.

Name the switch **ARM** under **System › Switches** so it reads clearly everywhere. Add a call-out:
[voice call-outs on a switch](#voice-call-outs-on-a-switch).

## Failsafe

- **ELRS / Crossfire to a flight controller:** set failsafe **in the flight controller** (Betaflight *Failsafe* tab:
  *Drop* or *Land*; INAV/ArduPilot: *RTH* or *Land*). The radio's failsafe setting has no effect here. Test it: with
  the propellers off, arm, switch off the radio, and confirm the flight controller reports failsafe.
- **PWM receivers (servo planes):** **Model › Internal/External RF › Failsafe**:
  - **Custom**: store the positions you want, with **throttle at idle**.
  - **No pulses**: if your ESC cuts the motor when the signal stops.
  - **Receiver**: if you set failsafe on the receiver itself.
  - For ELRS PWM receivers, set failsafe positions in the receiver's own settings (ELRS Lua or WebUI).
- **Test every new model:** switch the radio off with the model powered on the bench. The motor must stop and
  surfaces must go to safe positions.

## Throttle cut / throttle hold

For planes and helis (for quads, the [arm switch](#arm-switch-for-betaflight--inav-aux1--ch5) is the cut):

1. **Funcs › ＋ New function**. **Trigger:** flip the switch you want as the cut (for example SF↓).
2. **Function: Override**. **CH:** your throttle channel (CH3 on AETR). **Value: −100**.
3. **Enable: ON.**
4. Check in **Monitor**: with the switch on, CH3 stays at −100 whatever the stick does.

> [!TIP]
> Want a voice confirmation? Add a second function on the same switch: **Play Track** → "thrcut" (or any track you
> have), Repeat **1x**.

## Dual rates & expo on a switch

1. **Inputs › I1 Ail**. Edit the existing line: **Weight 100%**, **Curve › Expo 30**, **Switch:** flip SB to its
   *up* position (SB↑). Watch the **response graph** while you set it.
2. **Long-press the line › Insert after.** On the new line: Source *Ail*, **Weight 70%**, **Expo 20**, **no switch**.
   This is the catch-all, used whenever SB isn't up.
3. Repeat for **I2 Ele** (and Rud if you like).
4. In **Monitor**, flip SB and move the stick: the output range changes.

> [!NOTE]
> The radio uses the **first** line whose switch is active, so the line with a switch goes **above** the catch-all.

## Elevon (flying wing / delta) mixing

> [!IMPORTANT]
> **Using INAV, ArduPilot or another flight controller?** Let the flight controller do the mixing. Send plain
> aileron and elevator on CH1/CH2 and don't mix on the radio. Radio mixing is for wings flown **without** a flight
> controller.

Left elevon on **CH1**, right elevon on **CH2**:

1. **Mixes › CH1**: line 1 Source **I1 Ail**, Weight **50%**. Long-press › **Insert after**: Source **I2 Ele**,
   Weight **50%**.
2. **CH2**: line 1 Source **I1 Ail**, Weight **50%**. Insert after: Source **I2 Ele**, Weight **−50%**.
3. Move the sticks and watch **Monitor**: elevator moves CH1 and CH2 the **same** way, aileron moves them in
   **opposite** directions.
4. On the model, check directions. If both surfaces go the wrong way on elevator, reverse **both outputs**
   (**Outputs › Inverted**). If they're wrong on aileron only, change the sign of the Ail lines.

(The demo model in the pictures is set up as an elevon wing.)

## V-tail

The same pattern with **Ele** and **Rud**:

- **CH2** (left ruddervator): **I2 Ele 50%** + **I4 Rud 50%**
- **CH4** (right ruddervator): **I2 Ele 50%** + **I4 Rud −50%**

Check: elevator moves both surfaces the same way; rudder moves them in opposite directions. Fix directions in
**Outputs**.

## Flaperons and flaps

Ailerons on two channels (for example **CH1** left, **CH5** right) let them droop together as flaps:

1. **CH1**: **I1 Ail 100%**. **CH5**: **I1 Ail −100%** (opposite for roll). Use **Outputs › Inverted** on CH5
   instead if that suits your servo layout.
2. Flaps on a 3-position switch: on **both** CH1 and CH5, *Insert after* → Source **SC** (the flap switch),
   Weight **25%** (the same sign on both, so both droop). Add **Slow up/down 1.0 s** for a smooth deploy.
3. **Elevator compensation** (stops ballooning): on the elevator channel *Insert after* → Source **SC**, Weight
   **−5%**, and adjust in flight.

## Low battery & link-quality warning

1. **Telem › ↻ Discover** with the receiver powered so **RxBt** and **RQly** (ELRS link quality) exist.
2. **Logic › ＋ New switch** → **a<x**, V1 **RxBt**, V2 **3.5 V** (per-cell value × cells for a pack, or the receiver
   voltage), **Delay 2 s**.
3. **Funcs › ＋ New function** → Trigger **L1** → **Play Track** "batlow" (or **Haptic**), **Repeat 10 s**.
4. Link quality: **Logic** → **a<x · RQly · 70 %** → **Funcs** → Play Track "siglow" or Haptic.

> [!TIP]
> Values are entered **in real units** (volts, %). UltraEdge converts them to EdgeTX's internal raw numbers, so you
> don't have to work out "35 means 3.5 V".

## A flight timer that runs with the throttle

1. **Model › Timer 1**: **Mode THs** (runs whenever the throttle is above idle), **Start 5:00**, **Countdown:
   Voice**, **Minute beep ON**.
2. *Quads:* use **Mode ON** with **Switch = your arm switch** instead. The timer then runs exactly while armed,
   even with airmode keeping the throttle above idle on the ground.
3. Reset it with a switch: **Funcs › ＋ New function** → trigger a momentary switch → **Reset › Timer 1**.

## Voice call-outs on a switch

1. **Funcs › ＋ New function** → trigger the switch position (for example SA↓, your arm switch).
2. **Function: Play Track**, **Track:** a file name from your voice pack (for example `armed`), **Repeat 1x**.
3. For the other position, add another function: trigger **SA↑**, Play Track `disarm`.

Call-outs play on the radio **and** through the phone. If the phone doesn't have the file, it speaks the name
instead. Import voice packs under **System › SD Card › Import pack**. Read out a value with **Play Value** (for
example altitude every 10 s).

## Trainer / buddy box

1. On the **instructor's** radio: **Model › Trainer › Mode** = **Master/Jack** for a cable, or the wireless option
   your radios share (Master/Multi, Master/CRSF, Master/Bluetooth…). On the **student's** radio (if it's also
   UltraEdge): **Slave/Jack** or **Slave/Bluetooth**. Connect the radios.
2. **System › Trainer**: for each stick choose **Replace** (the student flies it) or **+=** (both add up), the source
   channel and the weight. Tap **Calibrate trainer input** with the student's sticks centred.
3. **Funcs › ＋ New function** → trigger a **momentary** switch (for example SH) → **Trainer** (all sticks). Hold the
   switch to give control; release it to take control back.

## Change ELRS packet rate, power or model match

**System › Tools › ExpressLRS**. See [ExpressLRS](12-lua-tools-sd-sounds.md#expresslrs-and-other-tools).

## Turn on flight logging

**Funcs** → trigger your arm switch (or ON) → **SD Logs**, interval 0.2–1 s. Then see [Flight logs](11-flight-logs.md).

## Copy a model to another radio

See [Models & backups › Copy a model to another radio](10-models-and-backups.md#copy-a-model-to-another-radio).
