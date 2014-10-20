 --[[
 
Operation Flagship Script
Written By : Chameleon_Silk
Contributions By : Wankerpants

Copyright (C) <2014>  <Chameleon_Silk>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

]]
-- local variables defining radio options for mission briefings displayed name
local rad_option_0a = "Briefing: Last Mud"
local rad_option_0b = "Briefing: Last Strike"
local rad_option_0c = "Briefing: Last Convoy"
local rad_option_0d = "Briefing: Last Airdrome"
local rad_option_0e = "Briefing: Last Naval"
-- local variabls defining radio options for selecting specific missions/missions types displayed name
local rad_option_1a = "Interdict: CAP"
local rad_option_1b = "Interdict: Bombers"
local rad_option_1c = "Escort: BARCAP (NOT AVAILABLE)"
local rad_option_1d = "Mud: Fortified"
local rad_option_1e = "Mud: Convoy"
local rad_option_1f = "Mud: CAS (NOT AVAILABLE)"
local rad_option_1g = "Strike: Facilities"
local rad_option_1h = "Strike: Naval"
-- local variable defining radio option for Airport Assault mission types displayed name
local rad_option_2a = "Assault: Sochi-Adler"
-- local variables defining radio option for defining mission complete percentage displayed name
local rad_option_7a = "Total Annhilation"
local rad_option_7b = "75 pct"
local rad_option_7c = "66 pct"
local rad_option_7d = "50 pct"
local rad_option_7e = "33 pct"
local rad_option_7f = "0 pct, debug only"
-- radio option variables are grouped by function. ie- 0a-3a
-- These variables define the displayed name for mission difficulty
local rad_option_8a = "Very Easy"
local rad_option_8b = "Easy"
local rad_option_8c = "Normal"
local rad_option_8d = "Hard"
local rad_option_8e = "Very Hard"
--These variables define displayed name for Task Spawn Distance
local rad_option_9a = "Scramble"
local rad_option_9b = "Close"
local rad_option_9c = "Standard"
local rad_option_9d = "Far"
local rad_option_9e = "Very Far"
local rad_option_9f = "Distant"
local rad_option_9g = "Random"
--Debug radio command (must have modified mission_scripting.lua in dcs scripts folder to not sanitize ios and lfs)
local rad_option_9y = "Debugging - Reload Script"
local rad_option_9z = "Debugging - Show Task Values"

Radio_Table = {}

--  Removes sub-menus so that reloading the script does not result in duplicate sub-menus in the list,
--  this was added because of the loading of the script debug option.
missionCommands.removeItem({"Mission Info"})
missionCommands.removeItem({"Airfield Tasks"})
missionCommands.removeItem({"Anapa Tasks"})
missionCommands.removeItem({"Maykop Tasks"})
missionCommands.removeItem({"Gudauta Tasks"})
missionCommands.removeItem({"Kutaisi Tasks"})
missionCommands.removeItem({"Nalchik Tasks"})
missionCommands.removeItem({"Tbilisi Tasks"})
missionCommands.removeItem({"OPFS Settings"})
missionCommands.removeItem({"Debug"})

 --variables defining f10 sub-menu items
Calls = missionCommands.addSubMenu("Mission Info",nil)
Airdromes = missionCommands.addSubMenu("Airfield Tasks",nil)
AnapaPath = missionCommands.addSubMenu("Anapa Tasks",nil)
MaykopPath = missionCommands.addSubMenu("Maykop Tasks",nil)
GudautaPath = missionCommands.addSubMenu("Gudauta Tasks",nil)
KutaisiPath = missionCommands.addSubMenu("Kutaisi Tasks",nil)
NalchikPath = missionCommands.addSubMenu("Nalchik Tasks",nil)
TbilisiPath = missionCommands.addSubMenu("Tbilisi Tasks",nil)
GameSet = missionCommands.addSubMenu("OPFS Settings",nil)
Debug = missionCommands.addSubMenu("Debug",nil)

--The are sub-menu variables, the parent menu is GameSet
DifficultySet = missionCommands.addSubMenu("Set Difficulty", GameSet)
PercentageSet = missionCommands.addSubMenu("Set Damage Goal WIP", GameSet)
DistanceSet = missionCommands.addSubMenu("Set Spawn Range", GameSet)

-- defining variable and array list default values and states
RunwayID = 0
Debugger = 0

airfield = 0
mudtask = 0
convoytask = 0
intercepttask = 0
bombertask = 0
striketask = 0
navaltask = 0

