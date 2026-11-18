-- UltraSim track: Bando Run (quads). An abandoned hall, a tower, a parking deck and containers; the race goes in
-- through a window, out by the end door, round the tower and between the decks. Also the quads' freestyle map.
-- A track built by hand: its gates are placed one by one (README.md).
return function(api)
  local sin, cos, sqrt, PI = math.sin, math.cos, math.sqrt, math.pi
  local GATES = {                                    -- x, base height, z, heading (0 = +z)
    { 3.8, 1.3, 11, 0 }, { 10, 0.5, 38, PI / 2 }, { 31, 0.3, 32, PI / 2 }, { 53, 2.5, 47, -PI / 4 }, { 20, 2, 58, -PI / 2 },
    { -20, 1, 57, -PI / 2 }, { -45.5, 3.45, 56, PI }, { -45.5, 3.45, 12, PI }, { -21, 0, -8, PI / 2 },
  }
  return {
    name = "Bando Run", order = 3, free = true, env = "bando", seed = 90210, centre = { 0, 30 }, orbit = 85,
    gates = GATES,
    vias = {                                         -- extra points of the racing line after gate i: the window, the door, round the tower, the decks
      [1] = { { 3.8, 2.6, 20 }, { 1.5, 2.3, 29 }, { 3, 1.9, 35 } }, [2] = { { 25.6, 2.2, 32 } },
      [3] = { { 40, 3.5, 21 }, { 53, 4, 28 } }, [6] = { { -38, 4.5, 63 } },
      [7] = { { -45.5, 4.75, 48 }, { -45.5, 4.75, 20 } }, [8] = { { -43, 2.5, 0 } },
    },
    extras = function(M, C, L, s)                    -- s.rl = the racing line, s.spawn = the start { x, z, heading }
      local box, rnd = api.box, api.rnd
      local T = M.concrete
      local CON, CON2, RUST = 0xA9A59C, 0x8F8B83, 0x9B5B3A
      -- an abandoned hall: walls with door and window gaps, part of the roof left
      local function wall(x0, z0, x1, z1, y0, y1, col)
        local dx, dz = x1 - x0, z1 - z0
        local len = sqrt(dx * dx + dz * dz)
        box(T, C, (x0 + x1) / 2, (y0 + y1) / 2, (z0 + z1) / 2, len, y1 - y0, 0.35, math.atan(dz, dx) * -1, col or CON)
      end
      -- long walls (z = 20 and z = 44), each with openings: pillars between windows, a lintel band on top
      for _, wz in ipairs({ 20, 44 }) do
        for i = 0, 7 do
          local x0 = -24 + i * 6
          wall(x0, wz, x0 + 1.6, wz, 0, 6.5)                    -- pillar
          wall(x0 + 1.6, wz, x0 + 6, wz, 0, 1.1, CON2)          -- sill
          wall(x0 + 1.6, wz, x0 + 6, wz, 4.2, 6.5)              -- lintel
        end
        wall(24, wz, 25.6, wz, 0, 6.5)
      end
      -- end walls with a big door
      for _, wx in ipairs({ -24, 25.6 }) do
        wall(wx, 20, wx, 28, 0, 6.5)
        wall(wx, 36, wx, 44, 0, 6.5)
        wall(wx, 28, wx, 36, 4.6, 6.5)
      end
      -- roof beams and two roof slabs left standing
      for i = 0, 8 do box(M.metal, C, -24 + i * 6.2, 6.7, 32, 0.4, 0.5, 24.4, 0, RUST) end
      box(M.metal, C, -14.7, 7.05, 32, 18.6, 0.2, 24.4, 0, 0x7E8792)
      box(M.metal, C, 16.3, 7.05, 32, 18.6, 0.2, 24.4, 0, 0x7E8792)
      -- concrete floor
      api.quad(L, -25, 0.03, 19, 26.6, 0.03, 19, 26.6, 0.03, 45, -25, 0.03, 45, 0xE09C9A93, 0, -5, 30)
      -- inner pillars
      for i = 0, 3 do box(T, C, -12 + i * 8.4, 3.3, 32, 0.6, 6.6, 0.6, 0, CON2) end
      -- a tower with a through-gap, and a parking deck
      box(M.panel, C, 44, 9, 30, 6, 18, 6, 0.3, CON, CON2)
      box(M.panel, C, 44, 22.5, 30, 6, 5, 6, 0.3, CON, CON2)
      for _, p in ipairs({ { -2.5, -2.5 }, { 2.5, -2.5 }, { -2.5, 2.5 }, { 2.5, 2.5 } }) do
        local c, sn = cos(0.3), sin(0.3)
        box(T, C, 44 + p[1] * c + p[2] * sn, 19, 30 - p[1] * sn + p[2] * c, 0.5, 2, 0.5, 0.3, CON2)
      end
      for lvl = 0, 1 do
        box(T, C, -50, 3.2 + lvl * 3.2, 34, 22, 0.3, 30, 0, 0x9EA3A8, 0xB4B8BC)
        for ix = 0, 2 do for iz = 0, 3 do
          box(T, C, -59 + ix * 9, 1.6 + lvl * 3.2, 21 + iz * 8.6, 0.5, 3.2, 0.5, 0, CON2)
        end end
      end
      local rl, spawn = s.rl, s.spawn
      local function nearGate(x, z, r)
        for i = 1, #GATES do
          local g = GATES[i]
          if (x - g[1]) ^ 2 + (z - g[3]) ^ 2 < r * r then return true end
        end
        for i = 1, rl.n, 3 do
          if (x - rl.X[i]) ^ 2 + (z - rl.Z[i]) ^ 2 < 64 then return true end
        end
        return (x - spawn[1]) ^ 2 + (z - spawn[2]) ^ 2 < 144
      end
      -- shipping containers, clear of the start and the gates
      local cc = { 0xC0392B, 0x2471A3, 0x1E8449, 0xD68910, 0x7D3C98 }
      for i = 1, 9 do
        local x, z, yaw = -30 + rnd() * 80, -24 + rnd() * 30, rnd() * 3
        if not nearGate(x, z, 12) then
          box(M.metal, C, x, 1.3, z, 6.1, 2.6, 2.44, yaw, cc[1 + i % 5])
          if i % 3 == 0 then box(M.metal, C, x, 3.9, z, 6.1, 2.6, 2.44, yaw + 0.2, cc[1 + (i + 2) % 5]) end
        end
      end
      local function clear(x, z) return (x < -72 or x > 66 or z < -34 or z > 70) and x * x + z * z > 150 end
      api.scatter(M, C, 40, 0, 15, 60, 170, clear)
      api.scatter(M, C, 50, 0, 15, 170, 420, clear)
    end,
  }
end
