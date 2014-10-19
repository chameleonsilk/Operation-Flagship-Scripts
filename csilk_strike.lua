-----------------------------
-- Surface to Air Missiles --
-----------------------------

Sam_Launchers = 2

Sam_VeryEasy = {
  [1] = 'Sam (VeryEasy) #000',
  [2] = 'Sam (VeryEasy) #001',
}

Sam_Easy = {
  [1] = 'Sam (Easy) #000',
  [2] = 'Sam (Easy) #001',
}

Sam_Normal = {
  [1] = 'Sam (Normal) #000',
  [2] = 'Sam (Normal) #001',
}

Sam_Hard = {
  [1] = 'Sam (Hard) #000',
  [2] = 'Sam (Hard) #001',
}

Sam_VeryHard = {
  [1] = 'Sam (VeryHard) #000',
  [2] = 'Sam (VeryHard) #001',
}

---------------------------------
-- End Surface to Air Missiles --
---------------------------------
-----------------------------
-- infantry spawning array --
-----------------------------
Infantry2_Squads = 5

Infantry2_VeryEasy = {
  [1] = 'Infantry2 (VeryEasy) #000',
  [2] = 'Infantry2 (VeryEasy) #001',
  [3] = 'Infantry2 (VeryEasy) #002',
  [4] = 'Infantry2 (VeryEasy) #003',
  [5] = 'Infantry2 (VeryEasy) #004',
}
Infantry2_Easy = {
  [1] = 'Infantry2 (Easy) #000',
  [2] = 'Infantry2 (Easy) #001',
  [3] = 'Infantry2 (Easy) #002',
  [4] = 'Infantry2 (Easy) #003',
  [5] = 'Infantry2 (Easy) #004',
}
Infantry2_Normal = {
  [1] = 'Infantry2 (Normal) #000',
  [2] = 'Infantry2 (Normal) #001',
  [3] = 'Infantry2 (Normal) #002',
  [4] = 'Infantry2 (Normal) #003',
  [5] = 'Infantry2 (Normal) #004',
}
Infantry2_Hard = {
  [1] = 'Infantry2 (Hard) #000',
  [2] = 'Infantry2 (Hard) #001',
  [3] = 'Infantry2 (Hard) #002',
  [4] = 'Infantry2 (Hard) #003',
  [5] = 'Infantry2 (Hard) #004',
}
Infantry2_VeryHard = {
  [1] = 'Infantry2 (VeryHard) #000',
  [2] = 'Infantry2 (VeryHard) #001',
  [3] = 'Infantry2 (VeryHard) #002',
  [4] = 'Infantry2 (VeryHard) #003',
  [5] = 'Infantry2 (VeryHard) #004',
}

---------------------------------
--End Infantry spawning array --
---------------------------------

-----------------------------------
-- Spawn Strike Mission Function --
-----------------------------------

