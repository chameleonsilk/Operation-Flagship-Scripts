------------------------
--  Enemy Ship Arrays --
------------------------

Ship_Names = 2 -- variable for number of available ships per difficulty

Ship_VeryEasy = {
  [1] = "Ship (VeryEasy) #000",
  [2] = "Ship (VeryEasy) #001",
}
Ship_Easy = {
  [1] = "Ship (Easy) #000",
  [2] = "Ship (Easy) #001",
}
Ship_Normal = {
  [1] = "Ship (Normal) #000",
  [2] = "Ship (Normal) #001",
}
Ship_Hard = {
  [1] = "Ship (Hard) #000",
  [2] = "Ship (Hard) #001",
}
Ship_VeryHard = {
  [1] = "Ship (VeryHard) #000",
  [2] = "Ship (VeryHard) #001",
}

---------------
-- End Ships --
---------------

------------------------
-- Enemy Boat Arrays	--
------------------------

Boat_Names = 5 -- variable for number of available ships per difficulty

Boat_VeryEasy = {
  [1] = "Boat (VeryEasy) #000",
  [2] = "Boat (VeryEasy) #001",
  [3] = "Boat (VeryEasy) #002",
  [4] = "Boat (VeryEasy) #003",
  [5] = "Boat (VeryEasy) #004",
}
Boat_Easy = {
  [1] = "Boat (Easy) #000",
  [2] = "Boat (Easy) #001",
  [3] = "Boat (Easy) #002",
  [4] = "Boat (Easy) #003",
  [5] = "Boat (Easy) #004",
}
Boat_Normal = {
  [1] = "Boat (Normal) #000",
  [2] = "Boat (Normal) #001",
  [3] = "Boat (Normal) #002",
  [4] = "Boat (Normal) #003",
  [5] = "Boat (Normal) #004",
}
Boat_Hard = {
  [1] = "Boat (Hard) #000",
  [2] = "Boat (Hard) #001",
  [3] = "Boat (Hard) #002",
  [4] = "Boat (Hard) #003",
  [5] = "Boat (Hard) #004",
}
Boat_VeryHard = {
  [1] = "Boat (VeryHard) #000",
  [2] = "Boat (VeryHard) #001",
  [3] = "Boat (VeryHard) #002",
  [4] = "Boat (VeryHard) #003",
  [5] = "Boat (VeryHard) #004",
}

-----------------
-- End of Boat --
-----------------

-----------------------------------
-- Spawn Naval Mission Function --
-----------------------------------

