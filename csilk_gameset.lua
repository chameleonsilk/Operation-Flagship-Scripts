------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Percentage_100()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Percentage = "total destruction"
Percentagemod = 5

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Task destruction goal has been set to '..tostring(Percentage)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Percentage_75()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Percentage = "catastrophic losses"
Percentagemod = 25

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Task destruction goal has been set to '..tostring(Percentage)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Percentage_66()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Percentage = "very heavy losses"
Percentagemod = 33

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Task destruction goal has been set to '..tostring(Percentage)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Percentage_50()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Percentage = "heavy losses"
Percentagemod = 50

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Task destruction goal has been set to '..tostring(Percentage)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Percentage_33()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Percentage = "light losses"
Percentagemod = 66

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Task destruction goal has been set to '..tostring(Percentage)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Percentage_0()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Percentage = "no losses"
Percentagemod = 100

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Task destruction goal has been set to '..tostring(Percentage)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------


----------------
-- Wanks Code --
----------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Difficuty_VeryEasy()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local New_Set = "Very Easy"
Difficultymod = 1

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Global difficulty has been set to '..tostring(New_Set)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Difficuty_Easy()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local New_Set = "Easy"
Difficultymod = 2

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Global difficulty has been set to '..tostring(New_Set)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Difficuty_Normal()

------------------------------------------------------------------------------------------------------------------------------------------------------------------
local New_Set = "Normal"
Difficultymod = 3

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')

  local msg = {} 
    msg.text = ' Global difficulty has been set to '..tostring(New_Set)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
    --return

end
-------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Difficuty_Hard()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local New_Set = "Hard"
Difficultymod = 4

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')

  local msg = {} 
    msg.text = ' Global difficulty has been set to '..tostring(New_Set)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
    --return

end

------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Difficuty_VeryHard()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local New_Set = "Very Hard"
Difficultymod = 5

trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
  local msg = {} 
    msg.text = ' Global difficulty has been set to '..tostring(New_Set)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

    --return
end
------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- This is the Scramble Distance function, it sets the Task_Range variable and displays a messages
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Distance_Scramble()

------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Range = "Scramble"
Task_Range = 1

trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  --return

end
-- This is the Close Distance function, it sets the Task_Range variable and displays a messages
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Distance_Close()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Range = "Close"
Task_Range = 2

trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  --return

end

-- This is the Standard Distance function, it sets the Task_Range variable and displays a messages

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Distance_Standard()

------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Range = "Standard"
Task_Range = 3

trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  --return

end
-- This is the Far Distance function, it sets the Task_Range variable and displays a messages
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Distance_Far()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Range = "Far"
Task_Range = 4

trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  --return

end

-- This is the Very Far Distance function, it sets the Task_Range variable and displays a messages
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Distance_Veryfar()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Range = "Very Far"
Task_Range = 5

trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  

  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
  --return

end

-- This is the Distant Distance function, it sets the Task_Range variable and displays a messages
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Distance_Distant()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Range = "Distant"
Task_Range = 6

trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  
  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)

 -- return

end

-- This is the Random Distance function, it sets the Task_Range variable and displays a messages
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Set_Distance_Random()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Range = "Random"
Task_Range = math.random(1,6)

trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')  
  local msg = {}
    msg.text = ' Task spawn start range has been set to '..tostring(Range)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
 -- return

end


--------------------
-- End Wanks Code --
--------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Change_Smoke_Set()
------------------------------------------------------------------------------------------------------------------------------------------------------------------
  local Old_Set = Smoke
  local New_Set = nil
  local SmokeSet = ""

  if Old_Set == 1 then
    New_Set = 0
    Smoke = New_Set
    SmokeSet = "disabled"
  end
    if Old_Set == 0 then
    New_Set = 1
    Smoke = New_Set
    SmokeSet = "enabled"

  end

  trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')

  local msg = {} 
    msg.text = ' Marking of enemy mud with smoke is '..tostring(SmokeSet)

    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
      mist.message.add(msg)
 -- return

end

-----------------------------------
-- End Change Smoke Set Function --
-----------------------------------

function Debug_Toggle()
  local Old_Set = Debugger
  local New_Set = nil
  local DebugSet = ""

  if Old_Set == 1 then
    New_Set = 0
    Debugger = New_Set
    DebugSet = "disabled"
  end
    if Old_Set == 0 then
    New_Set = 1
    Debugger = New_Set
    DebugSet = "enabled"
  end

  trigger.action.outSoundForCoalition(coalition.side.RED, 'range.ogg')
  local msg = {} 
    msg.text = ' Debug information is '..tostring(DebugSet)
    msg.displayTime = 20
    msg.msgFor = {coa = {'all'}}
    mist.message.add(msg)
 -- return
end