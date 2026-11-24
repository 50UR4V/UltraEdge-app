-- UltraSim track: Downtown (quads). City blocks 40 m apart with 14 m streets; the race runs round four blocks, under a
-- skybridge, over a parking deck and back. A track built by hand: its gates are placed one by one (README.md).
return function(api)
  local floor, PI = math.floor, math.pi
  return {
    name = "Downtown", order = 5, env = "city", seed = 6060, centre = { 60, 20 }, orbit = 150,
    look = { shine = 0.15 },                         -- the GPU picture (README.md): a little gloss on the streets
    gates = {                                        -- x, base height, z, heading (0 = +z)
      { 0, 0.6, -10, 0 }, { 0, 0.6, 50, 0 }, { 30, 0.6, 80, PI / 2 }, { 90, 0.6, 80, PI / 2 }, { 120, 8, 40, PI },
      { 120, 0.6, -15, PI }, { 85, 0.6, -40, -PI / 2 }, { 30, 0.6, -40, -PI / 2 },
    },
    vias = { [2] = { { 1, 2.5, 75 } }, [4] = { { 118, 6, 78 } }, [6] = { { 118, 2.5, -37 } }, [8] = { { 2, 2.5, -38 } } },
    extras = function(M, C, L)
      -- the blocks: one building each, a park in the middle of the course
      local cols = { 0x8E99A6, 0xA7A096, 0x7F8B99, 0xB3A590, 0x8792A0, 0x9C9C9C, 0x6F7F92 }
      local rnd = api.rnd
      for i = -3, 5 do
        for j = -3, 5 do
          local bx, bz = 20 + 40 * i, 20 + 40 * j
          if i == 1 and j == 0 then
            for _ = 1, 9 do api.tree(M, C, bx - 10 + rnd() * 20, bz - 10 + rnd() * 20, 0.9 + rnd() * 0.7) end
            api.quad(L, bx - 13, 0.03, bz - 13, bx + 13, 0.03, bz - 13, bx + 13, 0.03, bz + 13, bx - 13, 0.03, bz + 13, 0xE05C8F3C, bx, -5, bz)
          else
            local inner = (i >= 0 and i <= 2 and j >= -1 and j <= 1)
            local h = (inner and 16 or 12) + floor(rnd() * (inner and 30 or 46))
            local w = 26 - floor(rnd() * 3) * 2
            local c = cols[floor(rnd() * #cols) + 1]
            api.box(M.glass, C, bx, h / 2, bz, w, h, w, 0, c, 0x4A4F55)
            if rnd() < 0.4 then api.box(M.concrete, C, bx + 3, h + 1.5, bz - 2, 8, 3, 6, 0, 0x8A8F96, 0x5A5F66) end
          end
        end
      end
      api.box(M.metal, C, 60, 7, 80, 4, 2.4, 14, 0, 0x5F7A99, 0x4A5F78)                   -- the skybridge over the street
      api.box(M.concrete, C, 120, 3.7, 40, 14, 7.4, 16, 0, 0x9EA3A8, 0xB4B8BC)           -- the parking deck across it
      api.box(M.plain, nil, 120, 3.2, 48.05, 14, 0.5, 0.1, 0, 0xFDD835)
      for k = -2, 6 do                                   -- lane lines
        local v = k * 40
        api.quad(L, v - 0.15, 0.03, -100, v + 0.15, 0.03, -100, v + 0.15, 0.03, 220, v - 0.15, 0.03, 220, 0xB0E8E8E8, v, -5, 0)
        api.quad(L, -100, 0.03, v - 0.15, 220, 0.03, v - 0.15, 220, 0.03, v + 0.15, -100, 0.03, v + 0.15, 0xB0E8E8E8, 0, -5, v)
      end
      api.scatter(M, C, 70, 60, 60, 190, 460, function(x, z) return x < -125 or x > 245 or z < -125 or z > 245 end)
    end,
  }
end
