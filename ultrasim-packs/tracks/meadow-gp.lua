-- UltraSim track: Meadow GP (quads). Nine gates on a meadow, a pilots' tent, straw bales and flags.
-- Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/, its name is the track's id).
return function(api)
  local sin, cos = math.sin, math.cos
  return {
    name = "Meadow GP", order = 1, env = "day", seed = 4711, ng = 9, a0 = 0.42,
    curve = function(a) return 62 - 62 * cos(a), 46 * sin(a) + 13 * sin(2 * a) end,
    raise = { [5] = 3.2, [8] = 1.4 }, tent = { -6, -3 }, bales = 1.15, flags = 3.5,
    centre = { 62, 0 }, orbit = 95, trees = { 70, 110 },
  }
end
