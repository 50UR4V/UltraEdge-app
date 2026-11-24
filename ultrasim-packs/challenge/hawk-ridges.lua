-- UltraSim track: Hawk Ridges (flying wings, challenge). Four ridge spurs round a massif, the course pinched in over
-- each one: climb over the spur's shoulder, bank hard down into the bowl beyond it, pull up for the next spur.
-- Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/, its name is the id).
return function(api)
  local sin, cos, PI = math.sin, math.cos, math.pi
  local function weave(a) local r = 122 + 28 * cos(4 * a); return r * sin(a), r * cos(a) end
  local hills = { { 0, 0, 48, 28 } }                -- the massif in the middle, x, z, radius, height
  for k = 0, 3 do                                    -- a spur behind every inner bend
    local a = PI / 4 + k * PI / 2
    hills[#hills + 1] = { 64 * sin(a), 64 * cos(a), 28, 32 + (k % 2) * 6 }
  end
  for k = 0, 3 do                                    -- and low hills outside the outer bends
    local a = k * PI / 2
    hills[#hills + 1] = { 205 * sin(a), 205 * cos(a), 38, 22 }
  end
  return {
    name = "Hawk Ridges", order = 10, wing = true, env = "valley", seed = 5522, ng = 12, a0 = PI / 4, curve = weave,
    raise = { [1] = 5, [4] = 5, [7] = 5, [10] = 5 },
    kinds = { [1] = "blimp", [4] = "blimp", [7] = "blimp", [10] = "blimp" },    -- a blimp's ring over every spur (an app
                                                     -- before gate shapes shows pylons there) centre = { 0, 0 }, orbit = 290, trees = { 120, 90 }, treeR = 420,
    line = false, treeOk = false, land = { -340, -340, 340, 340, 18 },
    hgt = function(x, z) return api.hills(hills, x, z, 2) end,
    col = function(h, steep) return steep > 0.25 and 0x8A8478 or (h > 30 and 0x7FA35A or 0x5C8F3C) end,
    extras = function(M, C, L)
      -- a hut in one gully
      api.box(M.wood, C, 156, 2, 0, 7, 4, 5, 0.3, 0xB03A2E, 0x8A2B22)
    end,
  }
end
