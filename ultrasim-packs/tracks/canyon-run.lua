-- UltraSim track: Canyon Run (quads). A gorge with a river and a bridge to fly under, rock pillars, a hump to climb and
-- a tunnel through a mesa. Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/, its name is the id).
return function(api)
  local sin, cos, exp, floor, PI = math.sin, math.cos, math.exp, math.floor, math.pi
  local function canyon(a) return 60 * sin(a), 85 * (1 - cos(a)) + 8 * sin(2 * a) end
  local cpts = api.sampled(canyon, 120)
  local SAND = { 0xAE7A4E, 0x9C6943, 0xBB8859 }
  local smooth, curveAt = api.smooth, api.curveAt
  return {
    name = "Canyon Run", order = 4, env = "canyon", seed = 2203, ng = 10, a0 = 0.45, curve = canyon,
    raise = { [3] = 1.6, [4] = 0.6 }, centre = { 0, 85 }, orbit = 125, trees = { 0, 0 }, line = false,
    land = { -120, -70, 120, 240, 6 },
    look = { glow = 0.7 },                           -- the GPU picture (README.md): less sun halo over the bright sand
    hgt = function(x, z)
      local d, i = api.curveDist(cpts, x, z)
      if d > 56 then return 0 end
      local a = (i - 1) / 120 * 2 * PI
      local walls = smooth(a, 0.75, 1.05) * (1 - smooth(a, 2.55, 2.85)) * smooth(d, 6.5, 20) * (1 - smooth(d, 30, 52))
      local e = (a - 4.22) / 0.22
      return walls * (15 + 3 * sin(x * 0.09) + 2.5 * sin(z * 0.13)) + 8.5 * exp(-e * e) * (1 - smooth(d, 26, 55))
    end,
    col = function(h, steep) return (h > 13.5 and steep < 0.12) and 0xB89868 or SAND[floor(h / 2.6) % 3 + 1] end,
    extras = function(M, C, L)
      -- the river down the gorge
      for i = 0, 39 do
        local y0, x0, z0 = curveAt(canyon, 0.8 + i * 0.05)
        local y1, x1, z1 = curveAt(canyon, 0.85 + i * 0.05)
        local ax, az, bx, bz = x0 + cos(y0) * 3.6, z0 - sin(y0) * 3.6, x1 + cos(y1) * 3.6, z1 - sin(y1) * 3.6
        api.quad(L, ax - cos(y0) * 1.6, 0.03, az + sin(y0) * 1.6, ax + cos(y0) * 1.6, 0.03, az - sin(y0) * 1.6,
          bx + cos(y1) * 1.6, 0.03, bz - sin(y1) * 1.6, bx - cos(y1) * 1.6, 0.03, bz + sin(y1) * 1.6,
          (i % 2 == 0) and 0xD03A86C8 or 0xD04492D2, ax, -5, az)
      end
      -- a bridge across the gorge, flown under
      local yaw, x, z = curveAt(canyon, 1.8)
      api.box(M.concrete, C, x, 11, z, 46, 0.8, 4, yaw, 0x9A958C, 0xA8A39A)
      api.box(M.metal, C, x, 12, z, 46, 1.1, 0.15, yaw, 0x9B5B3A)
      -- two rock pillars to pass between, and the mesa with its tunnel
      yaw, x, z = curveAt(canyon, 3.25)
      api.box(M.stone, C, x + cos(yaw) * 5.5, 9, z - sin(yaw) * 5.5, 3.2, 18, 3.2, 0.4, 0xB5774A, 0xD49A63)
      api.box(M.stone, C, x - cos(yaw) * 5.5, 7, z + sin(yaw) * 5.5, 3.6, 14, 3.0, 1.1, 0xC48A55, 0xD49A63)
      yaw, x, z = curveAt(canyon, 5.25)
      api.mesa(M, C, x, z, yaw, 18, 0)
      for i = 1, 26 do                               -- boulders about the plain
        local a, r = api.rnd() * 2 * PI, 70 + api.rnd() * 150
        local bx, bz = cos(a) * r, 85 + sin(a) * r
        if api.curveDist(cpts, bx, bz) > 60 then
          local k = 1 + api.rnd() * 3
          api.box(M.stone, C, bx, k * 0.45, bz, k * 1.6, k * 0.9, k * 1.3, api.rnd() * 3, SAND[i % 3 + 1], 0xD49A63)
        end
      end
    end,
  }
end