naval_complete = 0
strike_complete = 0
airfield_complete = 0
mud_complete = 0
convoy_complete = 0
intercept_complete = 0
bomber_complete = 0

Percentage = "no losses WIP"
Percentagemod = 100
Difficulty = "Very Easy"
Difficultymod = 1
Range = "Standard"
Task_Range = 2

--This array contains all the available player aircraft at their respective airbase
Rad = {
  "Anapa-86 #1",
  "Anapa-86 #2",
  "Anapa-21 #1",
  "Anapa-21 #2",
  "Anapa-21 #3",
  "Anapa-21 #4",
  "Anapa-21 #5",
  "Anapa-21 #6",
  "Anapa-25T #1",
  "Anapa-25T #2",
  "Anapa-25T #3",
  "Anapa-25T #4",
  "Anapa-25T #5",
  "Anapa-25T #6",
  "Anapa-25 #1",
  "Anapa-25 #2",
  "Anapa-25 #3",
  "Anapa-25 #4",
  "Anapa-25 #5",
  "Anapa-25 #6",
  "Anapa-A10C #1",
  "Anapa-A10C #2",
  "Anapa-A10C #3",
  "Anapa-A10C #4",
  "Anapa-A10C #5",
  "Anapa-A10C #6",
  "Anapa-A10A #1",
  "Anapa-A10A #2",
  "Anapa-A10A #3",
  "Anapa-A10A #4",
  "Anapa-A10A #5",
  "Anapa-A10A #6",
  "Anapa-F15C #1",
  "Anapa-F15C #2",
  "Anapa-F15C #3",
  "Anapa-F15C #4",
  "Anapa-F15C #5",
  "Anapa-F15C #6",
  "Anapa-86 #1",
  "Anapa-86 #2",
  "Anapa-KA50 #1",
  "Anapa-KA50 #2",
  "Anapa-KA50 #3",
  "Anapa-KA50 #4",
  "Anapa-KA50 #5",
  "Anapa-KA50 #6",
  "Anapa-KA50 #7",
  "Anapa-KA50 #8",
  "Anapa-UH1H #1",
  "Anapa-UH1H #2",
  "Anapa-UH1H #3",
  "Anapa-UH1H #4",
  "Anapa-Mi8 #1",
  "Anapa-Mi8 #2",
  "Anapa-Mi8 #3",
  "Anapa-Mi8 #4",
  "Nalchik-21 #1",
  "Nalchik-21 #2",
  "Nalchik-86 #1",
  "Nalchik-15C #1",
  "Nalchik-15C #2",
  "Nalchik-27 #1",
  "Nalchik-27 #2",
  "Nalchik-A10A #1",
  "Nalchik-A10A #2",
  "Nalchik-A10C #1",
  "Nalchik-A10C #2",
  "Nalchik-25 #1",
  "Nalchik-25 #2",
  "Nalchik-25T #1",
  "Nalchik-25T #2",
  "Tbilisi-86 #1",
  "Tbilisi-86 #2",
  "Tbilisi-27 #1",
  "Tbilisi-27 #2",
  "Tbilisi-27 #3",
  "Tbilisi-27 #4",
  "Tbilisi-21 #1",
  "Tbilisi-21 #2",
  "Tbilisi-21 #3",
  "Tbilisi-21 #4",
  "Tbilisi-21 #5",
  "Tbilisi-21 #6",
  "Tbilisi-15C #1",
  "Tbilisi-15C #2",
  "Tbilisi-15C #3",
  "Tbilisi-15C #4",
  "Tbilisi-25 #1",
  "Tbilisi-25 #2",
  "Tbilisi-25 #3",
  "Tbilisi-25 #4",
  "Tbilisi-25T #1",
  "Tbilisi-25T #2",
  "Tbilisi-25T #3",
  "Tbilisi-25T #4",
  "Tbilisi-A10A #1",
  "Tbilisi-A10A #2",
  "Tbilisi-A10A #3",
  "Tbilisi-A10A #4",
  "Tbilisi-A10C #1",
  "Tbilisi-A10C #2",
  "Tbilisi-A10C #3",
  "Tbilisi-A10C #4",
  "Tbilisi-UH1H #1",
  "Tbilisi-UH1H #2",
  "Tbilisi-KA50 #1",
  "Tbilisi-KA50 #2",
  "Tbilisi-Mi8 #1",
  "Tbilisi-Mi8 #2",
  "Gudauta-86 #1",
  "Gudauta-86 #2",
  "Gudauta-21 #1",
  "Gudauta-21 #2",
  "Gudauta-21 #3",
  "Gudauta-21 #4",
  "Gudauta-21 #5",
  "Gudauta-21 #6",
  "Gudauta-15C #1",
  "Gudauta-15C #2",
  "Gudauta-15C #3",
  "Gudauta-27 #1",
  "Gudauta-27 #2",
  "Gudauta-27 #3",
  "Gudauta-25 #1",
  "Gudauta-25 #2",
  "Gudauta-25 #3",
  "Gudauta-25 #4",
  "Gudauta-25T #1",
  "Gudauta-25T #2",
  "Gudauta-25T #3",
  "Gudauta-25T #4",
  "Gudauta-A10A #1",
  "Gudauta-A10A #2",
  "Gudauta-A10A #3",
  "Gudauta-A10A #4",
  "Gudauta-A10C #1",
  "Gudauta-A10C #2",
  "Gudauta-A10C #3",
  "Gudauta-A10C #4",
  "Kutaisi-86 #1",
  "Kutaisi-86 #2",
  "Kutaisi-21 #1",
  "Kutaisi-21 #2",
  "Kutaisi-21 #3",
  "Kutaisi-21 #4",
  "Kutaisi-21 #5",
  "Kutaisi-21 #6",
  "Kutaisi-15C #1",
  "Kutaisi-15C #2",
  "Kutaisi-15C #3",
  "Kutaisi-15C #4",
  "Kutaisi-27 #1",
  "Kutaisi-27 #2",
  "Kutaisi-27 #3",
  "Kutaisi-27 #4",
  "Kutaisi-A10A #1",
  "Kutaisi-A10A #2",
  "Kutaisi-A10A #3",
  "Kutaisi-A10A #4",
  "Kutaisi-A10C #1",
  "Kutaisi-A10C #2",
  "Kutaisi-A10C #3",
  "Kutaisi-A10C #4",
  "Kutaisi-25 #1",
  "Kutaisi-25 #2",
  "Kutaisi-25 #3",
  "Kutaisi-25 #4",
  "Kutaisi-25T #1",
  "Kutaisi-25T #2",
  "Kutaisi-25T #3",
  "Kutaisi-25T #4",
  "Kutaisi-UH1H #1",
  "Kutaisi-KA50 #1",
  "Kutaisi-KA50 #2",
  "Maykop-86 #1",
  "Maykop-86 #2",
  "Maykop-21 #1",
  "Maykop-21 #2",
  "Maykop-21 #3",
  "Maykop-21 #4",
  "Maykop-21 #5",
  "Maykop-21 #6",
  "Maykop-15C #1",
  "Maykop-15C #2",
  "Maykop-15C #3",
  "Maykop-15C #4",
  "Maykop-25 #1",
  "Maykop-25 #2",
  "Maykop-25 #3",
  "Maykop-25 #4",
  "Maykop-25T #1",
  "Maykop-25T #2",
  "Maykop-25T #3",
  "Maykop-25T #4",
  "Maykop-27 #1",
  "Maykop-27 #2",
  "Maykop-27 #3",
  "Maykop-27 #4",
  "Maykop-A10A #1",
  "Maykop-A10A #2",
  "Maykop-A10A #3",
  "Maykop-A10A #4",
  "Maykop-A10C #1",
  "Maykop-A10C #2",
  "Maykop-A10C #3",
  "Maykop-A10C #4",
  "Maykop-UH1H #1",
  "Maykop-UH1H #2",
  "Maykop-KA50 #1",
  "Maykop-KA50 #2",
  "Maykop-Mi8 #1",
  "Maykop-Mi8 #2",
}

