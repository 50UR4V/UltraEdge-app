-- UltraSim track: Steelworks (quads, challenge). A steel yard flown close: a slalom between container stacks, a climb
-- onto the blast-furnace tower and a split-S off it, a gate under the pipe rack, a hairpin round the chimney and a
-- window in the mill wall. A track built by hand: its gates are placed one by one (README.md).
return function(api)
  local PI = math.pi
  return {
    name = "Steelworks", order = 8, env = "bando", seed = 7117, start = 7, centre = { 0, 55 }, orbit = 95,
    gates = {                                        -- x, base height, z, heading (0 = +z)
      { 0, 0.5, 10, 0 }, { 5, 0.5, 28, 0 }, { -5, 0.5, 42, 0 }, { 5, 0.5, 56, 0 },
      { 5, 12, 76, 0 },                              -- on top of the tower
      { -5, 0.5, 84, PI },                           -- the split-S: back down, the other way
      { -8, 0.3, 64, PI },                           -- under the pipe rack
      { -14, 0.5, 46, PI }, { -24, 0.5, 46, 0 },     -- the hairpin round the chimney
      { -22, 4, 66, 0 },                             -- the window
      { -8, 0.5, 100, PI / 2 }, { 22, 0.5, 92, PI }, { 20, 0.5, 40, PI }, { 14, 0.5, 8, -PI / 2 },
    },
    vias = {
      [4] = { { 5, 4, 64 } }, [5] = { { 5, 13, 82 }, { 1, 9, 90 }, { -3, 4, 90 } },
      [8] = { { -17, 1.5, 40 }, { -21, 1.5, 40 } },
      [10] = { { -22, 5, 82 }, { -18, 3, 96 } }, [11] = { { 16, 2, 102 } }, [14] = { { 4, 1.5, 0 } },
    },
    extras = function(M, C, L)
      local box = api.box
      local RUST, STEEL, CON = 0x9B5B3A, 0x7E8792, 0xA9A59C
      local CONT = { 0xB03A2E, 0x1E6FB0, 0x2E8B57, 0xD08A2E }
      -- container stacks beside the slalom, each on the side the line swings away from
      for i, p in ipairs({ { -5, 28 }, { 5, 42 }, { -5, 56 } }) do
        for k = 0, 2 do box(M.metal, C, p[1], 1.3 + k * 2.6, p[2], 2.5, 2.6, 7, 0, CONT[(i + k) % 4 + 1], 0x5A5F66) end
      end
      -- the blast-furnace tower: a 12 m block, flown over; a gantry on its north edge
      box(M.panel, C, 5, 6, 75, 8, 12, 7, 0, CON, 0x8F8B83)
      box(M.metal, C, 5, 15.5, 79.2, 8, 0.4, 0.4, 0, RUST)
      -- the pipe rack across the yard: posts and pipes, the gate under it
      for _, x in ipairs({ -15, -1 }) do box(M.metal, C, x, 1.8, 64, 0.5, 3.6, 0.5, 0, STEEL) end
      for k = 0, 2 do box(M.metal, C, -8, 3.9 + k * 0.6, 64, 14.5, 0.45, 0.45, 0, k == 1 and RUST or STEEL) end
      -- the chimney the hairpin turns round
      api.column(M.metal, -19, 0, 49, 1.6, 1.2, 24, 12, 0x8A4A2E, 0)
      C[#C + 1] = { x = -19, y = 12, z = 49, hx = 1.6, hy = 12, hz = 1.6, c = 1, s = 0 }
      -- the mill wall with its window (the gate stands in it)
      local wz = 66
      box(M.concrete, C, -28.5, 4.5, wz, 9.8, 9, 0.5, 0, CON)          -- west of the window
      box(M.concrete, C, -17.2, 4.5, wz, 6.4, 9, 0.5, 0, CON)           -- east of it
      box(M.concrete, C, -22, 1.8, wz, 3.2, 3.6, 0.5, 0, 0x8F8B83)      -- under it
      box(M.concrete, C, -22, 8, wz, 3.2, 2, 0.5, 0, 0x8F8B83)          -- over it
      -- the mill roof north of the wall, and scrap heaps about the yard
      box(M.metal, C, -24, 9.2, 74, 20, 0.3, 16, 0, STEEL)
      for _, p in ipairs({ { -28, 66.2 }, { -14, 66.2 } }) do box(M.concrete, C, p[1], 4.5, 82, 0.6, 9, 0.6, 0, CON) end
      for i = 1, 10 do
        local a = i * 0.63
        box(M.metal, C, 30 + 8 * math.cos(a * 3), 0.6, 70 + 30 * math.sin(a), 2.5, 1.2, 1.8, a, RUST)
      end
      api.quad(L, -30, 0.03, 0, 30, 0.03, 0, 30, 0.03, 110, -30, 0.03, 110, 0xD08F8B83, 0, -5, 55)
    end,
  }
end
