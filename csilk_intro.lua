----------------------------
-- Mission Intro w/ Music --
----------------------------

function Introduce_Mission(arg, time)
  local msg = {}
    msg.text = ' Chameleon_Silk is proud to present, Operation Flagship... Alpha Test2'
    msg.displayTime = 45
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
    msg.text = '  '
    msg.displayTime = 45
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
    msg.text = ' Mission utilizes heavily modified Interception Script by akp '
    msg.displayTime = 45
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
    msg.text = ' Mission utilizes Chameleon Silks task system script. '
    msg.displayTime = 45
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
    msg.text = ' Global difficulty has been set to '..tostring(Difficulty)
    msg.displayTime = 45
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
    msg.text = ' Task spawn start range has been set to '..tostring(Range)
    msg.displayTime = 45
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local msg = {} 
    msg.text = ' Percentage of destruction has been set to '..tostring(Percentage)
    msg.displayTime = 45
    msg.msgFor = {coa = {'all'}} 
    mist.message.add(msg)

  local pickSFX = mist.random(1,4)

  if pickSFX == 1 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation1.ogg')
  end

  if pickSFX == 2 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation2.ogg')
  end

  if pickSFX == 3 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation3.ogg')
  end

  if pickSFX == 4 then
    trigger.action.outSoundForCoalition(coalition.side.RED, 'variation4.ogg')
  end
end

--------------------------------
-- End Mission Intro w/ Music --
--------------------------------