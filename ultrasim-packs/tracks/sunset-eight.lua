-- UltraSim track: Sunset Eight (quads). A figure of eight in the evening light, ten gates.
-- Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/, its name is the track's id).
return function(api)
  local sin = math.sin
  return {
    name = "Sunset Eight", order = 2, env = "dusk", seed = 1907, ng = 10, a0 = 0.35,
    curve = function(a) return 58 * sin(a), 40 * sin(2 * a) end,
    raise = { [5] = 3.4, [6] = 3.4, [9] = 1.3 }, tent = { 0, -15 }, bales = 1.25, flags = 4.35,
    centre = { 0, 0 }, orbit = 100, trees = { 90, 130 },
  }
end
