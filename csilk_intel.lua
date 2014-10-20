-----------------------
-- Bullseye Function --
-----------------------
function Bullscall1()
  trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
  local msg = {}
    msg.units = targets
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)
    
  local msg = {}
    msg.units = targets
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)

  local msg = {}	
    msg.units = targets
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)

  local msg = {}
    msg.units = targets
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)

  local msg = {} 
    msg.units = targets
    msg.acc = 4
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}} 
    msg.text = ' Grid Reference: '
    mist.msgMGRS(msg)
  --return
end

---------------------------
-- End Bullseye Function --
---------------------------

-----------------------------
-- End Bullseye 2 Function --
-----------------------------

function Bullscall2()
  trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
  local msg = {}
    msg.units = targets2
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)

  local msg = {}
    msg.units = targets2
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)

  local msg = {}	
    msg.units = targets2
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)

  local msg = {}
    msg.units = targets2
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)
  -- return
  local msg = {} 
    msg.units = targets2
    msg.acc = 4
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}} 
    msg.text = ' Grid Reference: '
    mist.msgMGRS(msg)
end

-----------------------------
-- End Bullseye 2 Function --
-----------------------------

-----------------------------
-- Bullseye 3 Function --
-----------------------------
function Bullscall3()
  trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
  local msg = {}
    msg.units = targets3
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)
    
  local msg = {}
    msg.units = targets3
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)
    
  local msg = {}	
    msg.units = targets3
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)
    
  local msg = {}
    msg.units = targets3
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)
   -- return
   
  local msg = {} 
    msg.units = targets3
    msg.acc = 4
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}} 
    msg.text = ' Grid Reference: '
    mist.msgMGRS(msg)
end

-----------------------------
-- End Bullseye 3 Function --
-----------------------------

-----------------------------
-- Bullseye 4 Function --
-----------------------------

function Bullscall4()
  trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
  local msg = {}
    msg.units = targets4
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)
  
  local msg = {}
    msg.units = targets4
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)
    
  local msg = {}	
    msg.units = targets4
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)
  
  local msg = {}
    msg.units = targets4
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)
  --return
  
  local msg = {} 
    msg.units = targets4
    msg.acc = 4
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}} 
    msg.text = ' Grid Reference: '
    mist.msgMGRS(msg)

end

-----------------------------
-- End Bullseye 4 Function --
-----------------------------

-------------------------
-- Bullseye 5 Function --
-------------------------
function Bullscall5()
  trigger.action.outSoundForCoalition(coalition.side.RED, 'datalink.ogg')
  local msg = {}
    msg.units = targets5
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)
  
  local msg = {}
    msg.units = targets5
    msg.ref = 'red'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Maykop, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)
    
  local msg = {}	
    msg.units = targets5
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Imperial: '
    msg.metric = false
    msg.alt = true
    mist.msgBullseye(msg)
  
  local msg = {}
    msg.units = targets5
    msg.ref = 'blue'
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}}
    msg.text = ' Bullseye at Khashuri, Metric: '
    msg.metric = true
    msg.alt = true
    mist.msgBullseye(msg)
  --return
  local msg = {} 
    msg.units = targets5
    msg.acc = 2
    msg.displayTime = 90
    msg.msgFor = {coa = {'red'}} 
    msg.text = ' Grid Reference: '
    mist.msgMGRS(msg)
end
-----------------------------
-- End Bullseye 5 Function --
-----------------------------