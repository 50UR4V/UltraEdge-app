-- UltraSim track: Five Peaks (quads, challenge). Five hairpins, each on a rocky peak, linked by dives into the valleys
-- between them: climb, turn on the summit, dive, again and again. Rock arches and boulders in the valleys.
-- Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/, its name is the id).
return function(api)
  local sin, cos, floor, PI = math.sin, math.cos, math.floor, math.pi
  local function lobes(a) local r = 60 + 12 * cos(5 * a); return r * sin(a), r * cos(a) end
  local hills = {}                                   -- a peak at every inner bend (r = 48), x, z, radius, height
  for k = 0, 4 do
    local a = PI / 5 + k * 2 * PI / 5
    hills[#hills + 1] = { 46 * sin(a), 46 * cos(a), 15, 15 + (k % 2) * 3 }
  end
  hills[#hills + 1] = { 0, 0, 26, 30 }               -- the massif in the middle
  local ROCK = { 0x8E7A66, 0x9C8670, 0x7F6D5C }
  return {
    name = "Five Peaks", order = 9, env = "canyon", seed = 4411, ng = 15, a0 = PI / 5, curve = lobes,
    raise = { [1] = 1.5, [4] = 1.5, [7] = 1.5, [10] = 1.5, [13] = 1.5 }, centre = { 0, 0 }, orbit = 115, trees = { 0, 0 },
    line = false, land = { -100, -100, 100, 100, 4 },
    hgt = function(x, z) return api.hills(hills, x, z, 0.8) end,
    col = function(h, steep) return steep > 0.28 and ROCK[floor(h / 3) % 3 + 1] or (h > 12 and 0xB89868 or 0xAE7A4E) end,
    extras = function(M, C, L)
      local curveAt = api.curveAt
      -- rock arches over the line at the bottom of two dives (outer bends)
      for _, k in ipairs({ 1, 3 }) do
        local yaw, x, z = curveAt(lobes, k * 2 * PI / 5)
        local h = api.hills(hills, x, z, 0.8)
        local cx, cz = cos(yaw), -sin(yaw)
        for side = -1, 1, 2 do
          api.box(M.stone, C, x + cx * 6.2 * side, h + 2.5, z + cz * 6.2 * side, 2.2, 9, 2.4, yaw, 0x8E7A66, 0x9C8670)
        end
        api.box(M.stone, C, x, h + 6.4, z, 14.6, 1.6, 2.6, yaw, 0x9C8670, 0xB89868)
      end
      -- boulders on two more outer bends (the start bend stays clear), on alternate sides of the line
      for _, k in ipairs({ 2, 4 }) do
        for j = -1, 1, 2 do
          local yw, bx, bz = curveAt(lobes, k * 2 * PI / 5 + j * 0.11)
          local px_, pz_ = bx + cos(yw) * 4.6 * j, bz - sin(yw) * 4.6 * j
          local s = 1.5 + ((k + j) % 3) * 0.35
          api.box(M.stone, C, px_, api.hills(hills, px_, pz_, 0.8) + s, pz_, s * 1.8, s * 2.4, s * 1.6, yw + k, ROCK[k % 3 + 1], 0xB89868)
        end
      end
    end,
  }
end