---------------
-- RADIO ADD --
---------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Radio_Add(arg, time)

------------------------------------------------------------------------------------------------------------------------------------------------------------------
  for i=1,#Rad do
    Add_Menu(Rad[i])
  end
  return time + 5

end
---
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Add_Menu(unitName)

------------------------------------------------------------------------------------------------------------------------------------------------------------------
  if Radio_Table[unitName] == nil then

    local unit = Unit.getByName(unitName)
      if unit == nil then
        return
      end
    local group = unit:getGroup()
      if group == nil then
        return
      end		
      Rad_GroupID = group:getID()
      
      
      
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9y, Debug, reloadscript, nil)
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9z, Debug, Debug_Toggle, nil)

    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0a, Calls, Bullscall1, nil)
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0b, Calls, Bullscall2, nil)
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, Calls, Bullscall3, nil)
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0d, Calls, Bullscall4, nil)
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0e, Calls, Bullscall5, nil)

    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, Calls, BRAcall, nil)   
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7a, GameSet, Change_Smoke_Set, nil)
    
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2a, Airdromes, csilk_Airfield, 'Sochi')
    
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, AnapaPath, csilk_Fighter_Intercept, 'Anapa')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, AnapaPath, csilk_Bomber_Intercept, 'Anapa')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, AnapaPath, csilk_Mud, 'Anapa')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, AnapaPath, csilk_Convoy, 'Anapa')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, AnapaPath, csilk_Strike, 'Anapa')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, AnapaPath, csilk_Naval, 'OceanNorth')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, AnapaPath, csilk_Escort, 'Anapa')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, AnapaPath, csilk_Mud_CAS, 'Anapa')

    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, MaykopPath, csilk_Fighter_Intercept, 'Maykop')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, MaykopPath, csilk_Bomber_Intercept, 'Maykop')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, MaykopPath, csilk_Escort, 'Maykop')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, MaykopPath, csilk_Mud, 'Maykop')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, MaykopPath, csilk_Convoy, 'Maykop')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, MaykopPath, csilk_Mud_CAS, 'Maykop')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, MaykopPath, csilk_Strike, 'Maykop')
    
    
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, GudautaPath, csilk_Fighter_Intercept, 'Gudauta')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, GudautaPath, csilk_Bomber_Intercept, 'Gudauta')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, GudautaPath, csilk_Escort, 'Gudauta')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, GudautaPath, csilk_Mud, 'Gudauta')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, GudautaPath, csilk_Convoy, 'Gudauta')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, GudautaPath, csilk_Mud_CAS, 'Gudauta')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, GudautaPath, csilk_Strike, 'Gudauta')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, GudautaPath, csilk_Naval, 'OceanMid')
      
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, KutaisiPath, csilk_Fighter_Intercept, 'Kutaisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, KutaisiPath, csilk_Bomber_Intercept, 'Kutaisi')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, KutaisiPath, csilk_Escort, 'Kutaisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, KutaisiPath, csilk_Mud, 'Kutaisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, KutaisiPath, csilk_Convoy, 'Kutaisi')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, KutaisiPath, csilk_Mud_CAS, 'Kutaisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, KutaisiPath, csilk_Strike, 'Kutaisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1h, KutaisiPath, csilk_Naval, 'OceanSouth')
    
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, NalchikPath, csilk_Fighter_Intercept, 'Nalchik')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, NalchikPath, csilk_Bomber_Intercept, 'Nalchik')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, NalchikPath, csilk_Escort, 'Nalchik')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, NalchikPath, csilk_Mud, 'Nalchik')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, NalchikPath, csilk_Convoy, 'Nalchik')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, NalchikPath, csilk_Mud_CAS, 'Nalchik')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, NalchikPath, csilk_Strike, 'Nalchik')
    

    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, TbilisiPath, csilk_Fighter_Intercept, 'Tbilisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, TbilisiPath, csilk_Bomber_Intercept, 'Tbilisi')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, TbilisiPath, csilk_Escort, 'Tbilisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, TbilisiPath, csilk_Mud, 'Tbilisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, TbilisiPath, csilk_Convoy, 'Tbilisi')
    --missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, TbilisiPath, csilk_Mud_CAS, 'Tbilisi')
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, TbilisiPath, csilk_Strike, 'Tbilisi')
    
    
    

    ----------------
    -- Wanks Code --
    ----------------
    -- These commands set the function of the radio options in the difficulty sub-menu
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8a, DifficultySet, Set_Difficuty_VeryEasy, nil) -- 'Very Easy'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8b, DifficultySet, Set_Difficuty_Easy, nil) -- 'Easy'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8c, DifficultySet, Set_Difficuty_Normal, nil) -- 'Normal'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8d, DifficultySet, Set_Difficuty_Hard, nil) -- 'Hard'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8e, DifficultySet, Set_Difficuty_VeryHard, nil) -- 'Very Hard'

    -- These commands set the function of the radio options in the percentage sub-menu
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7a, PercentageSet, Set_Percentage_100, nil) -- '100pct'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7b, PercentageSet, Set_Percentage_75, nil) -- '75pct'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7c, PercentageSet, Set_Percentage_66, nil) -- '66pct'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7d, PercentageSet, Set_Percentage_50, nil) -- '50pct'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7e, PercentageSet, Set_Percentage_33, nil) -- '33pct'
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7f, PercentageSet, Set_Percentage_0, nil) -- '0pct'

    -- These commands set the function of the radio options in the target range sub-menu
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9a, DistanceSet, Set_Distance_Scramble, nil) -- Scramble
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9b, DistanceSet, Set_Distance_Close, nil) -- Close
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9c, DistanceSet, Set_Distance_Standard, nil) -- Standard
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9d, DistanceSet, Set_Distance_Far, nil) -- Far
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9e, DistanceSet, Set_Distance_Veryfar, nil) -- Very far
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9f, DistanceSet, Set_Distance_Distant, nil) -- Distant
    missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9g, DistanceSet, Set_Distance_Random, nil) -- Random
    
    --------------------
    -- End Wanks Code --
    --------------------
    
    Radio_Table[unitName] = true
  end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Radio_Check()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  for i=1,#Rad do
    
    local unitName = Rad[i]
    local unit = Unit.getByName(unitName)
    
    if unit == nil then
      local playerName = unit:getPlayerName()
    end

  end
  timer.scheduleFunction(Radio_Check, nil, timer.getTime() + 2)
  return