-- This portion of the script borrows heavily from Kutaisi Intercept script by akp.
-- Much of the functionality has been modified
function csilk_Strike(_mArea)
  local mzone = trigger.misc.getZone(_mArea)
  local mrand = mist.random(1,Mud_Names)
  local srand = mist.random(1,Sam_Launchers)
  striketask = 1

  --trigger.action.deactivateGroup(Group.getByName(InfName))
  local MudName = {}
  local MudNamed = {}
  local InfName1 = {}
  local InfName2 = {}
  local InfName3 = {}
  local InfName4 = {}
  local InfName5 = {}
  local InfName1d = {}
  local InfName2d = {}
  local InfName3d = {}
  local InfName4d = {}
  local InfName5d = {}
  local SamName1 = {}
  local SamName1d = {}

  --if MudName ==  then
  local msg = {}
    msg.text = ' Creating Strike Mission.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

    trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

  if Difficultymod == 1 then
    MudName = Mud_VeryEasy[mrand]
    --SamName = ''
    InfName1 = Infantry2_VeryEasy[1]
    InfName2 = Infantry2_VeryEasy[2]
    InfName3 = Infantry2_VeryEasy[3]
    InfName4 = Infantry2_VeryEasy[4]
    InfName5 = Infantry2_VeryEasy[5]
    SamName1 = Sam_VeryEasy[srand]
  end

  if Difficultymod == 2 then
    MudName = Mud_Easy[mrand]
    --SamName = ''
    InfName1 = Infantry2_Easy[1]
    InfName2 = Infantry2_Easy[2]
    InfName3 = Infantry2_Easy[3]
    InfName4 = Infantry2_Easy[4]
    InfName5 = Infantry2_Easy[5]
    SamName1 = Sam_Easy[srand]
  end

  if Difficultymod == 3 then
    MudName = Mud_Normal[mrand]
    --SamName = ''
    InfName1 = Infantry2_Normal[1]
    InfName2 = Infantry2_Normal[2]
    InfName3 = Infantry2_Normal[3]
    InfName4 = Infantry2_Normal[4]
    InfName5 = Infantry2_Normal[5]
    SamName1 = Sam_Normal[srand]
  end

  if Difficultymod == 4 then
    MudName = Mud_Hard[mrand]
    --SamName = ''
    InfName1 = Infantry2_Hard[1]
    InfName2 = Infantry2_Hard[2]
    InfName3 = Infantry2_Hard[3]
    InfName4 = Infantry2_Hard[4]
    InfName5 = Infantry2_Hard[5]
    SamName1 = Sam_Hard[srand]
  end

  if Difficultymod == 5 then
    MudName = Mud_VeryHard[mrand]
    --SamName = ''
    InfName1 = Infantry2_VeryHard[1]
    InfName2 = Infantry2_VeryHard[2]
    InfName3 = Infantry2_VeryHard[3]
    InfName4 = Infantry2_VeryHard[4]
    InfName5 = Infantry2_VeryHard[5]
    SamName1 = Sam_VeryHard[srand]
  end

  --trigger.action.activateGroup(Group.getByName(MudName))
  --trigger.action.activateGroup(Group.getByName(SamName1))
  --trigger.action.activateGroup(Group.getByName(InfName1))
  --trigger.action.activateGroup(Group.getByName(InfName2))
  --trigger.action.activateGroup(Group.getByName(InfName3))
  --trigger.action.activateGroup(Group.getByName(InfName4))
  --trigger.action.activateGroup(Group.getByName(InfName5))
  --local MudGrpData = mist.getGroupData(MudName)

  for i = 1, 500 do
    if Task_Range == 1 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.25, mzone.radius * 0.10)
    elseif Task_Range == 2 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
    elseif Task_Range == 3 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.65, mzone.radius * 0.40)
    elseif Task_Range == 4 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.85, mzone.radius * 0.65)		
    elseif Task_Range == 5 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.00, mzone.radius * 0.85)	
    elseif Task_Range == 6 then
      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.25, mzone.radius * 1.05)
    end
    if mist.isTerrainValid(mudPsn, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 80) < 25 then				
      break
    end
  end

  local buildPsn = mist.utils.makeVec3(mudPsn)		
  local randomobjects = 0
  local randomobjects = mist.random(1,8)

  if randomobjects == 1 then
    local vars = {
      type = "Tech combine",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = {
      type = "Workshop A",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(300, 600),
      --name = "Strike2", 
      groupName = "Strike2",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
      type = "Repair workshop",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  elseif randomobjects == 2 then
    local vars = {
      type = "Supermarket A",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = {
      type = "Supermarket A",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(300, 600),
      --name = "Strike2", 
      groupName = "Strike2",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
      type = "Supermarket A",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  elseif randomobjects == 3 then
    local vars = {
    type = "TV tower",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = {
      type = "Supermarket A",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(300, 600),
      --name = "Strike2", 
      groupName = "Strike2",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
    type = "TV tower",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  elseif randomobjects == 4 then
    local vars = {
      type = "Tech combine",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = {
      type = "Sand Box",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(300, 600),
      --name = "Strike2", 
      groupName = "Strike2",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
      type = "Military staff",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  elseif randomobjects == 5 then
    local vars = {
      type = "Bunker",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = {
      type = "outpost",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(300, 600),
      --name = "Strike2", 
      groupName = "Strike2",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
      type = "Tech combine",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  elseif randomobjects == 6 then
      local vars = {
        type = "Tech combine",
        country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = {
    type = "outpost",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(300, 600),
      --name = "Strike2", 
      groupName = "Strike2",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
    type = "Military staff",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  elseif randomobjects == 7 then
    local vars = {
      type = "outpost",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = 
    {
    type = "Military staff",
    country = 'GEORGIA',
    category = "Fortifications", 
    x = buildPsn.x,
    y = buildPsn.z + math.random(300, 600),
    --name = "Strike2", 
    groupName = "Strike2",
    heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
      type = "Tech combine",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  elseif randomobjects == 8 then
    local vars = {
      type = "TV Tower",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(200,300),
      --name = "Strike1", 
      groupName = "Strike1",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars)
    local vars2 = {
      type = "TV Tower",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x,
      y = buildPsn.z + math.random(300, 600),
      --name = "Strike2", 
      groupName = "Strike2",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars2)
    local vars3 = {
      type = "Military staff",
      country = 'GEORGIA',
      category = "Fortifications", 
      x = buildPsn.x + math.random(300, 590),
      y = buildPsn.z + math.random(300,600),
      --name = "Strike3", 
      groupName = "Strike3",
      heading = 0.47123889803847
    }
    mist.dynAddStatic(vars3)
  end

  --type = "TV tower",			
  --type = "Supermarket A",			
  --type = "TV tower",			
  --type = "Military staff",			
  --type = "house2arm",			
  --type = "Tech combine",			
  --type = "Military staff",			 
  --type = "Bunker",			 
  --type = "outpost",
  --type = "Railway station",
  --type = "WC",
  --type = "Sandbox",
  --type = "house2arm",
  --type = "Workshop A",


  local msg = {}
    msg.text = ' Done.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
    
  local randomizer_disperse = 0
  local randomizer_radius = 0
  local randomizer_inner_radius = 0
  local randomizer_max_disperse = 0
    randomizer_disperse = 1
    randomizer_max_disperse = mist.random(275,325)
    randomizer_radius = mist.random(550,550)
    randomizer_inner_radius = 500

  local mvars = {}
    mvars.groupName = MudName
    mvars.action = "respawn"
    mvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = randomizer_max_disperse
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    MudNamed = mist.teleportToPoint(mvars)

    formisttable2 = '[g]' .. MudNamed	
    targets2 = mist.makeUnitTable({formisttable2})

    AddOP(MudNamed) -- add MBOT to it

  local mvars = {}
    mvars.groupName = SamName1
    mvars.action = "respawn"
    mvars.point = mudPsn
    mvars.disperse = randomizer_disperse 
    mvars.maxDisp = randomizer_max_disperse
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    SamName1 = mist.teleportToPoint(mvars)

  local infvars = {}
    infvars.groupName = InfName1
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = randomizer_disperse
    infvars.maxDisp = 225
    infvars.radius = randomizer_radius
    infvars.innerRadius = randomizer_inner_radius
    InfName1d = mist.teleportToPoint(infvars)


  local infvars = {}
    infvars.groupName = InfName2
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = randomizer_disperse
    infvars.maxDisp = 225
    infvars.radius = randomizer_radius
    infvars.innerRadius = randomizer_inner_radius
    InfName2d = mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName3
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = randomizer_disperse
    infvars.maxDisp = 225
    infvars.radius = randomizer_radius
    infvars.innerRadius = randomizer_inner_radius
    InfName3d = mist.teleportToPoint(infvars)


  local infvars = {}
    infvars.groupName = InfName4
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = randomizer_disperse
    infvars.maxDisp = 225
    infvars.radius = randomizer_radius
    infvars.innerRadius = randomizer_inner_radius
    InfName4d = mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName5
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = randomizer_disperse
    infvars.maxDisp = 225
    infvars.radius = randomizer_radius
    infvars.innerRadius = randomizer_inner_radius
    InfName5d = mist.teleportToPoint(infvars)		 

  local msg = {}
    msg.text = ' Post Inf.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

    --mist.spawnRandomizedGroup(MudName)
    --mist.spawnRandomizedGroup(MudName)
    --mist.spawnRandomizedGroup(InfName1)
    --mist.spawnRandomizedGroup(InfName2)
    --mist.spawnRandomizedGroup(InfName3)
    --mist.spawnRandomizedGroup(InfName4)
    --mist.spawnRandomizedGroup(InfName5)

  local msg = {}
    msg.text = ' Pre-Tele.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  local mvars = {}
    mvars.groupName = MudName
    mvars.action = "teleport"
    mvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = randomizer_max_disperse
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    MudName5d = mist.teleportToPoint(mvars)


  local mvars = {}
    mvars.groupName = SamName1
    mvars.action = "teleport"
    mvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = randomizer_max_disperse
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    SamName1d = mist.teleportToPoint(mvars)

  local infvars = {}
    infvars.groupName = InfName1
    infvars.action = "teleport"
    infvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = 100
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    InfName1d = mist.teleportToPoint(infvars)


  local infvars = {}
    infvars.groupName = InfName2
    infvars.action = "teleport"
    infvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = 100
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    InfName2d = mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName3
    infvars.action = "teleport"
    infvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = 100
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    InfName3d = mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName4
    infvars.action = "teleport"
    infvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = 100
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    InfName4d = mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName5
    infvars.action = "teleport"
    infvars.point = mudPsn
    infvars.disperse = randomizer_disperse
    infvars.maxDisp = 100
    infvars.radius = randomizer_radius
    infvars.innerRadius = randomizer_inner_radius
    InfName5d = mist.teleportToPoint(infvars)		
    
    mist.removeFunction(InfFunc1d)
    mist.removeFunction(InfFunc2d)
    mist.removeFunction(InfFunc3d)
    mist.removeFunction(InfFunc4d)
    mist.removeFunction(InfFunc5d)


  InfFunc1d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc1d = mist.scheduleFunction(Move_Infantry, {InfName1d}, randomizer_time, randomizer_time)

  InfFunc2d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc2d = mist.scheduleFunction(Move_Infantry, {InfName2d}, randomizer_time, randomizer_time)

  InfFunc3d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc3d = mist.scheduleFunction(Move_Infantry, {InfName3d}, randomizer_time, randomizer_time)

  InfFunc4d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc4d = mist.scheduleFunction(Move_Infantry, {InfName4d}, randomizer_time, randomizer_time)

  InfFunc5d = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc5d = mist.scheduleFunction(Move_Infantry, {InfName5d}, randomizer_time, randomizer_time)


  local msg = {}
    msg.text = ' Strike task has been created '
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing3.ogg')

  local Strike_Area = {}
    Strike_Area.x = mudPsn.x
    Strike_Area.y = mudPsn.y
    Strike_Area.z = mudPsn.z
    radius = 1000

    mist.flagFunc.mapobjs_dead_zones { zones = Strike_Area, flag = '601', req_num = 3, stopFlag =' 602'}
end

---------------------------------
-- End Strike Mission Function --
---------------------------------