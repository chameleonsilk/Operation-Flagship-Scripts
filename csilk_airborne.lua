-----------------------------
-- Fighter spawning arrays --
-----------------------------
-- This stuff is configurable, place the group down in editor and mirror its name here
-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from
Fighter_Names = 12 -- variable for number of available fighters

Fighter_Names_VeryEasy = {
  [1] = 'F-86 (Easy)',
  [2] = 'F-86 (Easy)',
  [3] = 'F-86 (Easy)',
  [4] = 'F-86 (Easy)',
  [5] = 'F-86 (Easy)',
  [6] = 'F-86 (Easy)',
  [7] = 'F-86 (Easy)',
  [8] = 'F-86 (Easy)',
  [9] = 'F-86 (Normal)',
  [10] = 'F-86 (Normal)',
  [11] = 'F-86 (Hard)',
  [12] = 'F-86 (VeryHard)',
}

Fighter_Names_Easy = {
  [1] = 'MiG-21 (Easy)',
  [2] = 'MiG-23 (Easy)',
  [3] = 'MiG-21 (Easy)',
  [4] = 'MiG-23 (Easy)',
  [5] = 'MiG-21 (Easy)',
  [6] = 'MiG-23 (Easy)',
  [7] = 'F-4E (Easy)',
  [8] = 'F-5E (Easy)',	
  [9] = 'F-4E (Easy)',
  [10] = 'F-5E (Easy)',	
  [11] = 'F-4E (Easy)',
  [12] = 'F-5E (Easy)',	
}

Fighter_Names_Normal = {
  [1] = 'MiG-21 (Normal)',
  [2] = 'MiG-23 (Normal)',
  [3] = 'MiG-21 (Hard)',
  [4] = 'MiG-23 (Hard)',
  [5] = 'F-4E (Normal)',
  [6] = 'F-5E (Normal)',	
  [7] = 'F-4E (Hard)',
  [8] = 'F-5E (Hard)',
  [9] = 'MiG-21 (Hard)',
  [10] = 'MiG-23 (Hard)',
  [11] = 'F-4E (Hard)',
  [12] = 'F-5E (Hard)',
}

Fighter_Names_Hard = {
  [1] = 'MiG-29S (Normal)',
  [2] = 'MiG-29S (Hard)',
  [3] = 'MiG-29A (Normal)',
  [4] = 'MiG-29A (Hard)',
  [5] = 'F-16C bl.52d (Normal)',
  [6] = 'MiG-25PD (Hard)',
  [7] = 'Su-27 (Normal)',
  [8] = 'Su-27 (Hard)',
  [9] = '2000-5 (Hard)',
  [10] = '2000-5 (VeryHard)',
  [11] = 'F-16C (Normal)',
  [12] = 'F-16C (Hard)',	
}

Fighter_Names_VeryHard = {
  [1] = 'MiG-29S (Hard)',
  [2] = 'MiG-29S (VeryHard)',
  [3] = 'MiG-29A (Hard)',
  [4] = 'MiG-29A (VeryHard)',
  [5] = 'F-16C bl.52d (Hard)',
  [6] = 'F-16C bl.52d (VeryHard)',
  [7] = 'Su-27 (VeryHard)',
  [8] = 'Su-27 (VeryHard)',
  [9] = 'Su-27 (VeryHard)',
  [10] = 'MiG-25PD (VeryHard)',
  [11] = 'F-16C (VeryHard)',
  [12] = 'Su-27 (Hard)',
}
------------------------
-- End Fighter Arrays --
------------------------
----------------------------
-- Bomber spawning arrays --
----------------------------
-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from
Bomber_Names = 2 --variable for number of availale fighters

Bomber_Names_Easy = {
  [1] = 'Tu-22M3 (Easy)',
  [2] = 'Su-24M (Easy)',
}
Bomber_Names_Normal = {
  [1] = 'Tu-22M3 (Normal)',
  [2] = 'Su-24M (Normal)',
}
Bomber_Names_Hard = {
  [1] = 'Tu-22M3 (Hard)',
  [2] = 'Su-24M (Hard)',
}
Bomber_Names_VeryHard = {
  [1] = 'Tu-22M3 (VeryHard)',
  [2] = 'Su-24M (VeryHard)',
}
------------------------
-- End Bomber Arrays --
------------------------
------------------------------------
-- Attacker plane spawning arrays --
------------------------------------
-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from

