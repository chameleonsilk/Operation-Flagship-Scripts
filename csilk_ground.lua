-----------------------
-- Static MUD Arrays --
-----------------------
Mud_Names = 2 -- variable for number of availale MUD Per Difficulty

Mud_VeryEasy = {
  [1] = "Mud (VeryEasy) #000",
  [2] = "Mud (VeryEasy) #001",
}
Mud_Easy = {
  [1] = "Mud (Easy) #000",
  [2] = "Mud (Easy) #001",
}
Mud_Normal = {
  [1] = "Mud (Normal) #000",
  [2] = "Mud (Normal) #001",
}
Mud_Hard = {
  [1] = "Mud (Hard) #000",
  [2] = "Mud (Hard) #001",
}
Mud_VeryHard = {
  [1] = "Mud (VeryHard) #000",
  [2] = "Mud (VeryHard) #001",
}
---------------------------
-- End Static MUD Arrays --
---------------------------
-----------------------------
--Iinfantry spawning array --
-----------------------------

Infantry_Squads = 5

Infantry_VeryEasy = {
  [1] = 'Infantry (VeryEasy) #000',
  [2] = 'Infantry (VeryEasy) #001',
  [3] = 'Infantry (VeryEasy) #002',
  [4] = 'Infantry (VeryEasy) #003',
  [5] = 'Infantry (VeryEasy) #004',
}
Infantry_Easy = {
  [1] = 'Infantry (Easy) #000',
  [2] = 'Infantry (Easy) #001',
  [3] = 'Infantry (Easy) #002',
  [4] = 'Infantry (Easy) #003',
  [5] = 'Infantry (Easy) #004',
}
Infantry_Normal = {
  [1] = 'Infantry (Normal) #000',
  [2] = 'Infantry (Normal) #001',
  [3] = 'Infantry (Normal) #002',
  [4] = 'Infantry (Normal) #003',
  [5] = 'Infantry (Normal) #004',
}
Infantry_Hard = {
  [1] = 'Infantry (Hard) #000',
  [2] = 'Infantry (Hard) #001',
  [3] = 'Infantry (Hard) #002',
  [4] = 'Infantry (Hard) #003',
  [5] = 'Infantry (Hard) #004',
}
Infantry_VeryHard = {
  [1] = 'Infantry (VeryHard) #000',
  [2] = 'Infantry (VeryHard) #001',
  [3] = 'Infantry (VeryHard) #002',
  [4] = 'Infantry (VeryHard) #003',
  [5] = 'Infantry (VeryHard) #004',
}

---------------------------------
-- End Infantry spawning array --
---------------------------------
-----------------------
-- Moving MUD Arrays --
-----------------------

Mud_Convoys = 2 -- variable for number of availale Moving MUD Per Difficulty

Mud_Convoy_VeryEasy = {
  [1] = "Mud Convoy (VeryEasy) #000",
  [2] = "Mud Convoy (VeryEasy) #001",
}
Mud_Convoy_Easy = {
  [1] = "Mud Convoy (Easy) #000",
  [2] = "Mud Convoy (Easy) #001",
}
Mud_Convoy_Normal = {
  [1] = "Mud Convoy (Normal) #000",
  [2] = "Mud Convoy (Normal) #001",
}
Mud_Convoy_Hard = {
  [1] = "Mud Convoy (Hard) #000",
  [2] = "Mud Convoy (Hard) #001",
}
Mud_Convoy_VeryHard = {
  [1] = "Mud Convoy (VeryHard) #000",
  [2] = "Mud Convoy (VeryHard) #001",
}
---------------------------
-- End Moving MUD Arrays --
---------------------------