end
---

---------------------------------------------------------------------------------------------------------------------------
function doScriptFile(fN)
---------------------------------------------------------------------------------------------------------------------------
  local function log(s)
    print(tostring(s))
    trigger.action.outText(tostring(s), 10)

  end

  
  local f, err = loadfile(fN)
  if f then
    local err, errMsg = pcall(f)
    if not err then
      log('LUA ERROR- unable to run ' .. fN .. ', reason: ' .. tostring(errMsg))  --catches runtime errors.

    end

  else
    log('LUA ERROR- unable to load ' .. fN .. ', reason: ' .. tostring(err))  --catches syntax errors.

  end
end
-----------------------------
-- End doScriptFile Function --
-----------------------------

--[[Useage example:
if you have the file named "ScriptFile.lua" in Saved Games/DCS.
Put this code in a DO SCRIPT action that is triggered by an F10 radio menu selection.
]]

----------------------------------
function reloadscript()
----------------------------------
do
  local fName = lfs.writedir() .. [[csilk_core.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_airborne.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_ground.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_sea.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_strike.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_assault.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_gameset.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_intel.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_intro.lua]]
  doScriptFile(fName)
  
  local fName = lfs.writedir() .. [[csilk_movement.lua]]
  doScriptFile(fName)
  
  

      local msg = {} 
    msg.text = ' Reloaded all csilk scripts'

    msg.displayTime = 10
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)

  end