Attacker_Names = 4 -- variable for number of availale ground attackers

Attacker_Names_Easy = {
  [1] = 'Su-25T (BEasy)',
  [2] = 'Su-25 (BEasy)',
  [3] = 'MiG-27K (BEasy)',
  [4] = 'Su-17 (BEasy)',
}
Attacker_Names_Normal = {
  [1] = 'Su-25T (BNormal)',
  [2] = 'Su-25 (BNormal)',
  [3] = 'MiG-27K (BNormal)',
  [4] = 'Su-17 (BNormal)',
}
Attacker_Names_Hard = {
  [1] = 'Su-25T (BHard)',
  [2] = 'Su-25 (BHard)',
  [3] = 'MiG-27K (BHard)',
  [4] = 'Su-17 (BHard)',
}
Attacker_Names_VeryHard = {
  [1] = 'Su-25T (BVeryHard)',
  [2] = 'Su-25 (BVeryHard)',
  [3] = 'MiG-27K (BVeryHard)',
  [4] = 'Su-17 (BVeryHard)',
}
------------------------------
-- End Ground Attack Arrays --
-----------------------------

-------------------------
-- CAS spawning arrays --
-------------------------
-- The following arrays contain available enemy aircraft the Spawn CAS function pulls from
CAS_Planes = {
  [1] = 'Tornado GR4 #1',
  [2] = 'Tornado IDS #1',
}

------------------------
-- End CAS Arrays --
------------------------

-- End of editables --
-- Do not edit below --
--------------------------------------
-- csilk Fighter Intercept Function --
--------------------------------------
-- Usage, csilk_Fighter_Intercept(triggerZone)
-- Example, csilk_Fighter_Intercept('Anapa')

