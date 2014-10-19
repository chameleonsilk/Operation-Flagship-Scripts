-----------------------------------
-- Airfield task spawning arrays --
-----------------------------------

-- Names of the groups used for airfield attack tasks
-------------------------
-- Sochi Airfield Task --
-------------------------
Sochi_Names_VeryEasy = {
  [1] = 'Sochi Airfield (Easy) #000',
}
Sochi_Names_Easy = {
  [1] = 'Sochi Airfield (Easy) #000',
}
Sochi_Names_Normal = {
  [1] = 'Sochi Airfield (Normal) #000',
}
Sochi_Names_Hard = {
  [1] = 'Sochi Airfield (Hard) #000',
}
Sochi_Names_VeryHard = {
  [1] = 'Sochi Airfield (VeryHard) #000',
}
---------------------
--End Sochi Arrays --
---------------------
---------------------------------------
-- End airfield task spawning arrays --
---------------------------------------

-------------------------------------
-- Spawn Airfield Assault Function --
-------------------------------------
-- This portion of the script borrows heavily from Kutaisi Intercept script by akp.
-- Much of the functionality has been modified
function csilk_Airfield(_afArea)
  mzone = trigger.misc.getZone(_afArea)
  airfield = 1

  --trigger.action.deactivateGroup(Group.getByName(InfName))
  AFName1 = 'Infantry (Airdrome) #000'
  AFName2 = 'Infantry (Airdrome) #001'
  AFName3 = 'Infantry (Airdrome) #002'
  AFName4 = 'Infantry (Airdrome) #003'
  DefensesNames = ""
  airdromePsn = {}

  --if MudName ==  then
  local msg = {}
    msg.text = ' Creating Airfield Defenses at ' ..tostring(_afArea)
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

  if _afArea == 'Sochi' then
    if Difficultymod == 1 then
      DefensesName = Sochi_Names_Easy[1]
      airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
      airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
    end
    if Difficultymod == 2 then
      DefensesName = Sochi_Names_Easy[1]
      airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
      airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
    end
    if Difficultymod == 3 then
      DefensesName = Sochi_Names_Normal[1]
      airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
      airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
    end
    if Difficultymod == 4 then
      DefensesName = Sochi_Names_Hard[1]
      airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
      airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
    end
    if Difficultymod == 5 then
      DefensesName = Sochi_Names_VeryHard[1]
      airdromePsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn2 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.60, mzone.radius * 0.45)
      airdromePsn4 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
      airdromePsn3 = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.40, mzone.radius * 0.25)
    end
    else
      local msg = {}
      msg.text = ' Bad Airfield Name'
      msg.displayTime = 5
      msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
    return
  end

  trigger.action.activateGroup(Group.getByName(DefensesName))

  formisttable4 = '[g]' .. MudNameb
  targets4 = mist.makeUnitTable({formisttable4})

  AddOP(MudNameb) -- add MBOT to it

  mist.respawnGroup(DefensesName)
  mist.spawnRandomizedGroup(DefensesName)

  local infvars = {}
    infvars.groupName = AFName1
    infvars.action = "respawn"
    infvars.point = airdromePsn
    --infvars.disperse = true
    --infvars.maxDisp = 10
    --infvars.radius = 20
    mist.teleportToPoint(infvars)
  local infvars = {}
    infvars.groupName = AFName2
    infvars.action = "respawn"
    infvars.point = airdromePsn2
    --infvars.disperse = true
    --infvars.maxDisp = 10
    --infvars.radius = 20
    mist.teleportToPoint(infvars)
  local infvars = {}
    infvars.groupName = AFName3
    infvars.action = "respawn"
    infvars.point = airdromePsn3
    --infvars.disperse = true
    --infvars.maxDisp = 10
    --infvars.radius = 20
    mist.teleportToPoint(infvars)
  local infvars = {}
    infvars.groupName = AFName4
    infvars.action = "respawn"
    infvars.point = airdromePsn4
    --infvars.disperse = true
    --infvars.maxDisp = 10
    --infvars.radius = 20
    mist.teleportToPoint(infvars)
  local msg = {}
    msg.text = ' Created airfield task'
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing.ogg')
  --local checkunits1 = {
   -- groupName = DefensesName,
   -- percent = Percentagemod,
   -- flag = '101',
   -- stopFlag = '102',
   -- toggle = true,
 -- }
 -- mist.flagFunc.group_alive_less_than(checkunits1)
  mist.removeFunction(AFFunc1)
  mist.removeFunction(AFFunc2)
  mist.removeFunction(AFFunc3)
  mist.removeFunction(AFFunc4)

  local randomizer_time = 0
    randomizer_time = mist.random(45,90)

  AFFunc1 = nil
    AFFunc1 = mist.scheduleFunction(Move_Infantry, {AFName1}, randomizer_time, randomizer_time) 

  AFFunc2 = nil
    AFFunc2 = mist.scheduleFunction(Move_Infantry, {AFName2}, randomizer_time, randomizer_time) 

  AFFunc3 = nil
    AFFunc3 = mist.scheduleFunction(Move_Infantry, {AFName3}, randomizer_time, randomizer_time) 

  AFFunc4 = nil
    AFFunc4 = mist.scheduleFunction(Move_Infantry, {AFName4}, randomizer_time, randomizer_time) 
end
-------------------------------------
-- EndA field Assault Function --
-------------------------------------