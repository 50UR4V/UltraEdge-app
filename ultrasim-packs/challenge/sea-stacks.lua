-- UltraSim track: Sea Stacks (flying wings, challenge). Low over the sea, a slalom of pylons round a ring of rock
-- stacks, each bend tucked in behind one, then a climb over the headland and a dive back to the water. Touching the
-- water ends the flight. Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/, its name is the id).
return function(api)
  local sin, cos, PI = math.sin, math.cos, math.pi
  local function ring(a) local r = 118 + 10 * cos(6 * a); return 1.25 * r * sin(a), r * cos(a) end
  local hills = { { 0, -128, 42, 18 }, { -26, -152, 26, 10 }, { 0, 0, 34, 20 }, { 0, 132, 18, 7 } }   -- headland, its shoulder, islet, the start's rock
  return {
    name = "Sea Stacks", order = 11, wing = true, water = true, env = "sea", seed = 6262, ng = 12, a0 = PI / 6,
    curve = ring, raise = {},
    kinds = { [3] = "blimp", [9] = "blimp" }, lift = { [3] = 6, [9] = 6 },   -- two blimps' rings over the sea centre = { 0, 0 }, orbit = 280, trees = { 30, 0 }, treeR = 60,
    line = false, land = { -200, -200, 200, 170, 12 },
    hgt = function(x, z) return api.hills(hills, x, z, 3) end,
    col = function(h, steep) return h < 2.2 and 0xD8C690 or (steep > 0.22 and 0x8E877A or (h > 22 and 0x9A9488 or 0x5E9440)) end,
    treeOk = function(h) return h > 3 and h < 14 end,
    extras = function(M, C)
      local curveAt = api.curveAt
      -- a stack inside every bend that turns away from the middle, and one outside every other bend
      for k = 0, 11 do
        local a = k * PI / 6
        local yaw, x, z = curveAt(ring, a)
        local side = (k % 2 == 0) and -1 or 1          -- even k: outer bends (stack inside), odd: inner bends (outside)
        local d = 17
        local sx, sz = x + cos(yaw) * d * side, z - sin(yaw) * d * side
        if api.hills(hills, sx, sz, 3) < 1 then
          local h = 16 + (k % 3) * 7
          api.box(M.stone, C, sx, h / 2, sz, 8 + (k % 2) * 3, h, 7, a, 0x8E877A, 0x9A9488)
        end
      end
      local g = api.hills(hills, 24, -140, 3)                                     -- the lighthouse on the headland
      api.box(M.plain, C, 24, g + 4.5, -140, 3, 10, 3, 0.3, 0xF2F2F2, 0xD03A2E)
      api.box(M.plain, nil, 24, g + 10.1, -140, 3.6, 1.2, 3.6, 0.3, 0xD03A2E)
    end,
  }
end