------------------------
-- Spawn Mud Function --
------------------------
-- Usage, csilk_Mud(triggerZone)
-- Example, csilk_Mud('Anapa')
function csilk_Mud(_mArea)
  local mzone = trigger.misc.getZone(_mArea)
  local mrand = mist.random(1,Mud_Names)
  mudtask = 1
   
  --trigger.action.deactivateGroup(Group.getByName(InfName))
  local MudName = {}
  local MudNameb = {}
  local InfName1 = {}
  local InfName2 = {}
  local InfName3 = {}
  local InfName4 = {}
  local InfName5 = {}
  local InfName1c = {}
  local InfName2c = {}
  local InfName3c = {}
  local InfName4c = {}
  local InfName5c = {}

  local msg = {}
    msg.text = ' Creating Mud.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

  if Difficultymod == 1 then
    MudName = Mud_VeryEasy[mrand]
    InfName1 = Infantry_VeryEasy[1]
    InfName2 = Infantry_VeryEasy[2]
    InfName3 = Infantry_VeryEasy[3]
    InfName4 = Infantry_VeryEasy[4]
    InfName5 = Infantry_VeryEasy[5]
  end

  if Difficultymod == 2 then
    MudName = Mud_Easy[mrand]
    InfName1 = Infantry_Easy[1]
    InfName2 = Infantry_Easy[2]
    InfName3 = Infantry_Easy[3]
    InfName4 = Infantry_Easy[4]
    InfName5 = Infantry_Easy[5]
  end

  if Difficultymod == 3 then
    MudName = Mud_Normal[mrand]
    InfName1 = Infantry_Normal[1]
    InfName2 = Infantry_Normal[2]
    InfName3 = Infantry_Normal[3]
    InfName4 = Infantry_Normal[4]
    InfName5 = Infantry_Normal[5]
  end

  if Difficultymod == 4 then
    MudName = Mud_Hard[mrand]
    InfName1 = Infantry_Hard[1]
    InfName2 = Infantry_Hard[2]
    InfName3 = Infantry_Hard[3]
    InfName4 = Infantry_Hard[4]
    InfName5 = Infantry_Hard[5]
  end

  if Difficultymod == 5 then
    MudName = Mud_VeryHard[mrand]
    InfName1 = Infantry_VeryHard[1]
    InfName2 = Infantry_VeryHard[2]
    InfName3 = Infantry_VeryHard[3]
    InfName4 = Infantry_VeryHard[4]
    InfName5 = Infantry_VeryHard[5]
  end


  --local checkunits2 = {
   -- groupName = MudName,
   -- percent = Percentagemod,
   -- flag = '201',
   -- stopFlag = '202',
   -- toggle = true,
  --}
 --   mist.flagFunc.group_alive_less_than(checkunits2)



  --trigger.action.activateGroup(Group.getByName(MudName))
  --trigger.action.activateGroup(Group.getByName(InfName1))
  --trigger.action.activateGroup(Group.getByName(InfName2))
  --trigger.action.activateGroup(Group.getByName(InfName3))
  --trigger.action.activateGroup(Group.getByName(InfName4))
  --trigger.action.activateGroup(Group.getByName(InfName5))
  local MudGrpData = mist.getGroupData(MudName)



  for i = 1, 100 do
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
    if mist.isTerrainValid(mudPsn, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 19) < 2 then				
      break
    end
  end

  local mvars = {}
    mvars.groupName = MudName
    mvars.action = "respawn"
    mvars.point = mudPsn
    --mvars.disperse = true
    --mvars.maxDisp = 100
    --mvars.radius = 20
    MudNamec = mist.teleportToPoint(mvars)
    formisttable = '[g]' .. MudNamec
    targets = mist.makeUnitTable({formisttable})
    AddOP(MudNamec) -- add MBOT to it



  local infvars = {}
    infvars.groupName = InfName1
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 100
    infvars.radius = 100
    infvars.innerRadius = 70
    InfName1c = mist.teleportToPoint(infvars)

    --mist.spawnRandomizedGroup(InfName1)

  local infvars = {}
    infvars.groupName = InfName2
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 100
    infvars.radius = 100
    infvars.innerRadius = 70
    InfName2c = mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName3
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 100
    infvars.radius = 100
    infvars.innerRadius = 70
    InfName3c = mist.teleportToPoint(infvars)


  local infvars = {}
    infvars.groupName = InfName4
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 100
    infvars.radius = 100
    infvars.innerRadius = 70
    InfName4c =  mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName5
    infvars.action = "respawn"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 100
    infvars.radius = 100
    infvars.innerRadius = 70
    InfName5c = mist.teleportToPoint(infvars)		  

    --mist.spawnRandomizedGroup(MudName)
    --mist.spawnRandomizedGroup(InfName1)
    --mist.spawnRandomizedGroup(InfName2)
    --mist.spawnRandomizedGroup(InfName3)
    --mist.spawnRandomizedGroup(InfName4)
    --mist.spawnRandomizedGroup(InfName5)

  local randomizer_disperse = 0
  local randomizer_radius = 0
  local randomizer_inner_radius = 0
  local randomizer_max_disperse = 0
  local use_randomizer = 0
    --use_randomizer = mist.random(0,1)
    randomizer_disperse = mist.random(0,1)
    randomizer_max_disperse = mist.random(220,320)
    randomizer_radius = mist.random(220,280)
    randomizer_inner_radius = mist.random(200,220)

  --if use_randomizer == 1 then
  local mvars = {}
    mvars.groupName = MudName
    mvars.action = "teleport"
    mvars.point = mudPsn
    mvars.disperse = randomizer_disperse
    mvars.maxDisp = randomizer_max_disperse
    mvars.radius = randomizer_radius
    mvars.innerRadius = randomizer_inner_radius
    MudNamec = mist.teleportToPoint(mvars)




  local infvars = {}
    infvars.groupName = InfName1
    infvars.action = "teleport"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 25
    infvars.radius = 400
    infvars.innerRadius = 360
    InfName1c = mist.teleportToPoint(infvars)

    --mist.spawnRandomizedGroup(InfName1)

  local infvars = {}
    infvars.groupName = InfName2
    infvars.action = "teleport"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 25
    infvars.radius = 300
    infvars.innerRadius = 270
    InfName2c = mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName3
    infvars.action = "teleport"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 25
    infvars.radius = 300
    infvars.innerRadius = 270
    InfName3c= mist.teleportToPoint(infvars)


  local infvars = {}
    infvars.groupName = InfName4
    infvars.action = "teleport"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 25
    infvars.radius = 300
    infvars.innerRadius = 270
    InfName4c =  mist.teleportToPoint(infvars)

  local infvars = {}
    infvars.groupName = InfName5
    infvars.action = "teleport"
    infvars.point = mudPsn
    infvars.disperse = true
    infvars.maxDisp = 25
    infvars.radius = 300
    infvars.innerRadius = 270
    InfName5c = mist.teleportToPoint(infvars)		    



  local msg = {}
    msg.text = ' Mud task has been created ' ..tostring(MudName)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

    mist.removeFunction(InfFunc1c)
    mist.removeFunction(InfFunc2c)
    mist.removeFunction(InfFunc3c)
    mist.removeFunction(InfFunc4c)
    mist.removeFunction(InfFunc5c)



  InfFunc1c = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc1c = mist.scheduleFunction(Move_Infantry, {InfName1c}, randomizer_time, randomizer_time)

  InfFunc2c = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc2c = mist.scheduleFunction(Move_Infantry, {InfName2c}, randomizer_time, randomizer_time)

  InfFunc3c = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc3c = mist.scheduleFunction(Move_Infantry, {InfName3c}, randomizer_time, randomizer_time)

  InfFunc4c = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc4c = mist.scheduleFunction(Move_Infantry, {InfName4c}, randomizer_time, randomizer_time)

  InfFunc5c = nil
  local randomizer_time = 0
    randomizer_time = mist.random(45,90)
    InfFunc5c = mist.scheduleFunction(Move_Infantry, {InfName5c}, randomizer_time, randomizer_time)

    trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing4.ogg')

  --Make_Smoke(mzone, nil)
  --return