end
---

function Debug_Show(arg, time)

  if Debugger == 1 then
    local msg = {}
      msg.text = ' Debug variables'
      msg.displayTime = 4
      msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    local msg = {}
      msg.text = ' Tasks Start' ..tostring(airfield) ..tostring(mudtask) ..tostring(convoytask) ..tostring(intercepttask) ..tostring(bombertask) ..tostring(striketask) ..tostring(navaltask)
      msg.displayTime = 4
      msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
    
    local msg = {}
      msg.text = ' Completed Task' ..tostring(airfield_complete) ..tostring(mud_complete) ..tostring(convoy_complete) ..tostring(intercept_complete) ..tostring(bomber_complete) ..tostring(strike_complete) ..tostring(naval_complete)
      msg.displayTime = 4
      msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  end
  return time + 5
end

---------------------------------------
-- Mission Completion Check Function --
---------------------------------------

function Mission_Complete_Checks(arg, time)
  --airfield_complete = trigger.misc.getUserFlag('101')		-- when true this triggers the mission accomplished/message/clean up.
  --mud_complete = trigger.misc.getUserFlag('201')
  --convoy_complete = trigger.misc.getUserFlag('301')
  --intercept_complete = trigger.misc.getUserFlag('401')
  --bomber_complete = trigger.misc.getUserFlag('501')

  if trigger.misc.getUserFlag('102') == 1 then
    trigger.action.setUserFlag('102',0)
  end

  if trigger.misc.getUserFlag('202') == 1 then
    trigger.action.setUserFlag('202',0)
  end

  if trigger.misc.getUserFlag('302') == 1 then
    trigger.action.setUserFlag('302',0)
  end

  if trigger.misc.getUserFlag('402') == 1 then
    trigger.action.setUserFlag('402',0)
  end

  if trigger.misc.getUserFlag('502') == 1 then
    trigger.action.setUserFlag('502',0)
  end

  if trigger.misc.getUserFlag('602') == 1 then
    trigger.action.setUserFlag('602',0)
  end

  if trigger.misc.getUserFlag('702') == 1 then
    trigger.action.setUserFlag('702',0)
  end

  if trigger.misc.getUserFlag('101') == 1 then
    if airfield == 1 then
      local msg = {}
        msg.text = ' Airfield task has been completed.'
        msg.displayTime = 60
        msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        trigger.action.setUserFlag('102', 1)				-- stop victory
        airfield = 0
        airfield_complete = 0
        trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
        --trigger.action.deactivateGroup(Group.getByName(DefensesName))				-- deactivate airfield defenses	
    end
  end

  if trigger.misc.getUserFlag('201') == 1 then
    if mudtask == 1 then
      local msg = {}
        msg.text = ' Mud task has been completed.'
        msg.displayTime = 60
        msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        trigger.action.setUserFlag('202', 1)				-- stop victory
        mudtask = 0
        mud_complete = 0
        trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
        --trigger.action.deactivateGroup(Group.getByName(MudName))				-- deactivate mud
    end
  end

  if trigger.misc.getUserFlag('301') == 1 then
    if convoytask == 1 then
      local msg = {}
        msg.text = ' Convoy task has been completed.'
        msg.displayTime = 60
        msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        trigger.action.setUserFlag('302', 1)				-- stop victory
        convoytask = 0
        convoy_complete = 0
        trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
        --trigger.action.deactivateGroup(Group.getByName(MoveMud))				-- deactivate convoy
    end
  end

  if trigger.misc.getUserFlag('401') == 1 then
    if interceptortask == 1 then
      local msg = {}
        msg.text = ' Interceptor task has been completed.'
        msg.displayTime = 60
        msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        interceptortask = 0
        intercept_complete = 0
        trigger.action.setUserFlag('402', 1)				-- stop victory
        trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
        --trigger.action.deactivateGroup(Group.getByName(grpName))				-- deactivate fighters
    end
  end

  if trigger.misc.getUserFlag('501') == 1 then
    if bombertask == 1 then
      local msg = {}
        msg.text = ' Bomber intercept task has been completed.'
        msg.displayTime = 60
        msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        trigger.action.setUserFlag('502', 1)				-- stop victory
        bombertask = 0
        bomber_complete = 0
        trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
        --trigger.action.deactivateGroup(Group.getByName(egrpName))				-- deactivate escorts
        --trigger.action.deactivateGroup(Group.getByName(bgrpName))				-- deactivate bombers
    end
  end

  if trigger.misc.getUserFlag('601') == 1 then
    if striketask == 1 then
      local msg = {}
        msg.text = ' Strike mission completed.'
        msg.displayTime = 60
        msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        trigger.action.setUserFlag('602', 1)				-- stop victory
        striketask = 0
        strike_complete = 0
        trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
        --trigger.action.deactivateGroup(Group.getByName(egrpName))				-- deactivate escorts
        --trigger.action.deactivateGroup(Group.getByName(bgrpName))				-- deactivate bombers
    end
  end

  if trigger.misc.getUserFlag('701') == 1 then
    if navaltask == 1 then
      local msg = {}
        msg.text = ' Naval mission completed.'
        msg.displayTime = 60
        msg.msgFor = {coa = {'all'}}
        mist.message.add(msg)
        trigger.action.setUserFlag('702', 1)				-- stop victory
        navaltask = 0
        naval_complete = 0
        trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
        --trigger.action.deactivateGroup(Group.getByName(egrpName))				-- deactivate escorts
        --trigger.action.deactivateGroup(Group.getByName(bgrpName))				-- deactivate bombers
    end
  end
  --Debug_Show()
  return time + 5
end
-----------------------------------
-- End Compeltion Check Function --
-----------------------------------

-----------------------------
-- End Script Reload Function --
-----------------------------
-- Scheduled functions (run on timer)
Introduce_Mission()

------------------------------------------------------------------
timer.scheduleFunction(Radio_Add, nil, timer.getTime() + 5)
timer.scheduleFunction(Radio_Check, nil, timer.getTime() + 2)

timer.scheduleFunction(Mission_Complete_Checks, nil, timer.getTime() + 5) 
timer.scheduleFunction(Debug_Show, nil, timer.getTime() + 5) 
------------------------------------------------------------------

