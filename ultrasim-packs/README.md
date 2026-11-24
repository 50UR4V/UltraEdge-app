# UltraSim tracks and aircraft

UltraSim is the FPV quad and flying-wing simulator in the UltraEdge app (System › Tools › UltraSim, or its own tab in
the left rail). The simulator is part of the app; its tracks and aircraft are packs you download in
**System › Downloads › UltraSim Craft and Track pack 1** and **pack 2**. These folders hold the packs' files.

| Download | Files |
|---|---|
| UltraSim Craft and Track pack 1 | tracks (`tracks/`): `meadow-gp`, `sunset-eight`, `bando-run`, `canyon-run`, `downtown` (quads); `valley-pylons`, `island-circuit` (flying wings); aircraft (`craft/`): `quad-5inch`; `swift-800`, `cruiser-1200` (flying wings) |
| UltraSim Craft and Track pack 2 | the challenge tracks (`challenge/`): `steelworks`, `five-peaks` (quads); `hawk-ridges`, `sea-stacks` (flying wings) |

They replace the earlier UltraSim tracks, UltraSim aircraft and UltraSim challenge tracks downloads, with the same files:
installing a pack over them keeps one copy of each track and aircraft.

The challenge tracks are harder: gates closer together and at sharper angles, bigger climbs and dives, scenery close to
the line. **Steelworks** is a steel yard: a slalom between container stacks, a climb onto a 12 m tower and a split-S off
it, a gate under a pipe rack, a hairpin round a chimney and a window in a wall. **Five Peaks** puts five hairpins on
hilltops, with a dive into the valley after each. **Hawk Ridges** takes the wings over four ridge spurs with bends
of about 26 m. **Sea Stacks** is a low pylon slalom round rock stacks, with bends of about 20 m and a climb over a
headland; touching the water ends the flight. They install into the same `tracks/` folder.

## Where they go

On the phone's UltraEdge SD folder: `SCRIPTS/TOOLS/UltraSim/tracks/<id>.lua` and `SCRIPTS/TOOLS/UltraSim/craft/<id>.lua`.
The file name is the pack's id: UltraSim keeps each track's best lap and ghost under it. An aircraft needs a track of
its kind (a quad needs a quad track, a wing a wing track).

## Making your own

A pack is a Lua file that returns a table, or a function that is given UltraSim's builders (`api`) and returns the table.
UltraSim checks every pack when it starts; one that fails is left out and named on the menu. Copy one of these files,
change its name and contents, and put it in the same folder. The comments in these files explain their fields: a track
is either a closed curve with gates spread along it (`meadow-gp.lua`, `canyon-run.lua`) or gates placed one by one
(`downtown.lua`, `bando-run.lua`); a wing gives all its flight numbers (`swift-800.lua`).

A track may give gate shapes: `kinds = { [3] = "ring", [5] = "arch" }`, by gate number. For quads: `frame` (the
default), `ad` (with an UltraEdge banner), `arch`, `ring`; for wings: `pylon` (the default), `blimp` (a ring under a
blimp). `lift = { [3] = 6 }` raises a gate further. Apps from before gate shapes show frames and pylons instead.

An aircraft may also give its own camera and rates, which pilots get until they set their own in **Settings › Camera and
rates**: `cam = { tilt = 30, fov = 110 }` (degrees) and `rates = { roll = { 70, 670, 0 }, pitch = { ... }, yaw = { ... } }`,
each a quad's Betaflight Actual centre rate, max rate (deg/s) and expo. For a wing, each axis is a number in % of its
flight numbers' authority (`rates = { roll = 120 }`). Values outside the menu's ranges are clamped; a field left out
uses UltraSim's default. The pilot's own values are kept in `UltraSim.cfg`, never in the pack file. A pack runs with the simulator's rights (the phone's UltraEdge SD folder only), so use packs from people you
trust.

### Look (optional)

A pack may say how the GPU picture should draw it. Every field is optional, and a value outside its range is clamped. Apps
before 1.8 and the software picture ignore them.

- A track: `look = { water = true, shine = 0.15, glow = 0.7 }`.
  - `water`: the ground is open water, drawn with sun glint and the sky reflected in it. The default is `true` when the
    track has `water = true` or `env = "sea"`.
  - `shine` (0 to 1): how glossy the ground is, such as wet tarmac or polished concrete. The default is 0.
  - `glow` (0 to 2): scales the sun's halo and bloom. Below 1 suits a bright desert or snow. The default is 1.
- An aircraft: `look = { shine = 0.25 }`, its gloss from 0 to 1. Carbon and plastic are shinier, foam wings matte. The
  default is 0.5 for a quad and 0.3 for a wing.

## Licence

These tracks and aircraft (the files in `tracks/` and `craft/`, and the pack zips made from them) are under
[CC BY-SA 4.0](LICENSE): you may copy, change, share and sell them, with credit to UltraEdge, and changed versions must
use the same licence. UltraSim itself is part of the UltraEdge app and is not covered by this licence.
