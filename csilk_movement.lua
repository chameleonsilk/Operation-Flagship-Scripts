----------------------------
-- Move Convoy Function --
----------------------------
function Move_Convoy(_Mud)
  local MoveConvoy = {}
  local randomizer_speed = 0
  local randomizer_dir = 0
  local randomizer_dist = 0
  MoveConvoy = _Mud
    randomizer_speed = math.random(25,44)
    randomizer_dir = math.random(1,359)
    randomizer_dist = math.random(2000, 2500)
    
  local formationrand = mist.random(1,6)
  
  if formationrand == 1 then
    mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Off Road', randomizer_dir, randomizer_speed)
  elseif formationrand == 2 then
    mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Cone', randomizer_dir, randomizer_speed)
  elseif formationrand == 3 then
    mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
  elseif formationrand == 4 then
    mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'Diamond', randomizer_dir, randomizer_speed)
  elseif formationrand == 5 then
    mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'EchelonL', randomizer_dir, randomizer_speed)
  elseif formationrand == 6 then
    mist.groupRandomDistSelfSafe(MoveConvoy, randomizer_dist, 'EchelonR', randomizer_dir, randomizer_speed)
  end
  --return
end
----------------------------
-- Move Infantry Function --
----------------------------
function Move_Infantry(_infantry)   
  local randomizer_speed = 0
  local randomizer_dir = 0
  local randomizer_dist = 0
  local Infantry_Name = {}
  Infantry_Name = _infantry
    randomizer_speed = math.random(1,4)
    randomizer_dir = math.random(1,359)
    randomizer_dist = math.random(25, 200)
  
  local formationrand = mist.random(1,8)
  
  if formationrand == 1 then
    mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
  elseif formationrand == 3 then
    mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'EchelonL', randomizer_dir, randomizer_speed)
  elseif formationrand == 4 then
    mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'EchelonR', randomizer_dir, randomizer_speed)
  end
  --return
end
--------------------------------
-- End Move Infantry Function --
--------------------------------

-------------------------
-- Move Ships Function --
-------------------------
function Move_Ships(_Boats)
  local randomizer_speed = 0
  local randomizer_dir = 0
  local randomizer_dist = 0
  local Infantry_Name = {}
  Boat_Name = _Boats
    randomizer_speed = math.random(7,14)
    randomizer_dir = math.random(60,310)
    randomizer_dist = math.random(1000, 2000)

  local formationrand = 1
  
  if formationrand == 1 then
    mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
  end
  --return
end
-----------------------------
-- End Move Ships Function --
-----------------------------
-------------------------
-- Move Boats Function --
-------------------------
function Move_Boats(_Boats)
  local randomizer_speed = 0
  local randomizer_dir = 0
  local randomizer_dist = 0
  local Infantry_Name = {}
  Boat_Name = _Boats
    randomizer_speed = math.random(44,50)
    randomizer_dir = math.random(1,359)
    randomizer_dist = math.random(500, 775)

  local formationrand = mist.random(1,4)

  if formationrand == 1 then
    mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
  elseif formationrand == 3 then
    mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'EchelonL', randomizer_dir, randomizer_speed)
  elseif formationrand == 4 then
    mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'EchelonR', randomizer_dir, randomizer_speed)
  end
  --return
end

-----------------------------
-- End Move Boats Function --
-----------------------------