function csilk_Fighter_Intercept(_location)
	  local msg = {} 
    msg.text = ' csilk_Fighter_Intercept Function'
    msg.displayTime = 10
    msg.msgFor = {coa = {'all'}} 
    msg.fileName = 'airtask.ogg'
    mist.message.add(msg)
    local msg = {} 
    msg.text = ' '
    msg.displayTime = 10
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)
  
   local triggerzone = _location
   local zone = trigger.misc.getZone(triggerzone)
   
    local msg = {} 
    msg.text = ' Triggerzone: ' ..tostring(_location)
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)
  
  local msg = {} 
    msg.text = ' Difficulty: '
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)
 
  local msg = {} 
    msg.text = ' Distance: ' ..tostring(Task_Range)
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)
  
  local rand = mist.random(1,Fighter_Names)
  local msg = {} 
    msg.text = ' Diceroll: ' ..rand
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)
  
  local grpName = {}  
  local spawnPsn = {}
   
  -- global to declare that fighter task is commencing.
  intercepttask = 1       
  --

  if Difficultymod == 1 then
    grpName = Fighter_Names_VeryEasy[rand]
  end

  if Difficultymod == 2 then
    grpName = Fighter_Names_Easy[rand]
  end

  if Difficultymod == 3 then
    grpName = Fighter_Names_Normal[rand]
  end

  if Difficultymod == 4 then
    grpName = Fighter_Names_Hard[rand]
  end

  if Difficultymod == 5 then
    grpName = Fighter_Names_VeryHard[rand]
  end

  
  local msg = {} 
    msg.text = ' Assigning plane to spawn ' ..tostring(grpName)
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}} 
  mist.message.add(msg)
    
  

  if Task_Range == 1 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 0.75, zone.radius * 0.40)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
  end

  if Task_Range == 2 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.00, zone.radius * 0.75)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
  end

  if Task_Range == 3 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.25, zone.radius * 1.00)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
  end

  if Task_Range == 4 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.50, zone.radius * 1.25)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
  end

  if Task_Range == 5 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.75, zone.radius * 1.50)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
  end

  if Task_Range == 6 then
    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 2.00, zone.radius * 1.75)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
  end
  
    local msg = {} 
    msg.text = ' Located spawning position.'
    msg.displayTime = 5
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)
  
  trigger.action.activateGroup(Group.getByName(grpName))
  grp = Group.getByName(grpName)

  local InitwpSpeed = mist.random(600,700)
  local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
  local wpAlt = mist.random(5000,8000)
  local wpPsn = mist.getRandPointInCircle(spawnPsn, zone.radius * 0.15, zone.radius * 0.01)
  local wpPsn2 = mist.getRandPointInCircle(spawnPsn, zone.radius * 2.00, zone.radius * 1.50)
  local path = {}
  path[1] = mist.fixedWing.buildWP(spawnPsn, wpSpeed, wpAlt, "BARO")
  path[2] = mist.fixedWing.buildWP(wpPsn, wpSpeed, wpAlt, "BARO")
  path[3] = mist.fixedWing.buildWP(wpPsn2, wpSpeed, wpAlt,"BARO")
  path[1].task = {
    id = "ComboTask",
    params = {
      tasks = {
        [1] = {
          number = 1,
          auto = true,
          id = "EngageTargets",
          enabled = true,
          key = "CAP",
          params = {
          targetTypes = {
            [1] = "Air",
          }, -- end of targetTypes
          priority = 0,
          }, -- end of params
        }, -- end of [1]
        [2] = {
          number = 2,
          auto = false,
          id = "Orbit",
          enabled = true,
          params = {
            altitudeEdited = false,
            pattern = "Race-Track",
            speed = wpSpeed,
            altitude = wpAlt,
            speedEdited = true,
          }, -- end of params
        }, -- end of [2]
        [3] = {
          enabled = true,
          auto = false,
          id = "WrappedAction",
          number = 1,
          params = {
            action = {
              id = "Option",
              params = {
                value = false,
                name = 6,
              }, -- end of params
            }, -- end of action
          }, -- end of params
        }, -- end of [3]
      }, -- end of tasks
    } -- end of params
  }

  local vars = {} 
  vars.groupName = grpName
  vars.action = "respawn"
  vars.point = spawnPsn
  vars.route = path
  mist.teleportToPoint(vars)			

  --loops_through = loops_through + 1	

  --local vars = {} 
  --vars.groupName = grpName
  --vars.action = "clone"
  --vars.point = spawnPsn
  --vars.route = path
  --mist.teleportToPoint(vars)			

  local con = grp:getController()
    con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
    con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
    con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
    con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
    con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)

  local msg = {} 
    msg.text = ' Intercept task has been created, search and destroy target.'
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  --checkunits4 = {
   -- groupName = grpName,
   -- percent = Percentagemod,
   -- flag = '401',
   -- stopFlag = '402',
   -- toggle = true,
  --}
    --mist.flagFunc.group_alive_less_than(checkunits4)
    trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')
end

