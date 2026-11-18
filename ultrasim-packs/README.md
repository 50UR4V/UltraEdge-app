# UltraSim tracks and aircraft

UltraSim is the FPV quad and flying-wing simulator in the UltraEdge app (System › Tools › UltraSim, or its own tab in
the left rail). The simulator is part of the app; its tracks and aircraft are packs you download in
**System › Downloads › UltraSim tracks** and **UltraSim aircraft**. These folders hold the packs' files.

| Pack | Files |
|---|---|
| Tracks | `meadow-gp`, `sunset-eight`, `bando-run`, `canyon-run`, `downtown` (quads); `valley-pylons`, `island-circuit` (flying wings) |
| Aircraft | `quad-5inch`; `swift-800`, `cruiser-1200` (flying wings) |

## Where they go

On the phone's UltraEdge SD folder: `SCRIPTS/TOOLS/UltraSim/tracks/<id>.lua` and `SCRIPTS/TOOLS/UltraSim/craft/<id>.lua`.
The file name is the pack's id: UltraSim keeps each track's best lap and ghost under it. An aircraft needs a track of
its kind (a quad needs a quad track, a wing a wing track).

## Making your own

A pack is a Lua file that returns a table, or a function that is given UltraSim's builders (`api`) and returns the table.
UltraSim checks every pack when it starts; one that fails is left out and named on the menu. Copy one of these files,
change its name and contents, and put it in the same folder. The comments in these files explain their fields: a track
is either a closed curve with gates spread along it (`meadow-gp.lua`, `canyon-run.lua`) or gates placed one by one
(`downtown.lua`, `bando-run.lua`); a wing gives all its flight numbers (`swift-800.lua`). A pack runs with the simulator's rights (the phone's UltraEdge SD folder only), so use packs from people you
trust.

## Licence

These tracks and aircraft (the files in `tracks/` and `craft/`, and the pack zips made from them) are under
[CC BY-SA 4.0](LICENSE): you may copy, change, share and sell them, with credit to UltraEdge, and changed versions must
use the same licence. UltraSim itself is part of the UltraEdge app and is not covered by this licence.
