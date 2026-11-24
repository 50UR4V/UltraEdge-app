-- UltraSim track: Island Circuit (flying wings). Round an island low over the sea, through the strait by the islet;
-- touching the water ends the flight. Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/).
return function(api)
  local sin, cos = math.sin, math.cos
  local function island(a) return 200 * sin(a), 140 * (1 - cos(a)) end
  local hills = { { 0, 140, 82, 74 }, { -40, 100, 60, 30 }, { 60, 190, 50, 34 }, { 215, 345, 44, 30 }, { -255, 20, 38, 22 } }
  return {
    name = "Island Circuit", order = 7, wing = true, water = true, env = "sea", seed = 5150, ng = 8, a0 = 0.45,
    curve = island, raise = {}, centre = { 0, 140 }, orbit = 330, trees = { 60, 0 }, treeR = 130, line = false,
    land = { -340, -100, 340, 440, 14 },
    look = { water = true },                         -- the GPU picture (README.md): the sea glints and mirrors the sky
    hgt = function(x, z) return api.hills(hills, x, z, 3) end,
    col = function(h, steep) return h < 2.2 and 0xD8C690 or (steep > 0.22 and 0x8E877A or (h > 50 and 0x9A9488 or 0x5E9440)) end,
    treeOk = function(h) return h > 3 and h < 38 end,
    extras = function(M, C)
      api.box(M.plain, C, 0, 76, 140, 3, 12, 3, 0.3, 0xF2F2F2, 0xD03A2E)             -- the lighthouse on the top
      api.box(M.plain, nil, 0, 83, 140, 3.6, 1.2, 3.6, 0.3, 0xD03A2E)
      for i = 1, 5 do                                -- sea stacks off the course
        local a = i * 1.26
        api.box(M.stone, C, 300 * sin(a), 5 + i, 140 + 215 * cos(a), 5, 10 + 2 * i, 4, a, 0x8E877A, 0x9A9488)
      end
    end,
  }
end
