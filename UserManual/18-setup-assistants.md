# 18. Setup Assistants

[← Cloud backup & account](17-cloud-backup-and-account.md) · [Contents](README.md)

*App 1.7.1.* A Setup Assistant wires a wing or tail for you. Mixing a flying wing usually means knowing the channel
order, the stick mode and which servo is mounted reversed. The assistant asks only what you can see: what the surfaces
do when you move a stick. From that it works out the mix signs.

Open them in **System › Tools › Setup Assistants**:

| Assistant | For |
|---|---|
| **Delta / flying wing (elevons)** | Two surfaces that do aileron and elevator |
| **V-tail (ruddervators)** | Two tail surfaces that do elevator and rudder |
| **Two aileron servos (with differential)** | One servo per aileron, with aileron differential |
| **Flaperons (ailerons that also work as flaps)** | Ailerons that also drop as flaps, on a switch or slider |
| **4-servo wing with crow braking (glider)** | Two ailerons and two flaps, with crow on a switch or slider |

## How it goes
1. **Safety.** Remove the propeller, or unplug the motor or ESC: the model is live while you move the sticks.
2. **Channels.** Pick the receiver channel each surface is plugged into.
3. **Test mix.** The assistant writes a starting mix on those channels (as EdgeTX Companion's wizard does). It uses your
   model's inputs, so your rates, expo and trims still apply.
4. **Observe.** Hold each stick as asked and tap what the surfaces do (both up, both down, right up and left down, or
   right down and left up). If something else happens, tap **Something else**: the assistant stops and helps you check
   the wiring. If two answers can't both be true, it asks the sticks again.
5. **Result.** It shows the mixes it will save, with a preview.
6. **Save and check.** It saves, reads the model back from the radio, and asks you to move the sticks once more to
   confirm.

What it changes: only the mixes of the channels you picked. It never changes outputs (servo direction) or throttle; a
reversed servo is fixed in the mix, where you can see it. Your previous mixes are kept: **Cancel** or **Undo** puts them
back.

> [!NOTE]
> Trims and global-variable values on the radio stay as they were. To start from centred trims, use **Model › Trims ›
> Reset** (firmware v1.2.2).

The step-by-step recipes in [Recipes](13-recipes.md#elevon-flying-wing--delta-mixing) still work if you prefer to mix by
hand.
