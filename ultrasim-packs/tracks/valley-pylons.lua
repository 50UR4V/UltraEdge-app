-- UltraSim track: Valley Pylons (flying wings). Air pylons round a wide valley among hills, one pass to climb; also the
-- wings' freestyle field. Pack format: README.md (a file in /SCRIPTS/TOOLS/UltraSim/tracks/, its name is the id).
return function(api)
  local sin, cos = math.sin, math.cos
  local function valley(a) return 170 * sin(a), 110 * (1 - cos(a)) + 30 * sin(2 * a) end
  local hills = { { 0, 118, 62, 50 }, { -270, 60, 90, 55 }, { 260, 170, 100, 60 }, { 60, -140, 90, 40 }, { -120, 320, 110, 45 },
    { 150, 345, 90, 50 }, { -310, -130, 120, 70 }, { 340, -70, 110, 60 }, { -97, 207, 42, 19 } }   -- x, z, radius, height
  return {
    name = "Valley Pylons", order = 6, wing = true, free = true, env = "valley", seed = 3301, ng = 8, a0 = 0.5, curve = valley,
    raise = {}, centre = { 0, 110 }, orbit = 300, trees = { 150, 120 }, treeR = 520, line = false,
    treeOk = false,                                  -- trees keep clear of the course, wherever the land is
    land = { -520, -340, 520, 520, 20 },
    hgt = function(x, z) return api.hills(hills, x, z, 2.5) end,
    col = function(h, steep) return steep > 0.2 and 0x8A8478 or (h > 42 and 0x7FA35A or 0x5C8F3C) end,
    extras = function(M, C, L)
      for i = 0, 39 do                               -- a river across the valley floor
        local x0, x1 = -420 + i * 21, -399 + i * 21
        local z0, z1 = -40 + 34 * sin(x0 * 0.012), -40 + 34 * sin(x1 * 0.012)
        api.quad(L, x0, 0.03, z0 - 6, x0, 0.03, z0 + 6, x1, 0.03, z1 + 6, x1, 0.03, z1 - 6, (i % 2 == 0) and 0xD03A86C8 or 0xD04492D2, x0, -5, z0)
      end
      api.box(M.wood, C, -60, 2.2, 250, 9, 4.4, 7, 0.5, 0xB03A2E, 0x8A2B22)          -- a barn and a silo
      api.column(M.metal, -52, 0, 258, 2.2, 2.2, 9, 10, 0xC8CCD0, 0)
      C[#C + 1] = { x = -52, y = 4.5, z = 258, hx = 2.2, hy = 4.5, hz = 2.2, c = 1, s = 0 }
    end,
  }
end