------------------------------------
-- End Fighter Intercept Function --
------------------------------------
--
--------------------------------
-- Bomber Intercept Function --
-------------------------------
-- Usage, csilk_Bomber_Intercept(triggerZone)
-- Example, csilk_Bomber_Intercept('Anapa')
function csilk_Bomber_Intercept(_bArea)
  local bzone = trigger.misc.getZone(_bArea)
  bombertask = 1
  local bspawnPsn = {}
  local espawnPsn = {}
  local bpath = {}
  local epath = {}

  if _bArea == 'Anapa' then
    RunwayID = 12
  end

  if _bArea == 'Maykop' then
    RunwayID = 16
  end

  if _bArea == 'Gudauta' then
    RunwayID = 21
  end

  if _bArea == 'Kutaisi' then
  RunwayID = 25
  end

  if _bArea == 'Nalchik' then
    RunwayID = 27
  end

  if _bArea == 'Tbilisi' then
    RunwayID = 30
  end

  --0 Airdrome_0
  --1Khersones
  --2 Saki
  --3Simpheropol
  --4 Razdolnoe
  --5 Dzhankoy
  --6 Kirovskoe
  --7 Kerch
  --8 Belbek
  --9 Krasnogvardeyskoye
  --10 Octyabrskoe
  --11 Gvardeyskoe
  --12 Anapa
  --13 Krasnodar
  --14 Novorossiysk
  --15 Krymsk
  --16 Maykop
  --17 Gelendzhik
  --18 Sochi
  --19 Krasnodar_P
  --20 Sukhumi
  --21 Gudauta
  --22 Batumi
  --23 Tskhakaya
  --24 Kobuleti
  --25 Kutaisi
  --26 MinVody
  --27 Nalchik
  --28 Mozdok
  --29 Lochini
  --30 TbilisiMilitary
  --31 Vaziani
  --32 Beslan

  local brand = mist.random(1,2)
  local erand = mist.random(1,Fighter_Names)

  if Difficultymod == 1 then
    bgrpName = Bomber_Names_Easy[brand]
    egrpName = Fighter_Names_VeryEasy[erand]
  end

  if Difficultymod == 2 then
    bgrpName = Bomber_Names_Normal[brand]
    egrpName = Fighter_Names_Easy[erand]
  end

  if Difficultymod == 3 then
    bgrpName = Bomber_Names_Hard[brand]
    egrpName = Fighter_Names_Normal[erand]
  end

  if Difficultymod == 4 then
    bgrpName = Bomber_Names_VeryHard[brand]
    egrpName = Fighter_Names_Hard[erand]
  end

  if Difficultymod == 5 then
    bgrpName = Bomber_Names_VeryHard[brand]
    egrpName = Fighter_Names_VeryHard[erand]
  end

  if Task_Range == 1 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.70, bzone.radius * 0.50)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.50, bzone.radius * 0.35)
  end

  if Task_Range == 2 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.00, bzone.radius * 0.80)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.80, bzone.radius * 0.60)
  end

  if Task_Range == 3 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.25, bzone.radius * 0.90)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.90, bzone.radius * 0.75)
  end

  if Task_Range == 4 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.50, bzone.radius * 1.25)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.25, bzone.radius * 1.00)
  end

  if Task_Range == 5 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.75, bzone.radius * 1.50)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.50, bzone.radius * 1.25)
  end

  if Task_Range == 6 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
    bspawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 2.00, bzone.radius * 1.75)
    espawnPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 1.75, bzone.radius * 1.50)
  end

  trigger.action.activateGroup(Group.getByName(bgrpName))

  local bInitwpSpeed = mist.random(525,625)
  local bwpSpeed = mist.utils.kmphToMps(bInitwpSpeed)
  local bwpAlt = mist.random(6100,9000)
  local bwpPsn = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.50, bzone.radius * 0.35)
  local bwpPsn2 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.02, bzone.radius * 0.01)
  local bwpPsn3 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.25, bzone.radius * 0.15)
  local bwpPsn4 = mist.getRandPointInCircle(bzone.point, bzone.radius * 0.35, bzone.radius * 0.15)
  local bwpPsn5 = mist.getRandPointInCircle(bzone.point, bzone.radius * 2.00, bzone.radius * 1.99)

  trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')			

  bpath[1] = mist.fixedWing.buildWP(bspawnPsn, bwpSpeed, bwpAlt, "BARO")			-- altitude and speed reversed.
  bpath[2] = mist.fixedWing.buildWP(bwpPsn, bwpSpeed, bwpAlt, "BARO")		
  bpath[3] = mist.fixedWing.buildWP(bwpPsn2, bwpSpeed, bwpAlt, "BARO")
  bpath[4] = mist.fixedWing.buildWP(bwpPsn3, bwpSpeed, bwpAlt, "BARO")
  bpath[5] = mist.fixedWing.buildWP(bwpPsn4, bwpSpeed, bwpAlt, "BARO")
  bpath[6] = mist.fixedWing.buildWP(bwpPsn5, bwpSpeed, bwpAlt, "BARO")	

  --bpath[3].task = {}
  bpath[3].task = {
    id = "ComboTask",
    params = {
      tasks = {
        [1] = {
          number = 1,
          auto = false,
          id = "BombingRunway",
          enabled = true,
          params = {
            altitudeEnabled = false,
            attackQtyLimit = false,
            attackQty = 1,
            expend = "Auto",
            altitude = 3750,
            directionEnabled = false,
            groupAttack = true,
            runwayId = RunwayID,
            weaponType = 1073741822,
            direction = 0,
          }, -- end of params
        }, -- end of [1]
        [2] =  {
          enabled = true,
          auto = false,
          id = "WrappedAction",
          number = 1,
          params =  {
            action = {
              id = "Option",
              params = {
                value = false,
                name = 6,
              },-- end of params
            }, -- end of action
          }, -- end of params
        }, -- end of [2]
      }, -- end of tasks
    } -- end of params
  }	
	
  bpath[1].ETA_locked = false
  bpath[1].speed_locked = true
  bpath[2].ETA_locked = false
  bpath[2].speed_locked = true
  bpath[3].ETA_locked = false
  bpath[3].speed_locked = true
  bpath[4].ETA_locked = false
  bpath[4].speed_locked = true
  bpath[5].ETA_locked = false
  bpath[5].speed_locked = true
  bpath[6].ETA_locked = false
  bpath[6].speed_locked = true

  local bvars = {} 
    bvars.groupName = bgrpName
    bvars.action = "respawn"
    bvars.point = bspawnPsn
    bvars.route = bpath
    mist.teleportToPoint(bvars)

    bgrp = Group.getByName(bgrpName)

  local bcon = bgrp:getController()
    bcon:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
    bcon:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
    bcon:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE)
    bcon:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.PASSIVE_DEFENCE)
    bcon:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.WHEN_FLYING_NEAR_ENEMIES)

    BomberID = bgrp:getID()
    trigger.action.activateGroup(Group.getByName(egrpName))

  local eInitwpSpeed = mist.random(700,900)
  local ewpSpeed = mist.utils.kmphToMps(eInitwpSpeed)
  local ewpAlt = mist.random(2000,6000)

  epath[1] = mist.fixedWing.buildWP(bspawnPsn, ewpSpeed, ewpAlt, "BARO")
  epath[2] = mist.fixedWing.buildWP(bwpPsn, ewpSpeed, ewpAlt, "BARO")
  epath[3] = mist.fixedWing.buildWP(bwpPsn5, ewpSpeed, ewpAlt, "BARO")

  epath[1].task = {
    id = "ComboTask",
    params = {
      tasks = {
        [1] = {
          number = 1,
          auto = true,
          id = "EngageTargets",
          enabled = true,
          key = "CAP",
          params = {
            targetTypes = {
              [1] = "Air",
            }, -- end of targetTypes
            priority = 0
          }, -- end of params
        }, -- end of [1]
        [2] = {
          number = 2,
          auto = false,
          id = "Follow",
          enabled = true,
          params = {
            lastWptIndexFlagChangedManually = true,
            groupId = BomberID,
            lastWptIndexFlag = false,
            pos = {
              y = -500,
              x = -200,
              z = 0,
            }, -- end of ["pos"]
          }, -- end of ["params"]
        }, -- end of [2]
        [3] = {
          enabled = true,
          auto = false,
          id = "WrappedAction",
          number = 3,
          params = {
            action = {
              id = "Option",
              params = {
                value = false,
                name = 6,
              }, -- end of params
            }, -- end of action
          }, -- end of params
        }, -- end of 3
      }, -- end of tasks
    } -- end of params
  }
  
  --epath[1].ETA_locked = false
  --epath[1].speed_locked = true
  --epath[2].ETA_locked = false
  --epath[2].speed_locked = true
  --epath[3].ETA_locked = false
  --epath[3].speed_locked = true


  local evars = {}
    evars.groupName = egrpName
    evars.action = "respawn"
    evars.point = bspawnPsn
    evars.route = epath
    mist.teleportToPoint(evars)

    egrp = Group.getByName(egrpName)

  local econ = egrp:getController()
    econ:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
    econ:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
    econ:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
    econ:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
    econ:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)

  local msg = {}
    msg.text = ' Choosing from interceptor list. Plane number  '..tostring(brand)..tostring(bgrpName)..tostring(_bArea)
    msg.displayTime = 10
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  local msg = {}
    msg.text = ' Choosing from escort list. Plane number  '..tostring(erand)..tostring(egrpName)..tostring(_bArea)
    msg.displayTime = 10
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  local msg = {}
    msg.text = ' Bomber intercept task has been created. '
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  local msg = {}
    msg.text = ' Escort is following  '..tostring(BomberID)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
    --end -- break for loop



  --local checkunits5 = {
   -- groupName = bgrpName,
   -- percent = Percentagemod,
   -- flag = '501',
   -- stopFlag = '502',
   -- toggle = true,
  --}
    --mist.flagFunc.group_alive_less_than(checkunits5)
--return
end
-----------------------------------
-- End Bomber Intercept Function --
-----------------------------------