-- This portion of the script borrows heavily from Kutaisi Intercept script by akp.
-- Much of the functionality has been modified
function csilk_Naval(_mArea)
  local mzone = trigger.misc.getZone(_mArea)
  local mrand = mist.random(1,Ship_Names)
  
  --local srand = mist.random(1,Sam_Launchers)
  navaltask = 1
  
  --trigger.action.deactivateGroup(Group.getByName(BoatName))
  local ShipName = {}
  local ShipNamed = {}
  local BoatName1 = {}
  local BoatName2 = {}
  local BoatName3 = {}
  local BoatName4 = {}
  local BoatName5 = {}
  local BoatName1d = {}
  local BoatName2d = {}
  local BoatName3d = {}
  local BoatName4d = {}
  local BoatName5d = {}
  --local SamName1 = {}
  --local SamName1d = {}
  local randomizer_disperse = 0
  local randomizer_radius = 0
  local randomizer_inner_radius = 0
  local randomizer_max_disperse = 0
    randomizer_disperse = 1
    randomizer_max_disperse = mist.random(3000,3000)
    randomizer_radius = mist.random(3000,3000)
    randomizer_inner_radius = mist.random(2000,2500)

  --if MudName ==  then
  local msg = {}
    msg.text = ' Creating Naval Mission.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

    trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

  if Difficultymod == 1 then
    ShipName = Ship_VeryEasy[mrand]
    --SamName = ''
    BoatName1 = Boat_VeryEasy[1]
    BoatName2 = Boat_VeryEasy[2]
    BoatName3 = Boat_VeryEasy[3]
    BoatName4 = Boat_VeryEasy[4]
    BoatName5 = Boat_VeryEasy[5]
  end

  if Difficultymod == 2 then
    ShipName = Ship_Easy[mrand]
    --SamName = ''
    BoatName1 = Boat_Easy[1]
    BoatName2 = Boat_Easy[2]
    BoatName3 = Boat_Easy[3]
    BoatName4 = Boat_Easy[4]
    BoatName5 = Boat_Easy[5]
  end

  if Difficultymod == 3 then
    ShipName = Ship_Normal[mrand]
    --SamName = ''
    BoatName1 = Boat_Normal[1]
    BoatName2 = Boat_Normal[2]
    BoatName3 = Boat_Normal[3]
    BoatName4 = Boat_Normal[4]
    BoatName5 = Boat_Normal[5]
  end

  if Difficultymod == 4 then
    ShipName = Ship_Hard[mrand]
    --SamName = ''
    BoatName1 = Boat_Hard[1]
    BoatName2 = Boat_Hard[2]
    BoatName3 = Boat_Hard[3]
    BoatName4 = Boat_Hard[4]
    BoatName5 = Boat_Hard[5]
  end

  if Difficultymod == 5 then
    ShipName = Ship_VeryHard[mrand]
    --SamName = ''
    BoatName1 = Boat_VeryHard[1]
    BoatName2 = Boat_VeryHard[2]
    BoatName3 = Boat_VeryHard[3]
    BoatName4 = Boat_VeryHard[4]
    BoatName5 = Boat_VeryHard[5]
  end




  --trigger.action.activateGroup(Group.getByName(ShipName))
  --trigger.action.activateGroup(Group.getByName(SamName1))
  --trigger.action.activateGroup(Group.getByName(InfName1))
  --trigger.action.activateGroup(Group.getByName(InfName2))
  --trigger.action.activateGroup(Group.getByName(InfName3))
  --trigger.action.activateGroup(Group.getByName(InfName4))
  --trigger.action.activateGroup(Group.getByName(InfName5))
  --local MudGrpData = mist.getGroupData(ShipName)

  for i = 1, 500 do
    if Task_Range == 1 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.25, mzone.radius * 0.10)
    elseif Task_Range == 2 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
    elseif Task_Range == 3 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.65, mzone.radius * 0.40)
    elseif Task_Range == 4 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.75, mzone.radius * 0.65)		
    elseif Task_Range == 5 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.85, mzone.radius * 0.80)	
    elseif Task_Range == 6 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.95, mzone.radius * 0.85)
    end
  
  --	if mist.isTerrainValid(mudPsn, {'WATER'}) == true and
    if mist.isTerrainValid(mudPsn, {'WATER'}) == true and mist.terrainHeightDiff(mudPsn, 100) < 2 then
      break
    end
  end

  local buildPsn = mist.utils.makeVec3(mudPsn)		

  --local randomobjects = 0
  --local randomobjects = mist.random(1,9)

  local vars = {
    type = "Oil platform",
    country = 'GEORGIA',
    category = "Fortifications", 
    x = buildPsn.x,
    y = buildPsn.z + math.random(475, 575),
    --name = "Strike1", 
    groupName = "Strike1",
    heading = 0.47123889803847
  }
  mist.dynAddStatic(vars)
  local vars2 = {
    type = "Oil platform",
    country = 'GEORGIA',
    category = "Fortifications", 
    x = buildPsn.x,
    y = buildPsn.z + math.random(775, 1075),
    --name = "Strike2", 
    groupName = "Strike2",
    heading = 0.47123889803847
  }
  mist.dynAddStatic(vars2)
  local vars3 = {
    type = "Oil platform",
    country = 'GEORGIA',
    category = "Fortifications", 
    x = buildPsn.x + math.random(775, 1075),
    y = buildPsn.z,
    --name = "Strike3", 
    groupName = "Strike3",
    heading = 0.47123889803847
  }
  mist.dynAddStatic(vars3)

  local msg = {}
    msg.text = ' Platforms placed.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  local navalvars = {}
    navalvars.groupName = ShipName
    navalvars.action = "respawn"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = randomizer_max_disperse
    navalvars.radius = randomizer_radius
    navalvars.innerRadius = randomizer_inner_radius
    ShipNamed = mist.teleportToPoint(navalvars)

    formisttable5 = '[g]' .. ShipNamed
    targets5 = mist.makeUnitTable({formisttable5})

    AddOP(ShipNamed) -- add MBOT to it

  local msg = {}
    msg.text = ' Post Mbot.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  local navalvars = {}
    navalvars.groupName = BoatName1
    navalvars.action = "respawn"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius
    navalvars.innerRadius = randomizer_inner_radius
    BoatName1d = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName2
    navalvars.action = "respawn"
    navalvars.point = mudPsn
    navalvars.disperse = true
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius
    navalvars.innerRadius = randomizer_inner_radius
    BoatName2d = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName3
    navalvars.action = "respawn"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius
    navalvars.innerRadius = randomizer_inner_radius
    BoatName3d = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName4
    navalvars.action = "respawn"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius
    navalvars.innerRadius = randomizer_inner_radius
    BoatName4d = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName5
    navalvars.action = "respawn"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius
    navalvars.innerRadius = randomizer_inner_radius
    BoatName5d = mist.teleportToPoint(navalvars)		 

  local msg = {}
    msg.text = ' Post Boats.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

    --mist.spawnRandomizedGroup(ShipName)
    --mist.spawnRandomizedGroup(ShipName)
    --mist.spawnRandomizedGroup(BoatName1)
    --mist.spawnRandomizedGroup(BoatName2)
    --mist.spawnRandomizedGroup(BoatName3)
    --mist.spawnRandomizedGroup(BoatName4)
    --mist.spawnRandomizedGroup(BoatName5)		

  local navalvars = {}
    navalvars.groupName = ShipName
    navalvars.action = "teleport"
    navalvars.point = mudPsn
    ShipNamed = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName1
    navalvars.action = "teleport"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius
    navalvars.innerRadius = randomizer_inner_radius
    BoatName1d = mist.teleportToPoint(navalvars)


  local navalvars = {}
    navalvars.groupName = BoatName2
    navalvars.action = "teleport"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius - 1000
    navalvars.innerRadius = randomizer_inner_radius - 1000
    BoatName2d = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName3
    navalvars.action = "teleport"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius - 1000
    navalvars.innerRadius = randomizer_inner_radius - 1000
    BoatName3d = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName4
    navalvars.action = "teleport"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius - 1000
    navalvars.innerRadius = randomizer_inner_radius - 1000
    BoatName4d = mist.teleportToPoint(navalvars)

  local navalvars = {}
    navalvars.groupName = BoatName5
    navalvars.action = "teleport"
    navalvars.point = mudPsn
    navalvars.disperse = randomizer_disperse
    navalvars.maxDisp = 25
    navalvars.radius = randomizer_radius - 1000
    navalvars.innerRadius = randomizer_inner_radius - 1000
    BoatName5d = mist.teleportToPoint(navalvars)		 

  mist.removeFunction(ShipFunc1d)
  mist.removeFunction(BoatFunc1d)
  mist.removeFunction(BoatFunc2d)
  mist.removeFunction(BoatFunc3d)
  mist.removeFunction(BoatFunc4d)
  mist.removeFunction(BoatFunc5d)

  BoatFunc1d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    BoatFunc1d = mist.scheduleFunction(Move_Boats, {BoatName1d}, randomizer_time, randomizer_time)

  BoatFunc2d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    BoatFunc2d = mist.scheduleFunction(Move_Boats, {BoatName2d}, randomizer_time, randomizer_time)

  BoatFunc3d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    BoatFunc3d = mist.scheduleFunction(Move_Boats, {BoatName3d}, randomizer_time, randomizer_time)

  BoatFunc4d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    BoatFunc4d = mist.scheduleFunction(Move_Boats, {BoatName4d}, randomizer_time, randomizer_time)

  BoatFunc5d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    BoatFunc5d = mist.scheduleFunction(Move_Boats, {BoatName5d}, randomizer_time, randomizer_time)

  ShipFunc1d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    ShipFunc1d = mist.scheduleFunction(Move_Ships, {ShipNamed}, randomizer_time, randomizer_time)


  local msg = {}
    msg.text = ' Naval task has been created '
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing3.ogg')

 -- local Strike_Area2 = {}
  --  Strike_Area2.x = buildPsn.x
  --  Strike_Area2.y = buildPsn.y
  --  Strike_Area2.z = buildPsn.z
  --  radius = 13000

  --mist.flagFunc.mapobjs_dead_zones { zones = Strike_Area2, flag = '701', req_num = 3, stopFlag = '702'}
end

---------------------------------
-- End Strike Mission Function --
---------------------------------