end

----------------------------
-- End Spawn Mud Function --
----------------------------


---------------------------------------
-- Spawn Mud Convoy Mission Function --
---------------------------------------

-- This portion of the script borrows heavily from Kutaisi Intercept script by akp.
-- Much of the functionality has been modified
function csilk_Convoy(_mArea)
  mzone = trigger.misc.getZone(_mArea)
  local mrand = mist.random(1,Mud_Convoys)
  convoytask = 1

  --local MudName = ""
  local ConvoySend = {}

  local msg = {}
    msg.text = ' Creating Moving Mud.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

  if Difficultymod == 1 then
    MudName = Mud_Convoy_VeryEasy[mrand]
  end

  if Difficultymod == 2 then
    MudName = Mud_Convoy_Easy[mrand]
  end

  if Difficultymod == 3 then
    MudName = Mud_Convoy_Normal[mrand]
  end

  if Difficultymod == 4 then
    MudName = Mud_Convoy_Hard[mrand]
  end

  if Difficultymod == 5 then
    MudName = Mud_Convoy_VeryHard[mrand]
  end

  --trigger.action.activateGroup(Group.getByName(MudName))
  --local MudGrpData = mist.getGroupData(MudName)

  for i = 1, 100 do
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
    if mist.isTerrainValid(mudPsn, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 19) < 2  then				
      break
    end
  end
  
  --mist.spawnRandomizedGroup(MudName)
  
  local mvars = {}	
    mvars.groupName = MudName
    mvars.action = "respawn"
    mvars.point = mudPsn
    --mvars.disperse = true
    --mvars.maxDisp = 100
    --mvars.radius = 20
    MudNameb = mist.teleportToPoint(mvars)

  local mvars = {}
    mvars.groupName = MudName
    mvars.action = "teleport"
    mvars.point = mudPsn
    --mvars.disperse = true
    --mvars.maxDisp = 100
    --mvars.radius = 20
    MudNameb = mist.teleportToPoint(mvars)
    formisttable3 = '[g]' .. MudNameb
    targets3 = mist.makeUnitTable({formisttable3})
    AddOP(MudNameb) -- add MBOT to it

    MoveMud = MudNameb
    --mist.removeFunction(ConvoyFunc)
    ConvoyFunc = nil
    ConvoyFunc = mist.scheduleFunction(Move_Convoy, {MudNameb}, 5, 300) 
    trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing.ogg')
    --Make_Smoke(mudPsn, nil)
  --return

  local checkunits3 = {
    groupName = MudNameb,
    percent = Percentagemod,
    flag = '301',
    stopFlag = '302',
    --toggle = true,
    }
    mist.flagFunc.group_alive_less_than(checkunits3)

  local msg = {}
    msg.text = ' Convoy has been created.' ..tostring(MudNameb)
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
end

---------------------------------------
-- End Mud Convoy Mission Function --
---------------------------------------