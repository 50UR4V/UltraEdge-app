-- UltraSim aircraft: Swift 800, a nimble 800 mm flying wing. Pack format: README.md (a file in
-- /SCRIPTS/TOOLS/UltraSim/craft/). A wing gives every number: m kg, S wing area m2, thrust N static, vpitch m/s where the
-- prop stops pulling, cd0 drag at zero lift, k its growth with lift, cla lift per radian, astall stall angle (rad), roll
-- and pitch authority (rad/s at the dynamic pressure qref), stab and vane pitch and yaw stability, dih dihedral, cy side
-- force, atrim trim angle of attack, a0 zero-lift angle. Estimates, not yet flown by a pilot.
return {
  name = "Swift 800 wing", order = 2, wing = true,
  m = 0.55, S = 0.14, thrust = 9.0, vpitch = 46, cd0 = 0.035, k = 0.09, cla = 4.2, astall = 0.26,
  roll = 7.0, pitch = 2.6, stab = 3.0, vane = 9, dih = 1.5, cy = 1.2, qref = 200, atrim = 0.045, a0 = 0.0,
  look = { shine = 0.25 },                           -- its gloss in the GPU picture (README.md)
}
