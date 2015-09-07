

	-- Flagship Script

	local rad_option_0a = "Briefing: Last Mud"
	--local rad_option_0b = "Briefing: Last Strike"
	local rad_option_0c = "Briefing: Last Convoy"
	--local rad_option_0d = "Briefing: Last Airdrome"
	local rad_option_0e = "Briefing: Last Naval"

	local rad_option_1a = "Interdict: CAP"
	local rad_option_1b = "Interdict: Bombers"
  local rad_option_1e = "Interdict: Attackers"
	local rad_option_1c = "Create ground task"
  local rad_option_1d = "Hunt convoy"
	
	local rad_option_1f = "Strike: Naval"

	--local rad_option_2a = "Assault: Sochi-Adler"
	--local rad_option_7a = "Enemy Smoke Markers"

	----------------
	-- Wanks Code --
	----------------
	-- radio option variables are grouped by function. ie- 0a-3a
	-- These variables define the displayed name for mission difficulty
	local rad_option_8a = "World War II"
	local rad_option_8b = "Korean"
	local rad_option_8c = "Early Vietnam (default)"
	local rad_option_8d = "Post Vietnam"
	local rad_option_8e = "Cold War"
  
  local rad_option_10a = "1 enemy plane (default)"
  local rad_option_10b = "2 enemy planes"
  local rad_option_10c = "4 enemy planes"
  local rad_option_10d = "2 x 4 enemy planes"
  
  local rad_option_11a = "No radar SAMs"
  local rad_option_11b = "Short range"
  local rad_option_11c = "Medium range (default)"
  local rad_option_11d = "Long range"
  local rad_option_11e = "All envelopes"
  
  local rad_option_12a = "No IR SAM"
  local rad_option_12b = "Vehicle based"
  local rad_option_12c = "Manpads (default)"
  local rad_option_12d = "Both"
  local rad_option_12e = "Extra vehicle based with Manpads"
  
  local rad_option_13a = "No AI SEAD Flights"
  local rad_option_13b = "2 Allied SEAD planes (default)"
  local rad_option_13c = "4 Allied SEAD planes"
  
  local rad_option_14a = "No enemy helos"
  local rad_option_14b = "2 enemy helos (default)"
  local rad_option_14c = "4 enemy helos"
  local rad_option_14d = "2 x 4 enemy helos"
  
  local rad_option_16b = "Disabled CA"
  local rad_option_16a = "Enable CA (Default)"
  
  local rad_option_17a = "AAA Enabled (Default)"
  local rad_option_17b = "AAA Disabled"
  
  local rad_option_18a = "Buildings enabled (Default)"
  local rad_option_18b = "Buildings disabled"
  
  local rad_option_19a = "Attackers enabled (Default)"
  local rad_option_19b = "Attackers disabled"
  
  local rad_option_20a = "Fighters enabled (Default)"
  local rad_option_20b = "Fighters disabled"
  
  
  

	--These variables define displayed name for Task Spawn Distance
	local rad_option_9a = "Scramble"
	local rad_option_9b = "Close"
	local rad_option_9c = "Standard"
	local rad_option_9d = "Far"
	local rad_option_9e = "Very Far"
	local rad_option_9f = "Distant"
	local rad_option_9g = "Random"

	--Debug radio command (must have modified mission_scripting.lua in dcs scripts folder to not sanitize ios and lfs)
	--local rad_option_9y = "Debugging - Reload Script"
	--local rad_option_9z = "Debugging - Show Task Values"

	--------------------
	-- End Wanks Code --
	--------------------
	loopsthrough = 0
	
	Radio_Table = {}

	zone = {}
	bzone = {}
	mzone = {}
  azone = {}

	grpName = {}
  grpName2 = {}
  grpNameA = {}
  grpName2A = {}
  --MudREDCASName = {}
	--MudREDCASNameb = {}
	bgrpName = {}
	egrpName = {}

  --randomizer_time = 0
	--randomizer_time = mist.random(45,90)
	
	smoke_marker = {}

	Loops = 0
	RunwayID = 0
	Debugger = 0

	airfield = 0
	mudtask = 0
	convoytask = 0
	intercepttask = 0
	bombertask = 0
  castask = 0

	airfield_complete = 0
	mud_complete = 0
	convoy_complete = 0
	intercept_complete = 0
	bomber_complete = 0
  cas_complete = 0
  

	message = {}
  heloPsn = {}
  heloPsn2 = {}
  heloPsn3 = {}
	seadPsn = {}
  bspawnPsn = {}
	espawnPsn = {}
	spawnPsn = {}
	mudPsn = {}
  mudPsn2 = {}
  mudPsn3 = {}
  airzone = {}

	Smoke = 0
	Scoord  = {}
	Difficulty = "Normal"
	Difficultymod = 1
	Range = "Close"
	Task_Range = 2
  Groupsizes = 1
  Samradar = 3
  Saminfared = 3
  SEAD = 2
  eHelo = 2
  aHelo = 2
  CACAS = 2
  EnemyAD = 2
  EnemyFort = 2
  eAttack = 2
  admin_lock = trigger.misc.getUserFlag(666)
  
  if admin_lock == 1 then
  Rad = {
  "ADMIN AIRCRAFT",
  }
  end
  
	--This array contains all the available player aircraft at their respective airbase
	if admin_lock == 0 then
  Rad = {
    "ADMIN AIRCRAFT",
    "MudREDCAS (VeryEasy) #000",
    "MudREDCAS (VeryEasy) #001",
    "MudREDCAS (VeryEasy) #002",
    "MudREDCAS (VeryEasy) #003",
    "MudREDCAS (VeryEasy) #004",
    "MudREDCAS (Easy) #000",
    "MudREDCAS (Easy) #001",
    "MudREDCAS (Easy) #002",
    "MudREDCAS (Easy) #003",
    "MudREDCAS (Easy) #004",
    "MudREDCAS (Normal) #000",
    "MudREDCAS (Normal) #001",
    "MudREDCAS (Normal) #002",
    "MudREDCAS (Normal) #003",
    "MudREDCAS (Normal) #004",
    "MudREDCAS (Hard) #000",
    "MudREDCAS (Hard) #001",
    "MudREDCAS (Hard) #002",
    "MudREDCAS (Hard) #003",
    "MudREDCAS (Hard) #004",
    "MudREDCAS (VeryHard) #000",
    "MudREDCAS (VeryHard) #001",
    "MudREDCAS (VeryHard) #002",
    "MudREDCAS (VeryHard) #003",
    "MudREDCAS (VeryHard) #004",
	  "Anapa-P51D #1",
    "Anapa-P51D #2",
    "Anapa-K4 #2",
    "Anapa-K4 #1",
    "Anapa-D9 #1",
    "Anapa-D9 #2",
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
  end
	-----------------------
	-- Static MUD Arrays --
	-----------------------

	Mud_Names = 5 -- variable for number of availale MUD Per Difficulty

	Mud_VeryEasy = {
	  [1] = "Mud (VeryEasy) #001",
		[2] = "Mud (VeryEasy) #002",
    [3] = "Mud (VeryEasy) #003",
    [4] = "Mud (VeryEasy) #004",
    [5] = "Mud (VeryEasy) #005",
    --[6] = "Mud (VeryEasy) #006",
	}
	Mud_Easy = {
    [1] = "Mud (Easy) #001",
		[2] = "Mud (Easy) #002",
    [3] = "Mud (Easy) #003",
    [4] = "Mud (Easy) #004",
    [5] = "Mud (Easy) #005",
    --[6] = "Mud (Easy) #006",
	}
	Mud_Normal = {
	  [1] = "Mud (Normal) #001",
		[2] = "Mud (Normal) #002",
    [3] = "Mud (Normal) #003",
    [4] = "Mud (Normal) #004",
    [5] = "Mud (Normal) #005",
    [6] = "Mud (Normal) #006",
	}
	Mud_Hard = {
	  [1] = "Mud (Hard) #001",
		[2] = "Mud (Hard) #002",
    [3] = "Mud (Hard) #003",
    [4] = "Mud (Hard) #004",
    [5] = "Mud (Hard) #005",
    --[6] = "Mud (Hard) #006",
	}
	Mud_VeryHard = {
	  [1] = "Mud (VeryHard) #001",
		[2] = "Mud (VeryHard) #002",
    [3] = "Mud (VeryHard) #003",
    [4] = "Mud (VeryHard) #004",
    [5] = "Mud (VeryHard) #005",
    --[6] = "Mud (VeryHard) #006",
	}
	---------------------------
	-- End Static MUD Arrays --
	---------------------------
  	-----------------------
	-- AD MUD Arrays --
	-----------------------

	AD_Groups = 2 -- variable for number of availale MUD Per Difficulty

	AD_VeryEasy = {
	  [1] = "AD (VeryEasy) #001",
    [2] = "AD (VeryEasy) #002",
    [3] = "AD (VeryEasy) #003",
    [4] = "AD (VeryEasy) #004",
    [5] = "AD (VeryEasy) #005",
    [6] = "AD (VeryEasy) #006",
	}
  
  AD_Easy = {
	  [1] = "AD (Easy) #001",
    [2] = "AD (Easy) #002",
    [3] = "AD (Easy) #003",
    [4] = "AD (Easy) #004",
    [5] = "AD (Easy) #005",
    [6] = "AD (Easy) #006",
	}
  
  AD_Normal = {
	  [1] = "AD (Normal) #001",
    [2] = "AD (Normal) #002",
    [3] = "AD (Normal) #003",
    [4] = "AD (Normal) #004",
    [5] = "AD (Normal) #005",
    [6] = "AD (Normal) #006",
	}
  
  AD_Hard = {
	  [1] = "AD (Hard) #001",
    [2] = "AD (Hard) #002",
    [3] = "AD (Hard) #003",
    [4] = "AD (Hard) #004",
    [5] = "AD (Hard) #005",
    [6] = "AD (Hard) #006",
	}
  
   AD_VeryHard = {
	  [1] = "AD (VeryHard) #001",
    [2] = "AD (VeryHard) #002",
    [3] = "AD (VeryHard) #003",
    [4] = "AD (VeryHard) #004",
    [5] = "AD (VeryHard) #005",
    [6] = "AD (VeryHard) #006",
	}
	---------------------------
	-- End Static MUD Arrays --
	---------------------------
  -----------------------
	-- Static BLUE CAS MUD Arrays --
	-----------------------

	Blue_CAS_Names = 1 -- variable for number of availale MUD Per Difficulty

	MudBLUECAS_VeryEasy = {
	  [1] = "MudBLUECAS (VeryEasy) #000",
		[2] = "MudBLUECAS (VeryEasy) #001",
    [3] = "MudBLUECAS (VeryEasy) #002",
    [4] = "MudBLUECAS (VeryEasy) #003",
    [5] = "MudBLUECAS (VeryEasy) #004",
	}
	MudBLUECAS_Easy = {
	  [1] = "MudBLUECAS (Easy) #000",
		[2] = "MudBLUECAS (Easy) #001",
    [3] = "MudBLUECAS (Easy) #002",
    [4] = "MudBLUECAS (Easy) #003",
    [5] = "MudBLUECAS (Easy) #004",
	}
	MudBLUECAS_Normal = {
	  [1] = "MudBLUECAS (Normal) #000",
		[2] = "MudBLUECAS (Normal) #001",
    [3] = "MudBLUECAS (Normal) #002",
    [4] = "MudBLUECAS (Normal) #003",
    [5] = "MudBLUECAS (Normal) #004",
	}
	MudBLUECAS_Hard = {
	  [1] = "MudBLUECAS (Hard) #000",
		[2] = "MudBLUECAS (Hard) #001",
    [3] = "MudBLUECAS (Hard) #002",
    [4] = "MudBLUECAS (Hard) #003",
    [5] = "MudBLUECAS (Hard) #004",
	}
	MudBLUECAS_VeryHard = {
	  [1] = "MudBLUECAS (VeryHard) #000",
		[2] = "MudBLUECAS (VeryHard) #001",
    [3] = "MudBLUECAS (VeryHard) #002",
    [4] = "MudBLUECAS (VeryHard) #003",
    [5] = "MudBLUECAS (VeryHard) #004",
	}
	---------------------------
	-- End BLUE CAS MUD Arrays --
	---------------------------
  -----------------------
	-- Static RED CAS MUD Arrays --
	-----------------------

	Red_CAS_Names = 5 -- variable for number of availale MUD Per Difficulty

	MudREDCAS_VeryEasy = {
	  [1] = "MudREDCAS (VeryEasy) #000",
		[2] = "MudREDCAS (VeryEasy) #001",
    [3] = "MudREDCAS (VeryEasy) #002",
    [4] = "MudREDCAS (VeryEasy) #003",
    [5] = "MudREDCAS (VeryEasy) #004",
	}
	MudREDCAS_Easy = {
	  [1] = "MudREDCAS (Easy) #000",
		[2] = "MudREDCAS (Easy) #001",
    [3] = "MudREDCAS (Easy) #002",
    [4] = "MudREDCAS (Easy) #003",
    [5] = "MudREDCAS (Easy) #004",
	}
	MudREDCAS_Normal = {
	  [1] = "MudREDCAS (Normal) #000",
		[2] = "MudREDCAS (Normal) #001",
    [3] = "MudREDCAS (Normal) #002",
    [4] = "MudREDCAS (Normal) #003",
    [5] = "MudREDCAS (Normal) #004",
	}
	MudREDCAS_Hard = {
	  [1] = "MudREDCAS (Hard) #000",
		[2] = "MudREDCAS (Hard) #001",
    [3] = "MudREDCAS (Hard) #002",
    [4] = "MudREDCAS (Hard) #003",
    [5] = "MudREDCAS (Hard) #004",
	}
	MudREDCAS_VeryHard = {
	  [1] = "MudREDCAS (VeryHard) #000",
		[2] = "MudREDCAS (VeryHard) #001",
    [3] = "MudREDCAS (VeryHard) #002",
    [4] = "MudREDCAS (VeryHard) #003",
    [5] = "MudREDCAS (VeryHard) #004",
	}
	---------------------------
	-- End RED CAS MUD Arrays --
	---------------------------
	
	
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
	--------------------------
	-- End Ships 						--
	--------------------------
	
	--------------------------
	-- Boat								--
	--------------------------
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
	--------------------------
	-- End of Boat					--
	--------------------------


	
	
	-----------------------------
	-- Surface to air missiles -- ''LEGACY SAM STUFF MAYBE REPLACED IN FUTURE
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
  -----------------------------------------------------------------------------------
  -- Surface to air missiles -- '' THESE ARE THE GROUPS THAT ARE USED FOR THE USER CONTROLLABLE SAM THREAT LEVEL
  -----------------------------
  Radar_SAM = 3
	
	Sam_Radar_Threat_2 = {
	[1] = 'RADthreat2 SAM #1',
	[2] = 'RADthreat2 SAM #2',
  [3] = 'RADthreat3 SAM #3',
	}
	
	Sam_Radar_Threat_3 = {
	[1] = 'RADthreat3 SAM #1',
	[2] = 'RADthreat3 SAM #2',
  [3] = 'RADthreat3 SAM #3',
	}
	
	Sam_Radar_Threat_4 = {
	[1] = 'RADthreat4 SAM #1',
	[2] = 'RADthreat4 SAM #2',
  [3] = 'RADthreat4 SAM #3',
	}
	
  IR_SAM = 3
  
	Sam_IR_Threat_2 = {
	[1] = 'IRThreat2 SAM #1',
	[2] = 'IRThreat2 SAM #2',
  [3] = 'IRThreat2 SAM #3',
	}
	
	Sam_IR_Threat_3 = {
	[1] = 'IRThreat3 SAM #1',
	[2] = 'IRThreat3 SAM #2',
  [3] = 'IRThreat3 SAM #3',
	}
  
  	Sam_IR_Threat_4 = {
	[1] = 'IRThreat4 SAM #1',
	[2] = 'IRThreat4 SAM #2',
  [3] = 'IRThreat4 SAM #3',
	}

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
	--End Infantry spawning array --
	---------------------------------
	
		-----------------------------
	--Iinfantry spawning array --
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

	-----------------------------
	-- Fighter spawning arrays --
	-----------------------------
	-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from

	Fighter_Names = 7 -- variable for number of available fighters

	Fighter_Names_VeryEasy = {
	[1] = 'Fighters (WW2) #1',
	[2] = 'Fighters (WW2) #2',
	[3] = 'Fighters (WW2) #3',
	[4] = 'Fighters (WW2) #4',
	[5] = 'Fighters (WW2) #5',
	[6] = 'Fighters (WW2) #6',
	[7] = 'Fighters (WW2) #7',
	}
  
	Fighter_Names_Easy = {
	  [1] = 'Fighters (Korea) #1',
	  [2] = 'Fighters (Korea) #2',
	  [3] = 'Fighters (Korea) #3',
	  [4] = 'Fighters (Korea) #4',
	  [5] = 'Fighters (Korea) #5',
	  [6] = 'Fighters (Korea) #6',	
		[7] = 'Fighters (Korea) #7',
	}
  
  	Fighter_Names_Normal = {
	[1] = 'Fighters (Trainers) #1',
	[2] = 'Fighters (Trainers) #2',
	[3] = 'Fighters (Trainers) #3',
	[4] = 'Fighters (Trainers) #4',
	[5] = 'Fighters (Trainers) #5',
	[6] = 'Fighters (Trainers) #6',
	[7] = 'Fighters (Trainers) #7',
  }
  
	Fighter_Names_Hard = {
	  [1] = 'Fighters (Vietnam) #1',
		[2] = 'Fighters (Vietnam) #2',
	  [3] = 'Fighters (Vietnam) #3',
		[4] = 'Fighters (Vietnam) #4',
	  [5] = 'Fighters (Vietnam) #5',
		[6] = 'Fighters (Vietnam) #6',
	  [7] = 'Fighters (Vietnam) #7',
	}
	Fighter_Names_VeryHard = {
	  [1] = 'Fighters (Modern) #1',
		[2] = 'Fighters (Modern) #2',
	  [3] = 'Fighters (Modern) #3',
		[4] = 'Fighters (Modern) #4',
	  [5] = 'Fighters (Modern) #5',
		[6] = 'Fighters (Modern) #6',
	  [7] = 'Fighters (Modern) #7',
	}
  
  	Fighter_Names_VeryEasyx2 = {
	[1] = '2Fighters (WW2) #1',
	[2] = '2Fighters (WW2) #2',
	[3] = '2Fighters (WW2) #3',
	[4] = '2Fighters (WW2) #4',
	[5] = '2Fighters (WW2) #5',
	[6] = '2Fighters (WW2) #6',
	[7] = '2Fighters (WW2) #7',
	}
  
  	Fighter_Names_Easyx2 = {
	  [1] = '2Fighters (Korea) #1',
	  [2] = '2Fighters (Korea) #2',
	  [3] = '2Fighters (Korea) #3',
	  [4] = '2Fighters (Korea) #4',
	  [5] = '2Fighters (Korea) #5',
	  [6] = '2Fighters (Korea) #6',	
		[7] = '2Fighters (Korea) #7',
	}
	
	Fighter_Names_Normalx2 = {
	[1] = '2Fighters (Trainers) #1',
	[2] = '2Fighters (Trainers) #2',
	[3] = '2Fighters (Trainers) #3',
	[4] = '2Fighters (Trainers) #4',
	[5] = '2Fighters (Trainers) #5',
	[6] = '2Fighters (Trainers) #6',
	[7] = '2Fighters (Trainers) #7',
	}
  
	Fighter_Names_Hardx2 = {
	  [1] = '2Fighters (Vietnam) #1',
		[2] = '2Fighters (Vietnam) #2',
	  [3] = '2Fighters (Vietnam) #3',
		[4] = '2Fighters (Vietnam) #4',
	  [5] = '2Fighters (Vietnam) #5',
		[6] = '2Fighters (Vietnam) #6',
	  [7] = '2Fighters (Vietnam) #7',
	}
	Fighter_Names_VeryHardx2 = {
	  [1] = '2Fighters (Modern) #1',
		[2] = '2Fighters (Modern) #2',
	  [3] = '2Fighters (Modern) #3',
		[4] = '2Fighters (Modern) #4',
	  [5] = '2Fighters (Modern) #5',
		[6] = '2Fighters (Modern) #6',
	  [7] = '2Fighters (Modern) #7',
	}
  
 	Fighter_Names_VeryEasyx4 = {
	[1] = '4Fighters (WW2) #1',
	[2] = '4Fighters (WW2) #2',
	[3] = '4Fighters (WW2) #3',
	[4] = '4Fighters (WW2) #4',
	[5] = '4Fighters (WW2) #5',
	[6] = '4Fighters (WW2) #6',
	[7] = '4Fighters (WW2) #7',
	}
  
    
	Fighter_Names_Easyx4 = {
	  [1] = '4Fighters (Korea) #1',
	  [2] = '4Fighters (Korea) #2',
	  [3] = '4Fighters (Korea) #3',
	  [4] = '4Fighters (Korea) #4',
	  [5] = '4Fighters (Korea) #5',
	  [6] = '4Fighters (Korea) #6',	
		[7] = '4Fighters (Korea) #7',
	}
	
	Fighter_Names_Normalx4 = {
	[1] = '4Fighters (Trainers) #1',
	[2] = '4Fighters (Trainers) #2',
	[3] = '4Fighters (Trainers) #3',
	[4] = '4Fighters (Trainers) #4',
	[5] = '4Fighters (Trainers) #5',
	[6] = '4Fighters (Trainers) #6',
	[7] = '4Fighters (Trainers) #7',
	}

  
	Fighter_Names_Hardx4 = {
	  [1] = '4Fighters (Vietnam) #1',
		[2] = '4Fighters (Vietnam) #2',
	  [3] = '4Fighters (Vietnam) #3',
		[4] = '4Fighters (Vietnam) #4',
	  [5] = '4Fighters (Vietnam) #5',
		[6] = '4Fighters (Vietnam) #6',
	  [7] = '4Fighters (Vietnam) #7',
	}
	Fighter_Names_VeryHardx4 = {
	  [1] = '4Fighters (Modern) #1',
		[2] = '4Fighters (Modern) #2',
	  [3] = '4Fighters (Modern) #3',
		[4] = '4Fighters (Modern) #4',
	  [5] = '4Fighters (Modern) #5',
		[6] = '4Fighters (Modern) #6',
	  [7] = '4Fighters (Modern) #7',
	}
  
  Fighter_Names_VeryEasyx8 = {
	[1] = '8Fighters (WW2) #1',
	[2] = '8Fighters (WW2) #2',
	[3] = '8Fighters (WW2) #3',
	[4] = '8Fighters (WW2) #4',
	[5] = '8Fighters (WW2) #5',
	[6] = '8Fighters (WW2) #6',
	[7] = '8Fighters (WW2) #7',
	}
  
  	Fighter_Names_Easyx8 = {
	  [1] = '8Fighters (Korea) #1',
	  [2] = '8Fighters (Korea) #2',
	  [3] = '8Fighters (Korea) #3',
	  [4] = '8Fighters (Korea) #4',
	  [5] = '8Fighters (Korea) #5',
	  [6] = '8Fighters (Korea) #6',	
		[7] = '8Fighters (Korea) #7',
	}
	
	Fighter_Names_Normalx8 = {
	[1] = '8Fighters (Trainers) #1',
	[2] = '8Fighters (Trainers) #2',
	[3] = '8Fighters (Trainers) #3',
	[4] = '8Fighters (Trainers) #4',
	[5] = '8Fighters (Trainers) #5',
	[6] = '8Fighters (Trainers) #6',
	[7] = '8Fighters (Trainers) #7',
	}
  

  
	Fighter_Names_Hardx8 = {
	  [1] = '8Fighters (Vietnam) #1',
		[2] = '8Fighters (Vietnam) #2',
	  [3] = '8Fighters (Vietnam) #3',
		[4] = '8Fighters (Vietnam) #4',
	  [5] = '8Fighters (Vietnam) #5',
		[6] = '8Fighters (Vietnam) #6',
	  [7] = '8Fighters (Vietnam) #7',
	}
	Fighter_Names_VeryHardx8 = {
	  [1] = '8Fighters (Modern) #1',
		[2] = '8Fighters (Modern) #2',
	  [3] = '8Fighters (Modern) #3',
		[4] = '8Fighters (Modern) #4',
	  [5] = '8Fighters (Modern) #5',
		[6] = '8Fighters (Modern) #6',
	  [7] = '8Fighters (Modern) #7',
	}
	------------------------
	-- End Fighter Arrays --
	------------------------
  ----------------------------
	-- SEAD spawning arrays --
	----------------------------
	-- The following arrays contain available friendly SEAD flights

  SEAD_Names = 2 --variable for number of availale fighters

	SEAD_Names_VeryEasy2x = {
		[1] = '2Allied SEAD (VeryEasy) #1',
	  [2] = '2Allied SEAD (VeryEasy) #2',
	}
	SEAD_Names_VeryEasy4x = {
		[1] = '4Allied SEAD (VeryEasy) #1',
	  [2] = '4Allied SEAD (VeryEasy) #2',
	}
  
  	SEAD_Names_Easy2x = {
		[1] = '2Allied SEAD (Easy) #1',
	  [2] = '2Allied SEAD (Easy) #2',
	}
	SEAD_Names_Easy4x = {
		[1] = '4Allied SEAD (Easy) #1',
	  [2] = '4Allied SEAD (Easy) #2',
	}
  
  SEAD_Names_Normal2x = {
		[1] = '2Allied SEAD (Normal) #1',
	  [2] = '2Allied SEAD (Normal) #2',
	}
	SEAD_Names_Normal4x = {
		[1] = '4Allied SEAD (Normal) #1',
	  [2] = '4Allied SEAD (Normal) #2',
	}
  
    SEAD_Names_Hard2x = {
		[1] = '2Allied SEAD (Hard) #1',
	  [2] = '2Allied SEAD (Hard) #2',
	}
	SEAD_Names_Hard4x = {
		[1] = '4Allied SEAD (Hard) #1',
	  [2] = '4Allied SEAD (Hard) #2',
	}
  
  SEAD_Names_VeryHard2x = {
		[1] = '2Allied SEAD (VeryHard) #1',
	  [2] = '2Allied SEAD (VeryHard) #2',
	}
	SEAD_Names_VeryHard4x = {
		[1] = '4Allied SEAD (VeryHard) #1',
	  [2] = '4Allied SEAD (VeryHard) #2',
	}
	------------------------
	-- End SEAD Arrays --
	------------------------
  ------------------------
  -- Enemy Helo Arrays --
	------------------------
  
   Enemy_Helo_Names = 3 --variable for number of availale fighters

   
   
   
     Enemy_Helo_Names_VeryEasy2x = {
		[1] = '2Enemy Helo (VeryEasy) #1',
	  [2] = '2Enemy Helo (VeryEasy) #2',
    [3] = '2Enemy Helo (VeryEasy) #3',
	}
  Enemy_Helo_Names_Easy2x = {
		[1] = '2Enemy Helo (Easy) #1',
	  [2] = '2Enemy Helo (Easy) #2',
    [3] = '2Enemy Helo (Easy) #3',
	}
  	Enemy_Helo_Names_Normal2x = {
		[1] = '2Enemy Helo (Normal) #1',
	  [2] = '2Enemy Helo (Normal) #2',
    [3] = '2Enemy Helo (Normal) #3',
	}
  Enemy_Helo_Names_Hard2x = {
		[1] = '2Enemy Helo (Hard) #1',
	  [2] = '2Enemy Helo (Hard) #2',
    [3] = '2Enemy Helo (Hard) #3',
	}
  Enemy_Helo_Names_VeryHard2x = {
		[1] = '2Enemy Helo (VeryHard) #1',
	  [2] = '2Enemy Helo (VeryHard) #2',
    [3] = '2Enemy Helo (VeryHard) #3',
	}
   
  Enemy_Helo_Names_VeryEasy4x = {
		[1] = '4Enemy Helo (VeryEasy) #1',
	  [2] = '4Enemy Helo (VeryEasy) #2',
    [3] = '4Enemy Helo (VeryEasy) #3',
	}
  Enemy_Helo_Names_Easy4x = {
		[1] = '4Enemy Helo (Easy) #1',
	  [2] = '4Enemy Helo (Easy) #2',
    [3] = '4Enemy Helo (Easy) #3',
	}
  	Enemy_Helo_Names_Normal4x = {
		[1] = '4Enemy Helo (Normal) #1',
	  [2] = '4Enemy Helo (Normal) #2',
    [3] = '4Enemy Helo (Normal) #3',
	}
  Enemy_Helo_Names_Hard4x = {
		[1] = '4Enemy Helo (Hard) #1',
	  [2] = '4Enemy Helo (Hard) #2',
    [3] = '4Enemy Helo (Hard) #3',
	}
  Enemy_Helo_Names_VeryHard4x = {
		[1] = '4Enemy Helo (VeryHard) #1',
	  [2] = '4Enemy Helo (VeryHard) #2',
    [3] = '4Enemy Helo (VeryHard) #3',
	}
  
    Enemy_Helo_Names_VeryEasy8x = {
		[1] = '8Enemy Helo (VeryEasy) #1',
	  [2] = '8Enemy Helo (VeryEasy) #2',
    [3] = '8Enemy Helo (VeryEasy) #3',
	}
  Enemy_Helo_Names_Easy8x = {
		[1] = '8Enemy Helo (Easy) #1',
	  [2] = '8Enemy Helo (Easy) #2',
    [3] = '8Enemy Helo (Easy) #3',
	}
  	Enemy_Helo_Names_Normal8x = {
		[1] = '8Enemy Helo (Normal) #1',
	  [2] = '8Enemy Helo (Normal) #2',
    [3] = '8Enemy Helo (Normal) #3',
	}
  Enemy_Helo_Names_Hard8x = {
		[1] = '8Enemy Helo (Hard) #1',
	  [2] = '8Enemy Helo (Hard) #2',
    [3] = '8Enemy Helo (Hard) #3',
	}
  Enemy_Helo_Names_VeryHard8x = {
		[1] = '8Enemy Helo (VeryHard) #1',
	  [2] = '8Enemy Helo (VeryHard) #2',
    [3] = '8Enemy Helo (VeryHard) #3',
	}
	------------------------
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
	-----------------------------------
	-- End airfield task spawning arrays--
	-----------------------------------

	------------------------------------
	-- Attacker plane spawning arrays --
	------------------------------------
	-- The following arrays contain available enemy aircraft the Spawn Fighter function pulls from

	Attacker_Names = 2 -- variable for number of availale ground attackers

  
  	Attacker_Names_VeryEasy = {
	  [1] = 'Enemy Attacker (VeryEasy) #000',
	  [2] = 'Enemy Attacker (VeryEasy) #001',

	}
	Attacker_Names_Easy = {
	  [1] = 'Enemy Attacker (Easy) #000',
	  [2] = 'Enemy Attacker (Easy) #001',
	}
	Attacker_Names_Normal = {
	  [1] = 'Enemy Attacker (Normal) #000',
	  [2] = 'Enemy Attacker (Normal) #001',
	}
	Attacker_Names_Hard = {
	  [1] = 'Enemy Attacker (Hard) #000',
	  [2] = 'Enemy Attacker (Hard) #001',
	}
	Attacker_Names_VeryHard = {
	  [1] = 'Enemy Attacker (VeryHard) #000',
	  [2] = 'Enemy Attacker (VeryHard) #001',
	}
  
  
  Attacker_Names_VeryEasyx2 = {
	  [1] = '2Enemy Attacker (VeryEasy) #000',
	  [2] = '2Enemy Attacker (VeryEasy) #001',
	}
  	Attacker_Names_Easyx2 = {
	  [1] = '2Enemy Attacker (Easy) #000',
	  [2] = '2Enemy Attacker (Easy) #001',
	}
	Attacker_Names_Normalx2 = {
	  [1] = '2Enemy Attacker (Normal) #000',
	  [2] = '2Enemy Attacker (Normal) #001',
	}
	Attacker_Names_Hardx2 = {
	  [1] = '2Enemy Attacker (Hard) #000',
	  [2] = '2Enemy Attacker (Hard) #001',
	}
	Attacker_Names_VeryHardx2 = {
	  [1] = '2Enemy Attacker (VeryHard) #000',
	  [2] = '2Enemy Attacker (VeryHard) #001',
	}
  
   	Attacker_Names_VeryEasyx4 = {
	  [1] = '4Enemy Attacker (Easy) #000',
	  [2] = '4Enemy Attacker (Easy) #001',
	}
  	Attacker_Names_Easyx4 = {
	  [1] = '4Enemy Attacker (VeryEasy) #000',
	  [2] = '4Enemy Attacker (VeryEasy) #001',
	}
	Attacker_Names_Normalx4 = {
	  [1] = '4Enemy Attacker (Normal) #000',
	  [2] = '4Enemy Attacker (Normal) #001',
	}
	Attacker_Names_Hardx4 = {
	  [1] = '4Enemy Attacker (Hard) #000',
	  [2] = '4Enemy Attacker (Hard) #001',
	}
	Attacker_Names_VeryHardx4 = {
	  [1] = '4Enemy Attacker (VeryHard) #000',
	  [2] = '4Enemy Attacker (VeryHard) #001',
	}
  
  
	------------------------------
	-- End Ground Attack Arrays --
	------------------------------

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

	----------------------------
	-- CAS spawning arrays --
	----------------------------
	-- The following arrays contain available enemy aircraft the Spawn CAS function pulls from

	CAS_Planes = {
	  [1] = 'Tornado GR4 #1',
	  [2] = 'Tornado IDS #1',
	}
	------------------------
	-- End CAS Arrays --
	------------------------

	-- Removes submenus so that reloading the script does not result in duplicate submenus in the list
	-- this was added because of the loading of the script debug option.
	--missionCommands.removeItem({"Mission Info"})
	--missionCommands.removeItem({"Airfield Tasks"})
	--missionCommands.removeItem({"Anapa Tasks"})
	--missionCommands.removeItem({"Maykop Tasks"})
	--missionCommands.removeItem({"Gudauta Tasks"})
	--missionCommands.removeItem({"Kutaisi Tasks"})
	--missionCommands.removeItem({"Nalchik Tasks"})
	--missionCommands.removeItem({"Tbilisi Tasks"})
	--missionCommands.removeItem({"OPFS Settings"})
	--missionCommands.removeItem({"Debug"})
	
	 --variables defining f10 sub-menu items
	Calls = missionCommands.addSubMenu("Mission Info",nil)
	--Airdromes = missionCommands.addSubMenu("Airfield Tasks",nil)

  
  
  
  
  
  
  Creationkit = missionCommands.addSubMenu("Task Creation",nil)
	GameSet = missionCommands.addSubMenu("Set Options",nil)
	--Debug = missionCommands.addSubMenu("Debug",nil)
  
  AnapaPath = missionCommands.addSubMenu("Anapa", Creationkit)
	MaykopPath = missionCommands.addSubMenu("Maykop", Creationkit)
	GudautaPath = missionCommands.addSubMenu("Gudauta", Creationkit)
	KutaisiPath = missionCommands.addSubMenu("Kutaisi", Creationkit)
	NalchikPath = missionCommands.addSubMenu("Nalchik", Creationkit)
	TbilisiPath = missionCommands.addSubMenu("Tbilisi", Creationkit)
  

	--The are sub-menu variables, the parent menu is GameSet
	DifficultySet = missionCommands.addSubMenu("Difficulty", GameSet)
	DistanceSet = missionCommands.addSubMenu("Distance", GameSet)
  FortSet = missionCommands.addSubMenu("Buildings", GameSet)
  SizeSet = missionCommands.addSubMenu("A2A", GameSet)
  ADSet = missionCommands.addSubMenu("AAA", GameSet)
  RadarSamSet = missionCommands.addSubMenu("Radar SAM", GameSet)
  IRSamSet = missionCommands.addSubMenu("IR SAM", GameSet)
  SEADSet = missionCommands.addSubMenu("Friendly SEAD", GameSet)
  eHeloSet = missionCommands.addSubMenu("Enemy Helos", GameSet)
  eAttackSet = missionCommands.addSubMenu("Enemy CAS", GameSet)
  --aHeloSet = missionCommands.addSubMenu("Allied Helo settings", GameSet)
  Combinedarms = missionCommands.addSubMenu("CA", GameSet)
  
  --Combinedarms = missionCommands.addSubMenu("Combined Arms", GameSet)
  
  

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
			
			
	  
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9y, Debug, reloadscript, nil)
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_9z, Debug, Debug_Toggle, nil)
	
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0a, Calls, Bullscall1, nil)
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0b, Calls, Bullscall2, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, Calls, Bullscall3, nil)
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0d, Calls, Bullscall4, nil)
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0e, Calls, Bullscall5, nil)

	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_0c, Calls, BRAcall, nil)
	
	    
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_7a, GameSet, Change_Smoke_Set, nil)
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_2a, Airdromes, Create_Airfield, 'Sochi')
  
  
  --	local rad_option_1a = "Interdict: CAP"
	--local rad_option_1b = "Interdict: Bombers"
	--local rad_option_1c = "Create ground task"
  --local rad_option_1d = "Hunt convoy"
	--local rad_option_1e = "Strike: Facilities"
	--local rad_option_1f = "Strike: Naval"
	  
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, AnapaPath, Create_Fighter_Intercept, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, AnapaPath, Create_Bomber_Intercept, 'Anapa')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, AnapaPath, Create_Attacker_Intercept, 'Anapa')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, AnapaPath, Create_Escort, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, AnapaPath, Create_Mud, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, AnapaPath, Create_Mud_Convoy, 'Anapa')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, AnapaPath, Create_Strike, 'Anapa')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, AnapaPath, Create_Naval, 'OceanNorth')

	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, MaykopPath, Create_Fighter_Intercept, 'Maykop')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, MaykopPath, Create_Bomber_Intercept, 'Maykop')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, MaykopPath, Create_Attacker_Intercept, 'Maykop')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, MaykopPath, Create_Escort, 'Maykop')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, MaykopPath, Create_Mud, 'Maykop')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, MaykopPath, Create_Mud_Convoy, 'Maykop')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, MaykopPath, Create_Strike, 'Maykop')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, MaykopPath, Create_Naval, 'Maykop')
	
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, GudautaPath, Create_Fighter_Intercept, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, GudautaPath, Create_Bomber_Intercept, 'Gudauta')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, GudautaPath, Create_Attacker_Intercept, 'Gudauta')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, GudautaPath, Create_Escort, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, GudautaPath, Create_Mud, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, GudautaPath, Create_Mud_Convoy, 'Gudauta')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1g, GudautaPath, Create_Strike, 'Gudauta')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, GudautaPath, Create_Naval, 'OceanMid')
	
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, KutaisiPath, Create_Fighter_Intercept, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, KutaisiPath, Create_Bomber_Intercept, 'Kutaisi')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, KutaisiPath, Create_Attacker_Intercept, 'Kutaisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, KutaisiPath, Create_Escort, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, KutaisiPath, Create_Mud, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, KutaisiPath, Create_Mud_Convoy, 'Kutaisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, KutaisiPath, Create_Strike, 'Kutaisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, KutaisiPath, Create_Naval, 'OceanSouth')

	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, NalchikPath, Create_Fighter_Intercept, 'Nalchik')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, NalchikPath, Create_Bomber_Intercept, 'Nalchik')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, NalchikPath, Create_Bomber_Intercept, 'Nalchik')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, NalchikPath, Create_Escort, 'Nalchik')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, NalchikPath, Create_Mud, 'Nalchik')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, NalchikPath, Create_Mud_Convoy, 'Nalchik')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, NalchikPath, Create_Strike, 'Nalchik')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, NalchikPath, Create_Naval, 'Nalchik')
	

	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1a, TbilisiPath, Create_Fighter_Intercept, 'Tbilisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1b, TbilisiPath, Create_Bomber_Intercept, 'Tbilisi')
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, TbilisiPath, Create_Attacker_Intercept, 'Tbilisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, TbilisiPath, Create_Escort, 'Tbilisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1c, TbilisiPath, Create_Mud, 'Tbilisi')
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1d, TbilisiPath, Create_Mud_Convoy, 'Tbilisi')
--	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1e, TbilisiPath, Create_Strike, 'Tbilisi')
	--missionCommands.addCommandForGroup(Rad_GroupID, rad_option_1f, TbilisiPath, Create_Naval, 'Tbilisi')
		----------------
	-- Wanks Code --
	----------------
	-- These commands set the function of the radio options in the difficulty sub-menu
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8a, DifficultySet, Set_Difficuty_VeryEasy, nil) -- 'Very Easy'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8b, DifficultySet, Set_Difficuty_Easy, nil) -- 'Easy'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8c, DifficultySet, Set_Difficuty_Normal, nil) -- 'Normal'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8d, DifficultySet, Set_Difficuty_Hard, nil) -- 'Hard'
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_8e, DifficultySet, Set_Difficuty_VeryHard, nil) -- 'Very Hard'
  -- These commands set the function of the radio options in the groupsizes sub-menu
	missionCommands.addCommandForGroup(Rad_GroupID, rad_option_10a, SizeSet, Set_GroupSize_1, nil) -- '1x plane'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_10b, SizeSet, Set_GroupSize_2, nil) -- '2x plane'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_10c, SizeSet, Set_GroupSize_3, nil) -- '4x plane'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_10d, SizeSet, Set_GroupSize_4, nil) -- '8x plane'
  -- These commands set the amount of radar sams the enemy has at a site
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_11a, RadarSamSet, Set_RadarSAM_Threat_1, nil) -- 'No radar SAMs'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_11b, RadarSamSet, Set_RadarSAM_Threat_2, nil) -- 'Short range Radar SAMs'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_11c, RadarSamSet, Set_RadarSAM_Threat_3, nil) -- 'Medium range Radar SAMs'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_11d, RadarSamSet, Set_RadarSAM_Threat_4, nil) -- 'Long range Radar SAMs'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_11e, RadarSamSet, Set_RadarSAM_Threat_5, nil) -- 'Mixed'
  -- These commands set the amount of IR sams the enemy has at a site
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_12a, IRSamSet, Set_IRSAM_Threat_1, nil) -- 'No IR SAMs'
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_12b, IRSamSet, Set_IRSAM_Threat_2, nil) -- 'Vehicle IR SAMs
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_12c, IRSamSet, Set_IRSAM_Threat_3, nil) -- 'Manpads
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_12d, IRSamSet, Set_IRSAM_Threat_4, nil) -- 'Vehicle and Manpads present
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_12e, IRSamSet, Set_IRSAM_Threat_5, nil) -- 'extra vehicle
  -- These commands set if the allied side will have automated AI SEAD for the task
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_13a, SEADSet, Set_SEAD_Level_1, nil) -- 'disabled
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_13b, SEADSet, Set_SEAD_Level_2, nil) -- 'enabled
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_13c, SEADSet, Set_SEAD_Level_3, nil) -- '2 flights
  -- These commands set if the enemy side will have helos
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_14a, eHeloSet, Set_eHelo_Level_1, nil) -- 'disabled
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_14b, eHeloSet, Set_eHelo_Level_2, nil) -- '2 helo
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_14c, eHeloSet, Set_eHelo_Level_3, nil) -- '4 helo
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_14d, eHeloSet, Set_eHelo_Level_4, nil) -- '8 helo
  -- These commands set if the allied side will have helos
  -- These commands set CA options
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_16a, Combinedarms, Set_CACAS_Level_1, nil) -- 'CA disabled
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_16b, Combinedarms, Set_CACAS_Level_2, nil) -- 'CA enabled
    -- These commands set air defense options
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_17a, ADSet, Set_AD_Level_2, nil) -- 'AAA enabled
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_17b, ADSet, Set_AD_Level_1, nil) -- 'AAA disabled
      -- These commands set air defense options
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_18a, FortSet, Set_Fort_Level_2, nil) -- 'AAA enabled
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_18b, FortSet, Set_Fort_Level_1, nil) -- 'AAA disabled
        -- These commands set attacker options
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_19a, eAttackSet, Set_eAttacker_Level_2, nil) -- 'Attackers Disabled
  missionCommands.addCommandForGroup(Rad_GroupID, rad_option_19b, eAttackSet, Set_eAttacker_Level_1, nil) -- 'Attackers Enabled
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

	-----------
	-- Intro --
	-----------
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Introduce_Mission(arg, time)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local msg = {}
	msg.text = ' Chameleon_Silk is proud to present, Operation Flagship... the ongoing alpha Test'
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
	msg.text = ' Spawning difficulty is currently set to '..tostring(Difficulty)
	msg.displayTime = 45
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	local msg = {} 
	msg.text = ' Task spawn distance has been set to '..tostring(Range)
	msg.displayTime = 45
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
  
  local msg = {} 
	msg.text = ' PLEASE CONSULT AN ADMIN BEFORE CREATING ANY TASKS FOR YOURSELF'
	msg.displayTime = 180
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
	return
	end
	---
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Fighter_Intercept(_Area)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- based off of Kutaisi Intercept script by akp, but modified for my own use.
	zone = trigger.misc.getZone(_Area)
	local rand = mist.random(1,Fighter_Names)
	intercepttask = 1

  if Groupsizes == 1 and Difficultymod == 1 then
	    grpName = Fighter_Names_VeryEasy[rand]
	  end
		
		if Difficultymod == 2 and Difficultymod == 2 then
	    grpName = Fighter_Names_Easy[rand]
	  end

	  if Difficultymod == 3 and Difficultymod == 3 then
	    grpName = Fighter_Names_Normal[rand]
	  end

	  if Difficultymod == 4 and Difficultymod == 4 then
	    grpName = Fighter_Names_Hard[rand]
	  end
		
		if Difficultymod == 5 and Difficultymod == 5 then
	    grpName = Fighter_Names_VeryHard[rand]
	  end
  
  
  if Groupsizes == 2 and Difficultymod == 1 then
	    grpName = Fighter_Names_VeryEasyx2[rand]
	  end

		if Difficultymod == 2 and Difficultymod == 2 then
	    grpName = Fighter_Names_Easyx2[rand]
	  end

	  if Difficultymod == 3 and Difficultymod == 3 then
	    grpName = Fighter_Names_Normalx2[rand]
	  end

	  if Difficultymod == 4 and Difficultymod == 4 then
	    grpName = Fighter_Names_Hardx2[rand]
	  end
		
		if Difficultymod == 5 and Difficultymod == 5 then
	    grpName = Fighter_Names_VeryHardx2[rand]
	  end
  
  
  if Groupsizes == 3 and Difficultymod == 1 then
	    grpName = Fighter_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 2 then
	    grpName = Fighter_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 3 then
	    grpName = Fighter_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 4 then
	    grpName = Fighter_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 5 then
	    grpName = Fighter_Names_VeryEasyx4[rand]
	  end
    
    	      
  if Groupsizes == 4 and Difficultymod == 1 then
      grpName = Fighter_Names_VeryEasyx4[rand]
	    grpName2 = Fighter_Names_VeryEasyx8[rand]
	  end

		
		if Groupsizes == 4 and Difficultymod == 2 then
    grpName = Fighter_Names_Easyx4[rand]
	    grpName2 = Fighter_Names_Easyx8[rand]
	  end

	  if Groupsizes == 4 and Difficultymod == 3 then
    grpName = Fighter_Names_Normalx4[rand]
	    grpName2 = Fighter_Names_Normalx8[rand]
	  end

	  if Groupsizes == 4 and Difficultymod == 4 then
    grpName = Fighter_Names_Hardx4[rand]
	    grpName2 = Fighter_Names_Hardx8[rand]
	  end
		
		if Groupsizes == 4 and Difficultymod == 5 then
    grpName = Fighter_Names_VeryHardx4[rand]
	    grpName2 = Fighter_Names_VeryHardx8[rand]
	  end
	  
  
  


   
      	local msg = {} 
	msg.text = ' Plane selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	  spawnPsn = {}
    

	  if Task_Range == 1 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 0.60, zone.radius * 0.40)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
	  end

	  if Task_Range == 2 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 0.70, zone.radius * 0.60)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
	  end

	  if Task_Range == 3 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 0.80, zone.radius * 0.70)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
	  end

	  if Task_Range == 4 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 0.90, zone.radius * 0.80)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
		if Task_Range == 5 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.00, zone.radius * 0.90)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
	  if Task_Range == 6 then
	    spawnPsn = mist.getRandPointInCircle(zone.point, zone.radius * 1.50, zone.radius * 1.00)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
    
      	local msg = {} 
	msg.text = ' Spawn position selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	trigger.action.activateGroup(Group.getByName(grpName))
	grp = Group.getByName(grpName)
	
	local InitwpSpeed = mist.random(600,700)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = mist.random(4000,7000)
	local wpPsn = mist.getRandPointInCircle(spawnPsn, zone.radius * 0.15, zone.radius * 0.01)
	local wpPsn2 = mist.getRandPointInCircle(zone.point, 15000)
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
      
        	local msg = {} 
	msg.text = ' Path created.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
      
		
	local vars = {} 
	vars.groupName = grpName
	vars.action = "respawn"
	vars.point = spawnPsn
	vars.route = path
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' Plane spawned.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	--loops_through = loops_through + 1	
	
	--local vars = {} 
	--vars.groupName = grpName
	--vars.action = "respawn"
	--vars.point = spawnPsn
	--vars.route = path
	--mist.teleportToPoint(vars)			

	local con = grp:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
  
  
  if Groupsizes == 4  then
  
        	local msg = {} 
	msg.text = ' 2nd Plane selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
  
  spawnPsn2 = {}
    

	  if Task_Range == 1 then
	    spawnPsn2 = mist.getRandPointInCircle(zone.point, zone.radius * 0.75, zone.radius * 0.40)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
	  end

	  if Task_Range == 2 then
	    spawnPsn2 = mist.getRandPointInCircle(zone.point, zone.radius * 1.00, zone.radius * 0.75)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
	  end

	  if Task_Range == 3 then
	    spawnPsn2 = mist.getRandPointInCircle(zone.point, zone.radius * 1.25, zone.radius * 1.00)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
	  end

	  if Task_Range == 4 then
	    spawnPsn2 = mist.getRandPointInCircle(zone.point, zone.radius * 1.50, zone.radius * 1.25)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
		if Task_Range == 5 then
	    spawnPsn2 = mist.getRandPointInCircle(zone.point, zone.radius * 1.75, zone.radius * 1.50)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
	  if Task_Range == 6 then
	    spawnPsn2 = mist.getRandPointInCircle(zone.point, zone.radius * 2.00, zone.radius * 1.75)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
  
  
  trigger.action.activateGroup(Group.getByName(grpName2))
	grp2 = Group.getByName(grpName2)
	
	local InitwpSpeed = mist.random(600,700)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = mist.random(4000,5000)
	local wpPsn = mist.getRandPointInCircle(spawnPsn2, zone.radius * 0.15, zone.radius * 0.01)
	local wpPsn2 = mist.getRandPointInCircle(spawnPsn2, zone.radius * 2.00, zone.radius * 1.50)
  local path = {}
					path[1] = mist.fixedWing.buildWP(wpPsn, wpSpeed, wpAlt, "BARO")
					path[2] = mist.fixedWing.buildWP(wpPsn2, wpSpeed, wpAlt,"BARO")
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
      
        	local msg = {} 
	msg.text = ' Path created.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
      
		
	local vars = {} 
	vars.groupName = grpName2
	vars.action = "respawn"
	vars.point = wpPsn
	vars.route = path
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' Plane spawned.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	--loops_through = loops_through + 1	
	
	--local vars = {} 
	--vars.groupName = grpName
	--vars.action = "respawn"
	--vars.point = spawnPsn
	--vars.route = path
	--mist.teleportToPoint(vars)			

	local con = grp2:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
  end
		
	--checkunits4 = {
	--groupName = grpName,
	--percent = 40,
	--flag = 401,
	--stopFlag = 402,
	--toggle = true,
	--}
	--mist.flagFunc.group_alive_less_than(checkunits4)
  


	trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')
  
  	local msg = {} 
	msg.text = ' Intercept task has been created, search and destroy target.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	end

	---
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Bomber_Intercept(_bArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- based off of Kutaisi Intercept script by akp, but modified for my own use.
	bzone = trigger.misc.getZone(_bArea)
	bombertask = 1
	bspawnPsn = {}
	espawnPsn = {}
	bpath = {}
	epath = {}
	
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
	
	if Groupsizes == 1 then
      if Difficultymod == 1 then
		bgrpName = Bomber_Names_Easy[brand]
		egrpName = Fighter_Names_VeryEasy[erand]
	end

		if Difficultymod == 2 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Easy[erand]
	end
  
  if Difficultymod == 3 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Normal[erand]
	end

	if Difficultymod == 4 then
		bgrpName = Bomber_Names_Hard[brand]
		egrpName = Fighter_Names_Hard[erand]
	end
	
	if Difficultymod == 5 then
		bgrpName = Bomber_Names_VeryHard[brand]
		egrpName = Fighter_Names_VeryHard[erand]
	end
end

	if Groupsizes == 2 then
      if Difficultymod == 1 then
		bgrpName = Bomber_Names_Easy[brand]
		egrpName = Fighter_Names_VeryEasyx2[erand]
	end

		if Difficultymod == 2 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Easyx2[erand]
	end
  
  if Difficultymod == 3 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Normalx2[erand]
	end

	if Difficultymod == 4 then
		bgrpName = Bomber_Names_Hard[brand]
		egrpName = Fighter_Names_Hardx2[erand]
	end
	
	if Difficultymod == 5 then
		bgrpName = Bomber_Names_VeryHard[brand]
		egrpName = Fighter_Names_VeryHardx2[erand]
	end
end

	if Groupsizes == 3 then
      if Difficultymod == 1 then
		bgrpName = Bomber_Names_Easy[brand]
		egrpName = Fighter_Names_VeryEasyx4[erand]
	end

		if Difficultymod == 2 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Easyx4[erand]
	end
  
  if Difficultymod == 3 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Normalx4[erand]
	end

	if Difficultymod == 4 then
		bgrpName = Bomber_Names_Hard[brand]
		egrpName = Fighter_Names_Hardx4[erand]
	end
	
	if Difficultymod == 5 then
		bgrpName = Bomber_Names_VeryHard[brand]
		egrpName = Fighter_Names_VeryHardx4[erand]
	end
end

	if Groupsizes == 3 then
      if Difficultymod == 1 then
		bgrpName = Bomber_Names_Easy[brand]
		egrpName = Fighter_Names_VeryEasyx4[erand]
	end

		if Difficultymod == 2 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Easyx4[erand]
	end
  
  if Difficultymod == 3 then
		bgrpName = Bomber_Names_Normal[brand]
		egrpName = Fighter_Names_Normalx4[erand]
	end

	if Difficultymod == 4 then
		bgrpName = Bomber_Names_Hard[brand]
		egrpName = Fighter_Names_Hardx4[erand]
	end
	
	if Difficultymod == 5 then
		bgrpName = Bomber_Names_VeryHard[brand]
		egrpName = Fighter_Names_VeryHardx4[erand]
	end
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
	local bwpAlt = mist.random(3500,7000)
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
	}			bpath[1].ETA_locked = false
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
	  local ewpAlt = mist.random(4000,6000)
	  
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

		

		local checkunits5 = {
		groupName = bgrpName,
		percent = 40,
		flag = 501,
		stopFlag = 502,
		 toggle = true,
	 }
	 mist.flagFunc.group_alive_less_than(checkunits5)

	 --return
	end
	---
  
   ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Attacker_Intercept(_cArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- based off of Kutaisi Intercept script by akp, but modified for my own use.
	azone = trigger.misc.getZone(_cArea)
	local rand = mist.random(1,Attacker_Names)
	intercepttask = 1

  if Groupsizes == 1 and Difficultymod == 1 then
	    grpNameA = Attacker_Names_VeryEasy[rand]
	  end
		
		if Difficultymod == 2 and Difficultymod == 2 then
	    grpNameA = Attacker_Names_Easy[rand]
	  end

	  if Difficultymod == 3 and Difficultymod == 3 then
	    grpNameA = Attacker_Names_Normal[rand]
	  end

	  if Difficultymod == 4 and Difficultymod == 4 then
	    grpNameA = Attacker_Names_Hard[rand]
	  end
		
		if Difficultymod == 5 and Difficultymod == 5 then
	    grpNameA = Attacker_Names_VeryHard[rand]
	  end
  
  
  if Groupsizes == 2 and Difficultymod == 1 then
	    grpNameA = Attacker_Names_VeryEasyx2[rand]
	  end

		if Difficultymod == 2 and Difficultymod == 2 then
	    grpNameA = Attacker_Names_Easyx2[rand]
	  end

	  if Difficultymod == 3 and Difficultymod == 3 then
	    grpNameA = Attacker_Names_Normalx2[rand]
	  end

	  if Difficultymod == 4 and Difficultymod == 4 then
	    grpNameA = Attacker_Names_Hardx2[rand]
	  end
		
		if Difficultymod == 5 and Difficultymod == 5 then
	    grpNameA = Attacker_Names_VeryHardx2[rand]
	  end
  
  
  if Groupsizes == 3 and Difficultymod == 1 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 2 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 3 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 4 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 5 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
    	      
  if Groupsizes == 4 and Difficultymod == 1 then
      grpNameA = Attacker_Names_VeryEasyx4[rand]
	    grpName2A = Attacker_Names_VeryEasyx2[rand]
	  end

		
		if Groupsizes == 4 and Difficultymod == 2 then
    grpNameA = Attacker_Names_Easyx4[rand]
	    grpName2A = Attacker_Names_Easyx2[rand]
	  end

	  if Groupsizes == 4 and Difficultymod == 3 then
    grpNameA = Attacker_Names_Normalx4[rand]
	    grpName2A = Attacker_Names_Normalx2[rand]
	  end

	  if Groupsizes == 4 and Difficultymod == 4 then
    grpNameA = Attacker_Names_Hardx4[rand]
	    grpName2A = Attacker_Names_Hardx2[rand]
	  end
		
		if Groupsizes == 4 and Difficultymod == 5 then
    grpNameA = Attacker_Names_VeryHardx4[rand]
	    grpName2A = Attacker_Names_VeryHardx2[rand]
	  end
	  
  
  


   
      	local msg = {} 
	msg.text = ' Attacker selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	  spawnPsn = {}
    

	  if Task_Range == 1 then
	    spawnPsn = mist.getRandPointInCircle(azone.point, azone.radius * 0.60, azone.radius * 0.40)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
	  end

	  if Task_Range == 2 then
	    spawnPsn = mist.getRandPointInCircle(azone.point, azone.radius * 0.70, azone.radius * 0.60)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
	  end

	  if Task_Range == 3 then
	    spawnPsn = mist.getRandPointInCircle(azone.point, azone.radius * 0.80, azone.radius * 0.70)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
	  end

	  if Task_Range == 4 then
	    spawnPsn = mist.getRandPointInCircle(azone.point, azone.radius * 0.90, azone.radius * 0.80)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
		if Task_Range == 5 then
	    spawnPsn = mist.getRandPointInCircle(azone.point, azone.radius * 1.00, azone.radius * 0.90)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
	  if Task_Range == 6 then
	    spawnPsn = mist.getRandPointInCircle(azone.point, azone.radius * 1.50, azone.radius * 1.00)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
    
      	local msg = {} 
	msg.text = ' Spawn position selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	trigger.action.activateGroup(Group.getByName(grpNameA))
	agrp = Group.getByName(grpNameA)
	
	local InitwpSpeed = mist.random(500,700)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = mist.random(2000,3500)
	local wpPsn = mist.getRandPointInCircle(spawnPsn, azone.radius * 0.15, azone.radius * 0.01)
	local wpPsn2 = mist.getRandPointInCircle(spawnPsn, azone.radius * 2.00, azone.radius * 1.50)
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
	            key = "CAS",
	            params = {
	              targetTypes = {
                      [1] = "Ground Units",
                      [2] = "Air",
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
      
        	local msg = {} 
	msg.text = ' Path created.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
      
		
	local vars = {} 
	vars.groupName = grpNameA
	vars.action = "respawn"
	vars.point = spawnPsn
	vars.route = path
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' Plane spawned.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	--loops_through = loops_through + 1	
	
	--local vars = {} 
	--vars.groupName = grpName
	--vars.action = "respawn"
	--vars.point = spawnPsn
	--vars.route = path
	--mist.teleportToPoint(vars)			

	local con = agrp:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
  
  
  if Groupsizes == 4  then
  
        	local msg = {} 
	msg.text = ' 2nd Plane selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
  
  spawnPsn2 = {}
    

	  if Task_Range == 1 then
	    spawnPsn2 = mist.getRandPointInCircle(azone.point, azone.radius * 0.75, azone.radius * 0.40)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'scramble.ogg')
	  end

	  if Task_Range == 2 then
	    spawnPsn2 = mist.getRandPointInCircle(azone.point, azone.radius * 1.00, azone.radius * 0.75)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'standard.ogg')
	  end

	  if Task_Range == 3 then
	    spawnPsn2 = mist.getRandPointInCircle(azone.point, azone.radius * 1.25, azone.radius * 1.00)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'far.ogg')
	  end

	  if Task_Range == 4 then
	    spawnPsn2 = mist.getRandPointInCircle(azone.point, azone.radius * 1.50, azone.radius * 1.25)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
		if Task_Range == 5 then
	    spawnPsn2 = mist.getRandPointInCircle(azone.point, azone.radius * 1.75, azone.radius * 1.50)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
		
	  if Task_Range == 6 then
	    spawnPsn2 = mist.getRandPointInCircle(azone.point, azone.radius * 2.00, azone.radius * 1.75)
			trigger.action.outSoundForCoalition(coalition.side.RED, 'veryfar.ogg')
	  end
  
  
  trigger.action.activateGroup(Group.getByName(grpName2A))
	agrp2 = Group.getByName(grpName2A)
	
	local InitwpSpeed = mist.random(500,700)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = mist.random(2000,3750)
	local wpPsn = mist.getRandPointInCircle(spawnPsn2, azone.radius * 0.15, azone.radius * 0.01)
	local wpPsn2 = mist.getRandPointInCircle(spawnPsn2, azone.radius * 2.00, azone.radius * 1.50)
  local path = {}
					path[1] = mist.fixedWing.buildWP(wpPsn, wpSpeed, wpAlt, "BARO")
					path[2] = mist.fixedWing.buildWP(wpPsn2, wpSpeed, wpAlt,"BARO")
					path[1].task = {
					id = "ComboTask",
					params = {
						tasks = {
							[1] = {
	            number = 1,
	            auto = true,
	            id = "EngageTargets",
	            enabled = true,
	            key = "CAS",
	            params = {
	              targetTypes = {
	                [1] = "Ground Units",
                  [2] = "Air",
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
      
        	local msg = {} 
	msg.text = ' Path created.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
      
		
	local vars = {} 
	vars.groupName = grpName2A
	vars.action = "respawn"
	vars.point = wpPsn
	vars.route = path
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' Plane spawned.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	--loops_through = loops_through + 1	
	
	--local vars = {} 
	--vars.groupName = grpName
	--vars.action = "respawn"
	--vars.point = spawnPsn
	--vars.route = path
	--mist.teleportToPoint(vars)			

	local con = agrp2:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
  end
		
	--checkunits4 = {
	--groupName = grpName,
	--percent = 40,
	--flag = 401,
	--stopFlag = 402,
	--toggle = true,
	--}
	--mist.flagFunc.group_alive_less_than(checkunits4)
  


	trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')
  
  	local msg = {} 
	msg.text = ' Attacker intercept task has been created, search and destroy target.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	end

	---
 
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Mud(_mArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	mzone = trigger.misc.getZone(_mArea)
	local mrand = mist.random(1,Mud_Names)
  local randradsam = mist.random(1,Radar_SAM)
  local randirsam = mist.random(1,IR_SAM)
   local seadrand = mist.random(1,SEAD_Names)
   local attackrand = mist.random(1,Attacker_Names)
   local ehelorand = mist.random(1,Enemy_Helo_Names)
   	local mrandred = mist.random(1, Red_CAS_Names)
    local pickedAD = mist.random(1, AD_Groups)
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
	local RadarSamName = {}
  local RadarSamName2 = {}
  local RadarSamName3 = {}
  local IRSamName = {}
  local IRSamName2 = {}
  local IRSamName3 = {}
  local eHeloName = {}
  local aHeloName = {}
  local aHeloName2 = {}
  local MudREDCASName = {}
  local ADName = {}
  local attackName = {}
  local attackName2 = {}
  
	

	--if MudName ==  then
		local msg = {}
	  msg.text = ' Creating ground attack task.'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	

	if Difficultymod == 1 then
	  MudName = Mud_VeryEasy[mrand]
		InfName1 = Infantry_VeryEasy[1]
		InfName2 = Infantry_VeryEasy[2]
		InfName3 = Infantry_VeryEasy[3]
		InfName4 = Infantry_VeryEasy[4]
		InfName5 = Infantry_VeryEasy[5]
    MudREDCASName = MudREDCAS_VeryEasy[mrandred]
    ADName = AD_VeryEasy[pickedAD]
	end

	if Difficultymod == 2 then
	  MudName = Mud_Easy[mrand]
		InfName1 = Infantry_Easy[1]
		InfName2 = Infantry_Easy[2]
		InfName3 = Infantry_Easy[3]
		InfName4 = Infantry_Easy[4]
		InfName5 = Infantry_Easy[5]
    MudREDCASName = MudREDCAS_Easy[mrandred]
    ADName = AD_Easy[pickedAD]
	end

	if Difficultymod == 3 then
	  MudName = Mud_Normal[mrand]
		InfName1 = Infantry_Normal[1]
		InfName2 = Infantry_Normal[2]
		InfName3 = Infantry_Normal[3]
		InfName4 = Infantry_Normal[4]
		InfName5 = Infantry_Normal[5]
    MudREDCASName = MudREDCAS_Normal[mrandred]
    ADName = AD_Normal[pickedAD]
	end

	if Difficultymod == 4 then
	  MudName = Mud_Hard[mrand]
		InfName1 = Infantry_Hard[1]
		InfName2 = Infantry_Hard[2]
		InfName3 = Infantry_Hard[3]
		InfName4 = Infantry_Hard[4]
		InfName5 = Infantry_Hard[5]
    MudREDCASName = MudREDCAS_Hard[mrandred]
    ADName = AD_Hard[pickedAD]
	end
	
	if Difficultymod == 5 then
	  MudName = Mud_VeryHard[mrand]
		InfName1 = Infantry_VeryHard[1]
		InfName2 = Infantry_VeryHard[2]
		InfName3 = Infantry_VeryHard[3]
		InfName4 = Infantry_VeryHard[4]
		InfName5 = Infantry_VeryHard[5]
    MudREDCASName = MudREDCAS_VeryHard[mrandred]
    ADName = AD_VeryHard[pickedAD]
	end
  
      if Samradar == 1 then
      RadarSamName = ""
      RadarSameName2 = ""
      RadarSameName3 = ""
      end
  
  
      if Samradar == 2 then
    RadarSamName = Sam_Radar_Threat_2[randradsam]
 --   local RadSamGrpData = mist.getGroupData(RadarSamName)
  end
  
  
  if Samradar == 3 then
    RadarSamName = Sam_Radar_Threat_3[randradsam]
 -- local RadSamGrpData = mist.getGroupData(RadarSamName)
  end
  
  if Samradar == 4 then
    RadarSamName = Sam_Radar_Threat_4[randradsam]
    --local RadSamGrpData = mist.getGroupData(RadarSamName)
    --local RadSamGrpData2 = mist.getGroupData(RadarSamName2)
  end
  
    if Samradar == 5 then
    RadarSamName3 = Sam_Radar_Threat_4[randradsam]
    RadarSamName2 = Sam_Radar_Threat_3[randradsam]
    RadarSamName = Sam_Radar_Threat_2[randradsam]
    --local RadSamGrpData = mist.getGroupData(RadarSamName)
    --local RadSamGrpData2 = mist.getGroupData(RadarSamName2)
  end
  
  if Saminfared == 1 then
      IRSamName = ""
      IRSamName2 = ""
      IRSamName3 = ""
      end
  
    if Saminfared == 2 then
    IRSamName = Sam_IR_Threat_2[randirsam]
    --local IRSamGrpData = mist.getGroupData(IRSamName)
  end
  
  if Saminfared == 3 then
    IRSamName = Sam_IR_Threat_3[randirsam]
    --local IRSamGrpData = mist.getGroupData(IRSamName)
  end
  
  if Saminfared == 4 then
  IRSamName2 = Sam_IR_Threat_2[randirsam]
  IRSamName = Sam_IR_Threat_3[randirsam]
 -- local IRSamGrpData = mist.getGroupData(IRSamName)
 -- local IRSamGrpData2 = mist.getGroupData(IRSamName2)
  end
  
    if Saminfared == 5 then
  IRSamName3 = Sam_IR_Threat_4[randirsam]
  IRSamName2 = Sam_IR_Threat_2[randirsam]
  IRSamName = Sam_IR_Threat_3[randirsam]
 -- local IRSamGrpData = mist.getGroupData(IRSamName)
 -- local IRSamGrpData2 = mist.getGroupData(IRSamName2)
  end
  

    
    
 
    
    
    
    
    
    if eHelo == 2 and Difficultymod == 1 then
      eHeloName = Enemy_Helo_Names_VeryEasy2x[ehelorand]
      end
      
      if eHelo == 2 and Difficultymod == 2 then
      eHeloName = Enemy_Helo_Names_Easy2x[ehelorand]
      end
      
      if eHelo == 2 and Difficultymod == 3 then
      eHeloName = Enemy_Helo_Names_Normal2x[ehelorand]
      end
      
      if eHelo == 2 and Difficultymod == 4 then
      eHeloName = Enemy_Helo_Names_Hard2x[ehelorand]
      end
      
      if eHelo == 2 and Difficultymod == 5 then
      eHeloName = Enemy_Helo_Names_VeryHard2x[ehelorand]
      end
    
    
    
    
    if eHelo == 3 and Difficultymod == 1 then
      eHeloName = Enemy_Helo_Names_VeryEasy4x[ehelorand]
      end
      
       if eHelo == 3 and Difficultymod == 2 then
      eHeloName = Enemy_Helo_Names_Easy4x[ehelorand]
      end
      
       if eHelo == 3 and Difficultymod == 3 then
      eHeloName = Enemy_Helo_Names_Normal4x[ehelorand]
      end
      
       if eHelo == 3 and Difficultymod == 4 then
      eHeloName = Enemy_Helo_Names_Hard4x[ehelorand]
      end
      
       if eHelo == 3 and Difficultymod == 5 then
      eHeloName = Enemy_Helo_Names_VeryHard4x[ehelorand]
      end
    
    
        if eHelo == 4 and Difficultymod == 1 then
      eHeloName = Enemy_Helo_Names_VeryEasy4x[ehelorand]
      eHeloName2 = Enemy_Helo_Names_VeryEasy8x[ehelorand]
      end
      
      if eHelo == 4 and Difficultymod == 2 then
      eHeloName = Enemy_Helo_Names_Easy4x[ehelorand]
      eHeloName2 = Enemy_Helo_Names_Easy8x[ehelorand]
      end
      
      if eHelo == 4 and Difficultymod == 3 then
      eHeloName = Enemy_Helo_Names_Normal4x[ehelorand]
      eHeloName2 = Enemy_Helo_Names_Normal8x[ehelorand]
      end
      
      if eHelo == 4 and Difficultymod == 4 then
      eHeloName = Enemy_Helo_Names_Hard4x[ehelorand]
      eHeloName2 = Enemy_Helo_Names_Hard8x[ehelorand]
      end
      
      if eHelo == 4 and Difficultymod == 5 then
      eHeloName = Enemy_Helo_Names_VeryHard4x[ehelorand]
      eHeloName2 = Enemy_Helo_Names_VeryHard8x[ehelorand]
      end
      

            
    
    
   local distran = mist.random(10000,17500)
   local minran = mist.random(7500,10000)
   
   local distran2 = mist.random(42500,65000)
   local minran2 = mist.random(39000,42500)
   
   local heloran = mist.random(1, 1000)
   local heloran2 = mist.random(1, 1000)

  
	for i = 1, 1000 do
	    if Task_Range == 1 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.35, mzone.radius * 0.25)
        samPsn = mist.getRandPointInCircle(mudPsn, distran, minran)
        samPsn2 = mist.getRandPointInCircle(mudPsn, distran2, minran2)
        seadPsn = mist.getRandPointInCircle(mzone.point, 0)
        heloPsn = mudPsn
        heloPsn2 = mist.getRandPointInCircle(heloPsn, heloran)
        heloPsn3 = mist.getRandPointInCircle(heloPsn, heloran2)
	    elseif Task_Range == 2 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.55, mzone.radius * 0.35)
        samPsn = mist.getRandPointInCircle(mudPsn, distran, minran)
        samPsn2 = mist.getRandPointInCircle(mudPsn, distran2, minran2)
         seadPsn = mist.getRandPointInCircle(mzone.point, 0)
         heloPsn = mudPsn
         heloPsn2 = mist.getRandPointInCircle(heloPsn, heloran)
         heloPsn3 = mist.getRandPointInCircle(heloPsn, heloran2)
	    elseif Task_Range == 3 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.75, mzone.radius * 0.55)
        samPsn = mist.getRandPointInCircle(mudPsn, distran, minran)
        samPsn2 = mist.getRandPointInCircle(mudPsn, distran2, minran2)
         seadPsn = mist.getRandPointInCircle(mzone.point, 0)
         heloPsn = mudPsn
         heloPsn2 = mist.getRandPointInCircle(heloPsn, heloran)
         heloPsn3 = mist.getRandPointInCircle(heloPsn, heloran2)
	    elseif Task_Range == 4 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.90, mzone.radius * 0.75)		
        samPsn = mist.getRandPointInCircle(mudPsn, distran, minran)
        samPsn2 = mist.getRandPointInCircle(mudPsn, distran2, minran2)
         seadPsn = mist.getRandPointInCircle(mzone.point, 0)
         heloPsn = mudPsn
         heloPsn2 = mist.getRandPointInCircle(heloPsn, heloran)
         heloPsn3 = mist.getRandPointInCircle(heloPsn, heloran2)
			elseif Task_Range == 5 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.15, mzone.radius * 0.90)
        samPsn = mist.getRandPointInCircle(mudPsn, distran, minran)
        samPsn2 = mist.getRandPointInCircle(mudPsn, distran2, minran2)
         seadPsn = mist.getRandPointInCircle(mzone.point, 0)
         heloPsn = mudPsn
         heloPsn2 = mist.getRandPointInCircle(heloPsn, heloran)
         heloPsn3 = mist.getRandPointInCircle(heloPsn, heloran2)
			elseif Task_Range == 6 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.35, mzone.radius * 1.15)
        samPsn = mist.getRandPointInCircle(mudPsn, distran, minran)
        samPsn2 = mist.getRandPointInCircle(mudPsn, distran2, minran2)
         seadPsn = mist.getRandPointInCircle(mzone.point, 200)
         heloPsn = mudPsn
         heloPsn2 = mist.getRandPointInCircle(heloPsn, heloran)
         heloPsn3 = mist.getRandPointInCircle(heloPsn, heloran2)
			end
      
    
			
								if mist.isTerrainValid(mudPsn, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 19) < 4 then
          if mist.isTerrainValid(samPsn, {'LAND'}) == true and mist.terrainHeightDiff(samPsn, 19) < 8 then
          if mist.isTerrainValid(samPsn2, {'LAND'}) == true and mist.terrainHeightDiff(samPsn2, 19) < 8 then
          break

          end
					end
          end
		end
          
		
    
    local msg = {}
	  msg.text = ' Suitable Spawn Located... Keep in mind some are better then others.'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
    
    

    
    
    
    
    		local MudGrpData = mist.getGroupData(MudName)
    


		local mvars = {}
	  mvars.groupName = MudName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
    --mvars.groupId = mist.random(9999, 9999999)
	  mvars.maxDisp = 285
	  mvars.radius = 0
    mvars.innerRadius = 50
		mist.teleportToPoint(mvars)
		
--		formisttable = ''
		targets = mist.makeUnitTable({'[g]' .. MudName})
    
    
      
            AddOP(MudName) -- add MBOT to it
		random_markers(MudName, 50, 500, "Red", 480, 1800)	
  		

        		local msg = {}
	  msg.text = ' Enemy ground forces spawned.'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
    ---------------------------
    
    
          if eAttack == 2 then
      -- based off of Kutaisi Intercept script by akp, but modified for my own use.
	
  
 airzone = trigger.misc.getZone("Enemyair")
  
	local rand = mist.random(1,Attacker_Names)
	intercepttask = 1

  if Groupsizes == 1 and Difficultymod == 1 then
	    grpNameA = Attacker_Names_VeryEasy[rand]
	  end
		
		if Difficultymod == 2 and Difficultymod == 2 then
	    grpNameA = Attacker_Names_Easy[rand]
	  end

	  if Difficultymod == 3 and Difficultymod == 3 then
	    grpNameA = Attacker_Names_Normal[rand]
	  end

	  if Difficultymod == 4 and Difficultymod == 4 then
	    grpNameA = Attacker_Names_Hard[rand]
	  end
		
		if Difficultymod == 5 and Difficultymod == 5 then
	    grpNameA = Attacker_Names_VeryHard[rand]
	  end
  
  
  if Groupsizes == 2 and Difficultymod == 1 then
	    grpNameA = Attacker_Names_VeryEasyx2[rand]
	  end

		if Difficultymod == 2 and Difficultymod == 2 then
	    grpNameA = Attacker_Names_Easyx2[rand]
	  end

	  if Difficultymod == 3 and Difficultymod == 3 then
	    grpNameA = Attacker_Names_Normalx2[rand]
	  end

	  if Difficultymod == 4 and Difficultymod == 4 then
	    grpNameA = Attacker_Names_Hardx2[rand]
	  end
		
		if Difficultymod == 5 and Difficultymod == 5 then
	    grpNameA = Attacker_Names_VeryHardx2[rand]
	  end
  
  
  if Groupsizes == 3 and Difficultymod == 1 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 2 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 3 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 4 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
      if Groupsizes == 3 and Difficultymod == 5 then
	    grpNameA = Attacker_Names_VeryEasyx4[rand]
	  end
    
    	      
  if Groupsizes == 4 and Difficultymod == 1 then
      grpNameA = Attacker_Names_VeryEasyx4[rand]
	    grpName2A = Attacker_Names_VeryEasyx2[rand]
	  end

		
		if Groupsizes == 4 and Difficultymod == 2 then
    grpNameA = Attacker_Names_Easyx4[rand]
	    grpName2A = Attacker_Names_Easyx2[rand]
	  end

	  if Groupsizes == 4 and Difficultymod == 3 then
    grpNameA = Attacker_Names_Normalx4[rand]
	    grpName2A = Attacker_Names_Normalx2[rand]
	  end

	  if Groupsizes == 4 and Difficultymod == 4 then
    grpNameA = Attacker_Names_Hardx4[rand]
	    grpName2A = Attacker_Names_Hardx2[rand]
	  end
		
		if Groupsizes == 4 and Difficultymod == 5 then
    grpNameA = Attacker_Names_VeryHardx4[rand]
	    grpName2A = Attacker_Names_VeryHardx2[rand]
	  end
	  
  
  


   
      	local msg = {} 
	msg.text = ' Attacker selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	  spawnPsn = {}
    
      for i = 1, 1000 do
      spawnPsn = mist.getRandPointInCircle(airzone.point, airzone.radius * 1.00)
      InZone = mist.pointInPolygon(spawnPsn, mist.getGroupPoints('Border')) 
      if InZone == true then break
      end
      end
    
      	local msg = {} 
	msg.text = ' Spawn position selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	trigger.action.activateGroup(Group.getByName(grpNameA))
	agrp = Group.getByName(grpNameA)
	
	local InitwpSpeed = mist.random(600,700)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = mist.random(1000,4000)
	local wpPsn = mist.getRandPointInCircle(spawnPsn, 10000)
	local wpPsn2 = mist.getRandPointInCircle(mudPsn, 5000)
  local path = {}
					path[1] = mist.fixedWing.buildWP(spawnPsn, wpSpeed, wpAlt, "BARO")
					path[2] = mist.fixedWing.buildWP(wpPsn2, wpSpeed, wpAlt, "BARO")
					path[1].task = {
					id = "ComboTask",
					params = {
						tasks = {
							[1] = {
	            number = 1,
	            auto = true,
	            id = "EngageTargets",
	            enabled = true,
	            key = "CAS",
	            params = {
	              targetTypes = {
                      [1] = "Ground Units",
                      [2] = "Air",
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
      
        	local msg = {} 
	msg.text = ' Path created.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
      
		
	local vars = {} 
	vars.groupName = grpNameA
	vars.action = "respawn"
	vars.point = spawnPsn
	vars.route = path
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' Plane spawned.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	--loops_through = loops_through + 1	
	
	--local vars = {} 
	--vars.groupName = grpName
	--vars.action = "respawn"
	--vars.point = spawnPsn
	--vars.route = path
	--mist.teleportToPoint(vars)			

	local con = agrp:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
  
  
  if Groupsizes == 4  then
  
        	local msg = {} 
	msg.text = ' 2nd Plane selected.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
  
  spawnPsn2 = {}
    

      for i = 1, 1000 do
      spawnPsn2 = mist.getRandPointInCircle(azone.point, azone.radius * 1.00)
      local InZone2 = mist.pointInPolygon(point, mist.getGroupPoints('Border')) 
      if InZone2 == true then break
      end
      end
  
  
  trigger.action.activateGroup(Group.getByName(grpName2A))
	agrp2 = Group.getByName(grpName2A)
	
	local InitwpSpeed = mist.random(600,700)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = mist.random(1000,4000)
	local wpPsn = mist.getRandPointInCircle(spawnPsn2, 5000)
	local wpPsn2 = mist.getRandPointInCircle(mudPsn, 10000)
  local path = {}
					path[1] = mist.fixedWing.buildWP(wpPsn, wpSpeed, wpAlt, "BARO")
					path[2] = mist.fixedWing.buildWP(wpPsn2, wpSpeed, wpAlt,"BARO")
					path[1].task = {
					id = "ComboTask",
					params = {
						tasks = {
							[1] = {
	            number = 1,
	            auto = true,
	            id = "EngageTargets",
	            enabled = true,
	            key = "CAS",
	            params = {
	              targetTypes = {
	                [1] = "Ground Units",
                  [2] = "Air",
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
      
        	local msg = {} 
	msg.text = ' Path created.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
      
		
	local vars = {} 
	vars.groupName = grpName2A
	vars.action = "respawn"
	vars.point = wpPsn
	vars.route = path
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' Plane spawned.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)
		
	--loops_through = loops_through + 1	
	
	--local vars = {} 
	--vars.groupName = grpName
	--vars.action = "respawn"
	--vars.point = spawnPsn
	--vars.route = path
	--mist.teleportToPoint(vars)			

	local con = agrp2:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
  end
		
	--checkunits4 = {
	--groupName = grpName,
	--percent = 40,
	--flag = 401,
	--stopFlag = 402,
	--toggle = true,
	--}
	--mist.flagFunc.group_alive_less_than(checkunits4)
  


	trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')
  
  	local msg = {} 
	msg.text = ' Attacker intercept task has been created, search and destroy target.'
	msg.displayTime = 20
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)

	end
 

	---
      
      
     
    
    
    
    if EnemyFort == 2 then
	striketask = 1

		

		
		local buildPsn = mist.utils.makeVec3(mudPsn)		
			
			local randomobjects = 0
			local randomobjects = mist.random(1,8)
			
	if randomobjects == 1 then
			local vars = 
			{
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
			local vars2 = 
			{
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
			local vars3 = 
			{
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
						local vars = 
			{
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
			local vars2 = 
			{
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
			local vars3 = 
			{
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
						local vars = 
			{
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
			local vars2 = 
			{
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
			local vars3 = 
			{
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
						local vars = 
			{
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
			local vars2 = 
			{
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
			local vars3 = 
			{
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
						local vars = 
			{
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
			local vars2 = 
			{
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
			local vars3 = 
			{
			 type = "Sandbox",
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
						local vars = 
			{
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
			local vars2 = 
			{
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
			local vars3 = 
			{
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
						local vars = 
			{
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
			local vars3 = 
			{
			 type = "Sandbox",
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
						local vars = 
			{
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
			local vars2 = 
			{
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
			local vars3 = 
			{
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
	  msg.text = ' Static buildings spawned.'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	
		

		
			 local Strike_Area = {}
   Strike_Area.x = mudPsn.x
	 Strike_Area.y = mudPsn.y
	 Strike_Area.z = mudPsn.z
   radius = 1000
	
	mist.flagFunc.mapobjs_dead_zones { zones = Strike_Area, flag = 601, req_num = 3, stopFlag = 602}
  

    
end
    
    
    
    if EnemyAD == 2 then
    -----------------------------------
        		local MudADData = mist.getGroupData(ADName)
    


		local mvars = {}
	  mvars.groupName = ADName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
	  mvars.maxDisp = 800
	  mvars.radius = 800
    mvars.innerRadius = 400 
		mist.teleportToPoint(mvars)
		
--		formisttable = ''
		--targets = mist.makeUnitTable({'[g]' .. MudName})
    
    
      
            AddOP(ADName) -- add MBOT to it
			
		

        		local msg = {}
	  msg.text = ' AAA Spawned'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
	
    local infvars = {}
		infvars.groupName = InfName1
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 800
	  infvars.radius = 800
		infvars.innerRadius = 170
		mist.teleportToPoint(infvars)

		--mist.spawnRandomizedGroup(InfName1)
		
		local infvars = {}
		infvars.groupName = InfName2
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 800
	  infvars.radius = 800
		infvars.innerRadius = 170
		mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName3
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 200
	  infvars.radius = 800
		infvars.innerRadius = 270
		mist.teleportToPoint(infvars)
		
		
	local infvars = {}
		infvars.groupName = InfName4
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 600
	  infvars.radius = 800
		infvars.innerRadius = 270
		mist.teleportToPoint(infvars)
		
		local infvars = {}
		infvars.groupName = InfName5
	  infvars.action = "respawn"
	  infvars.point = mudPsn
		infvars.disperse = true
	  infvars.maxDisp = 700
	  infvars.radius = 700
		infvars.innerRadius = 370
		mist.teleportToPoint(infvars)		  
			
		--mist.spawnRandomizedGroup(MudName)
		--mist.spawnRandomizedGroup(InfName1)
		--mist.spawnRandomizedGroup(InfName2)
		--mist.spawnRandomizedGroup(InfName3)
		--mist.spawnRandomizedGroup(InfName4)
		--mist.spawnRandomizedGroup(InfName5)
    
            		local msg = {}
	  msg.text = ' Infantry Spawned Ok.'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
    
    
		
		
		local randomizer_disperse = 0
		local randomizer_radius = 0
		local randomizer_inner_radius = 0
		local randomizer_max_disperse = 0
		local use_randomizer = 0
		--use_randomizer = mist.random(0,1)
	
	  

		
		mist.removeFunction(InfFunc1c)
		mist.removeFunction(InfFunc2c)
		mist.removeFunction(InfFunc3c)
		mist.removeFunction(InfFunc4c)
		mist.removeFunction(InfFunc5c)

		local randomizer_time = 0
		randomizer_time = mist.random(90,180)

    InfFunc1c = mist.scheduleFunction(Move_Infantry,{InfName1}, timer.getTime() + 1, randomizer_time, timer.getTime() + 3600)
    InfFunc2c = mist.scheduleFunction(Move_Infantry,{InfName1}, timer.getTime() + 1, randomizer_time, timer.getTime() + 3600)
    InfFunc3c = mist.scheduleFunction(Move_Infantry,{InfName3}, timer.getTime() + 1, randomizer_time, timer.getTime() + 3600)
    InfFunc4c = mist.scheduleFunction(Move_Infantry,{InfName4}, timer.getTime() + 1, randomizer_time, timer.getTime() + 3600)
    InfFunc5c = mist.scheduleFunction(Move_Infantry,{InfName5}, timer.getTime() + 1, randomizer_time, timer.getTime() + 3600)
    
  

		


		--Make_Smoke(mzone, nil)
		--return
	 --mist.flagFunc.group_alive_less_than(checkunits2)
   
   	--	local completevars = {}
    --completevars.groupName = MudName
   --completevars.flag =  202
   --completevars.percent = 33
   --completevars.toggle = true
   
 --mist.flagFunc.group_alive_more_than(completevars)
 
   

   --			local msg = {}
	  --msg.text = ' Flag 202 set to trigger at 33 percent health '
	  --msg.displayTime = 5
	  --msg.msgFor = {coa = {'all'}}
	  --mist.message.add(msg)
    

  
  
  
     if Samradar == 2 then
		local mvars = {}
	  mvars.groupName = RadarSamName
	  mvars.action = "respawn"
	  mvars.point = samPsn
	  mvars.disperse = false
	  --mvars.maxDisp = 0
	  --mvars.radius = 0
		mist.teleportToPoint(mvars)
    end
    
    if Samradar == 3 then
		local mvars = {}
	  mvars.groupName = RadarSamName
	  mvars.action = "respawn"
	  mvars.point = samPsn
	  mvars.disperse = false
	  --mvars.maxDisp = 0
	  --mvars.radius = 0
		mist.teleportToPoint(mvars)
    end
    
    if Samradar == 4 then
		local mvars = {}
    mvars.groupName = RadarSamName
	  mvars.action = "respawn"
	  mvars.point = samPsn2
	  mvars.disperse = false
	  --mvars.maxDisp = 0
	  --mvars.radius = 0
		mist.teleportToPoint(mvars)
    end
    
        if Samradar == 5 then
				local mvars = {}
	  mvars.groupName = RadarSamName3
	  mvars.action = "respawn"
	  mvars.point = samPsn2
	  mvars.disperse = false
	  --mvars.maxDisp = 0
	  --mvars.radius = 0
		mist.teleportToPoint(mvars)
    
    local mvars = {}
	  mvars.groupName = RadarSamName2
	  mvars.action = "respawn"
	  mvars.point = samPsn
	  mvars.disperse = false
	  --mvars.maxDisp = 0
	  --mvars.radius = 0
		mist.teleportToPoint(mvars)
    
    mvars.groupName = RadarSamName
	  mvars.action = "respawn"
	  mvars.point = samPsn
	  mvars.disperse = false
	  --mvars.maxDisp = 0
	  --mvars.radius = 0
		mist.teleportToPoint(mvars)
    end
    
    if Saminfared == 2 then
		local mvars = {}
	  mvars.groupName = IRSamName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
	  mvars.maxDisp = 300
	  mvars.radius = 400
		mist.teleportToPoint(mvars)
    end
    
    if Saminfared == 3 then
		local mvars = {}
	  mvars.groupName = IRSamName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
	  mvars.maxDisp = 300
	  mvars.radius = 400
		mist.teleportToPoint(mvars)
    end
    
        if Saminfared == 4 then
		local mvars = {}
	  mvars.groupName = IRSamName2
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
	  mvars.maxDisp = 300
	  mvars.radius = 400
		mist.teleportToPoint(mvars)
    
    
    mvars.groupName = IRSamName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
	  mvars.maxDisp = 300
	  mvars.radius = 400
		mist.teleportToPoint(mvars)
    end
    
            if Saminfared == 5 then
				local mvars = {}
	  mvars.groupName = IRSamName3
	  mvars.action = "respawn"
	  mvars.point = samPsn
	  mvars.disperse = true
	  mvars.maxDisp = 300
	  mvars.radius = 400
		mist.teleportToPoint(mvars)
    
    
    local mvars = {}
	  mvars.groupName = IRSamName2
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
	  mvars.maxDisp = 300
	  mvars.radius = 400
		mist.teleportToPoint(mvars)
    
    
    mvars.groupName = IRSamName
	  mvars.action = "respawn"
	  mvars.point = mudPsn
	  mvars.disperse = true
	  mvars.maxDisp = 300
	  mvars.radius = 400
		mist.teleportToPoint(mvars)
    end
    
        		local msg = {}
	  msg.text = ' SAMs Spawned Ok.'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
  
  
  
  
  

    
  
    
    
    -------------------- this part adds in the SEAD flight if applicable by user settings during the mission                

    
    if SEAD >= 2 then    
      	local msg = {} 
        
             if SEAD == 2 and Difficultymod == 1 then
	    seadName = SEAD_Names_VeryEasy2x[seadrand]
      end
      
     if SEAD == 2 and Difficultymod == 2 then
	    seadName = SEAD_Names_Easy2x[seadrand]
      end
     if SEAD == 2 and Dfficultymod == 3 then
	    seadName = SEAD_Names_Normal2x[seadrand]
      end
      
            if SEAD == 2 and Difficultymod == 4 then
	    seadName = SEAD_Names_Hard2x[seadrand]
      end
      
            if SEAD == 2 and Difficultymod == 5 then
	    seadName = SEAD_Names_VeryHard2x[seadrand]
      end
   
    
      if SEAD == 3 and Difficultymod == 1 then
	    seadName = SEAD_Names_VeryEasy4x[seadrand]
      end
      
      if SEAD == 3 and Difficultymod == 2 then
	    seadName = SEAD_Names_Easy4x[seadrand]
      end
      if SEAD == 3 and Difficultymod == 3 then
	    seadName = SEAD_Names_Normal4x[seadrand]
      end
      
            if SEAD == 3 and Difficultymod == 4 then
	    seadName = SEAD_Names_Hard4x[seadrand]
      end
      
            if SEAD == 3 and Difficultymod == 5 then
	    seadName = SEAD_Names_VeryHard4x[seadrand]
      end
        

		
	trigger.action.activateGroup(Group.getByName(seadName))
	seadgrp = Group.getByName(seadName)
  

	
	local InitwpSpeed = mist.random(400,500)
	local wpSpeed = mist.utils.kmphToMps(InitwpSpeed)
	local wpAlt = 3000
  local wpAlt2 = mist.random(3000,4000)
	local wpPsn = mist.getRandPointInCircle(samPsn, 0)
	local wpPsn2 = mist.getRandPointInCircle(seadPsn, 10000)
  local path = {}
					path[1] = mist.fixedWing.buildWP(seadPsn, wpSpeed, wpalt2, "BARO")
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
	            key = "SEAD",
	            params = {
	              targetTypes = {
	                [1] = "Air Defence",
                  [2] = "Ground Units",
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
	vars.groupName = seadName
	vars.action = "respawn"
	vars.point = seadPsn
	vars.route = path
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' SEAD Plane spawned.'
	msg.displayTime = 3
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)	

	local con = seadgrp:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
	      
	--trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')
  

  
  
  
  
  
    -------------------- this part adds in the enemy Helo flight if applicable by user settings during the mission
                      --seadName = {}
   

		
	trigger.action.activateGroup(Group.getByName(eHeloName))
  ehelogrp = Group.getByName(eHeloName)
  
	
  

	
	local eInitwpSpeed = mist.random(60,225)
	local ewpSpeed = mist.utils.kmphToMps(eInitwpSpeed)
	local ewpAlt = mist.random(300,700)
  local ewpAlt2 = mist.random(50,100)
  local hpath = {}
					hpath[1] = mist.heli.buildWP(heloPsn, ewpSpeed, ewpAlt, "BARO")
          hpath[2] = mist.heli.buildWP(heloPsn2, ewpSpeed, ewpAlt2, "BARO")
					hpath[1].task = {
					id = "ComboTask",
					params = {
						tasks = {
              [1] = {
	            number = 1,
	            auto = true,
	            id = "EngageTargets",
	            enabled = true,
	            key = "CAS",
	            params = {
	              targetTypes = {
                [1] = "Air",
                [2] = "Ground Units",
                }, -- end of ["targetTypes"]
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
	              pattern = "Circle",
	              speed = ewpSpeed,
	              altitude = ewpAlt,
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
	vars.groupName = eHeloName
	vars.action = "respawn"
	vars.point = heloPsn
	vars.route = hpath
	mist.teleportToPoint(vars)			
  
  	local msg = {} 
	msg.text = ' Enemy Helo spawned.'
	msg.displayTime = 3
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)	

	local con = ehelogrp:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)
  

	
	--trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')
  

  
  
   
  
  
  if eHelo == 4 then
      -------------------- this part adds in the enemy Helo flight if applicable by user settings during the mission
                      --seadName = {}


		
	trigger.action.activateGroup(Group.getByName(eHeloName2))
  ehelogrp2 = Group.getByName(eHeloName2)
  
	
  

	
	local eInitwpSpeed = mist.random(60,225)
	local ewpSpeed = mist.utils.kmphToMps(eInitwpSpeed)
	local ewpAlt = mist.random(100,200)
  local ewpAlt2 = mist.random(50,100)
  local hpath = {}
					hpath[1] = mist.heli.buildWP(heloPsn3, ewpSpeed, ewpAlt, "BARO")
          hpath[2] = mist.heli.buildWP(heloPsn, ewpSpeed, ewpAlt2, "BARO")
					hpath[1].task = {
					id = "ComboTask",
					params = {
						tasks = {
              [1] = {
	            number = 1,
	            auto = true,
	            id = "EngageTargets",
	            enabled = true,
	            key = "CAS",
	            params = {
	              targetTypes = {
                [1] = "Air",
                [2] = "Ground Units",
                }, -- end of ["targetTypes"]
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
	              pattern = "Circle",
	              speed = ewpSpeed,
	              altitude = ewpAlt,
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
	vars.groupName = eHeloName2
	vars.action = "respawn"
	vars.point = heloPsn3
	vars.route = hpath
	mist.teleportToPoint(vars)			
  


	local con = ehelogrp2:getController()
	con:setOption(AI.Option.Air.id.RTB_ON_BINGO, false)
	con:setOption(AI.Option.Air.id.RADAR_USING, AI.Option.Air.val.RADAR_USING.FOR_CONTINUOUS_SEARCH)
	con:setOption(AI.Option.Air.id.ROE, AI.Option.Air.val.ROE.OPEN_FIRE_WEAPON_FREE)
	con:setOption(AI.Option.Air.id.FLARE_USING, AI.Option.Air.val.FLARE_USING.AGAINST_FIRED_MISSILE)
	con:setOption(AI.Option.Air.id.REACTION_ON_THREAT, AI.Option.Air.val.REACTION_ON_THREAT.EVADE_FIRE)

        
        end  
	--trigger.action.outSoundForCoalition(coalition.side.RED, 'airtask.ogg')
  

   	local msg = {} 
	msg.text = ' Enemy Helo spawned'
	msg.displayTime = 3
	msg.msgFor = {coa = {'all'}} 
	mist.message.add(msg)	
  
 
  
  -- this part spawns CA forces
         if CACAS == 2 then

	--if MudName ==  then
		local msg = {}
	  msg.text = ' Creating RED CA forces'
	  msg.displayTime = 3
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	--trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

		--trigger.action.activateGroup(Group.getByName(MudName))
		--trigger.action.activateGroup(Group.getByName(InfName1))
		--trigger.action.activateGroup(Group.getByName(InfName2))
		--trigger.action.activateGroup(Group.getByName(InfName3))
		--trigger.action.activateGroup(Group.getByName(InfName4))
		--trigger.action.activateGroup(Group.getByName(InfName5))
		
    local MudREDGrpData = mist.getGroupData(MudREDCASName)
   

 

    for i = 1, 100 do
        mzone2 = mist.getLeadPos(MudName)
        mudPsn3 = {x = mzone2.x + math.random(8000,10000), y = mzone2.y, z = mzone2.z + math.random(1,8000)}
        
        					if mist.isTerrainValid(mudPsn3, {'LAND'}) == true and mist.terrainHeightDiff(mudPsn, 19) < 2 then				
					break
					end
		end
        

    
    
    
		
		local mvars2 = {}
	  mvars2.groupName = MudREDCASName
	  mvars2.action = "respawn"
	  mvars2.point = mudPsn3
	  --mvars.disperse = true
	  --mvars.maxDisp = 100
	  --mvars.radius = 20
		MudREDCASNamec = mist.teleportToPoint(mvars2)
		
		
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

    
    		local mvars2 = {}
	  mvars2.groupName = MudREDCASName
	  mvars2.action = "teleport"
	  mvars2.point = mudPsn3
	  mvars2.disperse = randomizer_disperse
	  mvars2.maxDisp = randomizer_max_disperse
	  mvars2.radius = randomizer_radius
		mvars2.innerRadius = randomizer_inner_radius
		MudREDCASNamec = mist.teleportToPoint(mvars2)


			 	
	random_move(MudREDCASName, {MudName, ADName}, 16, 32, 50, 1, "Random", 60, mzone)
  random_markers(MudREDCASName, 50, 500, "Blue", 480, 1800)
  

   
   --random_move("Blue_Inf_1",{"Red_Inf_1", "Red_Inf_2"}, 6, 12, 50, 1, "Random",  60, "Redretreat")
   
		local msg = {}
	  msg.text = 'Combined Arms player now has access to ground forces near the task area.'
	  msg.displayTime = 60
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
	end
  
  
  
  
  
  local randomizer_tune = mist.random(1,4)
  
  if randomizer_tune == 1 then
  trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')
  end
  
  if randomizer_tune == 2 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing3.ogg')
    end
    
    if randomizer_tune == 3 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing4.ogg')
    end
    
        if randomizer_tune == 4 then
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing2.ogg')
    end

  
  
  
  
  
  end
  end
 --- 
  
  
  
  

  



------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Naval(_mArea)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 0.85, mzone.radius * 0.65)		
			elseif Task_Range == 5 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.00, mzone.radius * 0.85)	
			elseif Task_Range == 6 then
	      mudPsn = mist.getRandPointInCircle(mzone.point, mzone.radius * 1.25, mzone.radius * 1.05)
			end

			
			
				--	if mist.isTerrainValid(mudPsn, {'WATER'}) == true and
					if mist.isTerrainValid(mudPsn, {'WATER'}) == true and mist.terrainHeightDiff(mudPsn, 100) < 2 then
					break
					end
		end
		

		
		local buildPsn = mist.utils.makeVec3(mudPsn)		
			
			--local randomobjects = 0
			--local randomobjects = mist.random(1,9)
			
			local vars = 
			{
			 type = "Oil platform",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(1575, 1575),
			 --name = "Strike1", 
			 groupName = "Strike1",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars)
			local vars2 = 
			{
			 type = "Oil platform",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x,
			 y = buildPsn.z + math.random(2575, 3575),
			 --name = "Strike2", 
			 groupName = "Strike2",
			 heading = 0.47123889803847
			}
			mist.dynAddStatic(vars2)
			local vars3 = 
			{
			 type = "Oil platform",
			 country = 'GEORGIA',
			 category = "Fortifications", 
			 x = buildPsn.x + math.random(1025, 2025),
			 y = buildPsn.z + math.random(1025, 2025),
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
		
		
		targets5 = mist.makeUnitTable({'[g]' .. navalvars.groupName})
		
		AddOP(navalvars.groupName) -- add MBOT to it
		
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
		mist.teleportToPoint(navalvars)

		
		local navalvars = {}
		navalvars.groupName = BoatName2
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
		navalvars.disperse = true
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName3
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		mist.teleportToPoint(navalvars)
		
		
	local navalvars = {}
		navalvars.groupName = BoatName4
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName5
	  navalvars.action = "respawn"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		mist.teleportToPoint(navalvars)		 
		
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
		mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName1
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius
		navalvars.innerRadius = randomizer_inner_radius
		mist.teleportToPoint(navalvars)

		
		local navalvars = {}
		navalvars.groupName = BoatName2
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName3
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		mist.teleportToPoint(navalvars)
		 
		local navalvars = {}
		navalvars.groupName = BoatName4
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		mist.teleportToPoint(navalvars)
		
		local navalvars = {}
		navalvars.groupName = BoatName5
	  navalvars.action = "teleport"
	  navalvars.point = mudPsn
	  navalvars.disperse = randomizer_disperse
	  navalvars.maxDisp = 25
	  navalvars.radius = randomizer_radius - 1000
		navalvars.innerRadius = randomizer_inner_radius - 1000
		mist.teleportToPoint(navalvars)		 
		
 
	--

	 
	 
		mist.removeFunction(ShipFunc1d)
		mist.removeFunction(BoatFunc1d)
		mist.removeFunction(BoatFunc2d)
		mist.removeFunction(BoatFunc3d)
		mist.removeFunction(BoatFunc4d)
		mist.removeFunction(BoatFunc5d)
		
		
		BoatFunc1d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc1d = mist.scheduleFunction(Move_Boats, {BoatName1}, randomizer_time, randomizer_time)
		  
		BoatFunc2d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc2d = mist.scheduleFunction(Move_Boats, {BoatName2}, randomizer_time, randomizer_time)
	
		BoatFunc3d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc3d = mist.scheduleFunction(Move_Boats, {BoatName3}, randomizer_time, randomizer_time)
		
		BoatFunc4d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc4d = mist.scheduleFunction(Move_Boats, {BoatName4}, randomizer_time, randomizer_time)
	
		BoatFunc5d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,90)
		BoatFunc5d = mist.scheduleFunction(Move_Boats, {BoatName5}, randomizer_time, randomizer_time)
		
		ShipFunc1d = nil
		local randomizer_time = 0
		randomizer_time = mist.random(45,690)
		ShipFunc1d = mist.scheduleFunction(Move_Ships, {ShipName}, randomizer_time, randomizer_time)
	
		
					local msg = {}
	  msg.text = ' Naval task has been created '
	  msg.displayTime = 20
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing3.ogg')
		
			 local Strike_Area2 = {}
   Strike_Area2.x = buildPsn.x
	 Strike_Area2.y = buildPsn.y
	 Strike_Area2.z = buildPsn.z
   radius = 13000
	
	mist.flagFunc.mapobjs_dead_zones { zones = Strike_Area2, flag = 701, req_num = 3, stopFlag = 702}
		
end
---
	
	
	
	

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Mud_Convoy(_mArea)

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	mzone = trigger.misc.getZone(_mArea)
	local mrand = mist.random(1,Mud_Names)
	convoytask = 1
	
	MudName = {}
	ConvoySend = {}

		local msg = {}
	  msg.text = ' Creating Moving Mud.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)

	trigger.action.outSoundForCoalition(coalition.side.RED, 'groundtask.ogg')

	if Difficultymod == 1 then
	  MudName = Mud_VeryEasy[mrand]
		end
	
	if Difficultymod == 2 then
	  MudName = Mud_Easy[mrand]
		end

	if Difficultymod == 3 then
	  MudName = Mud_Normal[mrand]
		end

	if Difficultymod == 4 then
	  MudName = Mud_Hard[mrand]
		end

	if Difficultymod == 5 then
	  MudName = Mud_Convoy_VeryHard[mrand]
		end

		trigger.action.activateGroup(Group.getByName(MudName))
		local ConvoyGrpData = mist.getGroupData(MudName)


		

			
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
		mist.teleportToPoint(mvars)
								
								

			

		MoveMud = MudName

mist.removeFunction(ConvoyFunc)
    
	 	local randomizer_time = 0
		randomizer_time = mist.random(240,400)		
		
    
		--ConvoyFunc = nil
    ConvoyFunc = mist.scheduleFunction(Move_Convoy, {mvars.groupName}, timer.getTime() + 1, randomizer_time, timer.getTime() + 7200)
		
		
		trigger.action.outSoundForCoalition(coalition.side.RED, 'bombing.ogg')
		--Make_Smoke(mudPsn, nil)
		--return

		
		
    
    		targets3 = mist.makeUnitTable({'[g]' .. mvars.groupName})
		AddOP(mvars.groupName) -- add MBOT to it
    
    local msg = {}
	  msg.text = ' MBOT Intelligence added.'
	  msg.displayTime = 5
	  msg.msgFor = {coa = {'all'}}
	  mist.message.add(msg)


	end

	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Create_Airfield(_afArea)

	------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
		targets = mist.makeUnitTable({'[g]' .. mvars.groupName})
		
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
		 local checkunits1 = {
	  groupName = DefensesName,
	  percent = 33,
		flag = 101,
		stopFlag = 102,
		 toggle = true,
	 }
	 mist.flagFunc.group_alive_less_than(checkunits1)
	 
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

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Convoy(_Mud)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	local MoveConvoy = {}

	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	MoveConvoy = _Mud
	randomizer_speed = math.random(21,40)
	randomizer_dir = math.random(1,359)
	randomizer_dist = math.random(3000, 3500)
			local formationrand = mist.random(1,2)
			if formationrand == 1 then
		mist.groupRandomDistSelf(MoveConvoy, randomizer_dist, 'Cone', randomizer_dir, randomizer_speed)
			elseif formationrand == 2 then
		mist.groupRandomDistSelf(MoveConvoy, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
	
		end

	--return
	end
	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Infantry(_infantry)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		
			
	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	local Infantry_Name = {}
	Infantry_Name = _infantry
	randomizer_speed = math.random(1,4)
	randomizer_dir = math.random(1,359)
	randomizer_dist = math.random(25, 200)

			local formationrand = mist.random(1,3)
			
			if formationrand == 1 then
		mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
		
			elseif formationrand == 2 then
		mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'EchelonL', randomizer_dir, randomizer_speed)

		elseif formationrand == 3 then
		mist.groupRandomDistSelf(Infantry_Name, randomizer_dist, 'EchelonR', randomizer_dir, randomizer_speed)

		end

	--return
	end

	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Ships(_Boats)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		
			
	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	local Infantry_Name = {}
	Boat_Name = _Boats
	randomizer_speed = math.random(7,14)
	randomizer_dir = math.random(90,270)
	randomizer_dist = math.random(1500, 2000)

		
			mist.groupRandomDistSelf(Boat_Name, randomizer_dist, 'Rank', randomizer_dir, randomizer_speed)
		
		

	--return
	end

	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Move_Boats(_Boats)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
		
			
	local randomizer_speed = 0
	local randomizer_dir = 0
	local randomizer_dist = 0
	local Infantry_Name = {}
	Boat_Name = _Boats
	randomizer_speed = math.random(44,50)
	randomizer_dir = math.random(1,359)
	randomizer_dist = math.random(1000, 4000)

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

	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Make_Smoke(_coord)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
			  local Scoord = {}
				Scoord = mist.utils.zoneToVec3(_coord)
				

	--			local msg = {} 
	--			msg.text = ' Attempted to smoke target area '
	--			msg.displayTime = 5
	--			msg.msgFor = {coa = {'all'}}
	  --  	mist.message.add(msg)

		trigger.action.smoke({x=Scoord.x + math.random(1,200), y= land.getHeight({x = Scoord.x, y = Scoord.z}), z= Scoord.z + math.random(1, 200)}, trigger.smokeColor.Red)
		
	end
	---

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
	---
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall4()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
	---
	
		------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Bullscall5()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
			msg.acc = 4
			msg.displayTime = 90
			msg.msgFor = {coa = {'red'}} 
			msg.text = ' Grid Reference: '
			mist.msgMGRS(msg)

	end
	---
  --                            'END OF BULLSEYE CALL STUFF --
  ---
   ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_CACAS_Level_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " not recieve any units to help with this task"
	CACAS = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Combined arms player will'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
     ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_CACAS_Level_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " recieve units to help with this task"
	CACAS = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Combined arms player will'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
     ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_AD_Level_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " has been disabled"
	EnemyAD = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy air defenses at task'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
     ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_AD_Level_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " has been enabled."
	EnemyAD = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy air defenses at task'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
         ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_eAttacker_Level_1()

	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " has been disabled"
	eAttack = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy buildings'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
         ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_eAttacker_Level_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " have been enabled"
	eAttack = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy CAS planes'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
       ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Fort_Level_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " has been disabled"
	EnemyFort = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy buildings'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
     ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_Fort_Level_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " has been enabled."
	EnemyFort = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy buildings'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
  
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_SEAD_Level_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " no allied SEAD flights helping with this task"
	SEAD = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_SEAD_Level_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 2 Allied SEAD planes helping with this task"
	SEAD = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_SEAD_Level_3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 4 Allied SEAD planes helping with this task"
	SEAD = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------	
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_RadarSAM_Threat_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "No radar SAMs present for this task"
	Samradar = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_RadarSAM_Threat_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "short range radar SAMs present for this task"
	Samradar = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_RadarSAM_Threat_3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "medium range radar SAMs present for this task"
	Samradar = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_RadarSAM_Threat_4()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " Long range sams present for this task"
	Samradar = 4

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_RadarSAM_Threat_5()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "short, medium and long range SAMs present for this task"
	Samradar = 5

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_IRSAM_Threat_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "No IR SAMs present for this task"
	Saminfared = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_IRSAM_Threat_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Vehicle based IR SAMs present for this task"
	Saminfared = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_IRSAM_Threat_3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Manpads present for this task"
	Saminfared = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_IRSAM_Threat_4()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " Vehicle and manpad bases SAMs present for this task"
	Saminfared = 4

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------  
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_IRSAM_Threat_5()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = "Extra vehicle SAMs with manpads"
	Saminfared = 5

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' There will be '..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------  
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_GroupSize_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " a single fighter."
	Groupsizes = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy fighters will consist of'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_GroupSize_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 2 fighters."
	Groupsizes = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy fighters will consist of'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_GroupSize_3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " a full flight of four fighters."
	Groupsizes = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy fighters will consist of'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_GroupSize_4()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 2 full flights of four fighters."
	Groupsizes = 4

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy fighters will consist of'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_eHelo_Level_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " no helos operating at task area"
	eHelo = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy will have'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_eHelo_Level_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 2 helos operating at task area"
	eHelo = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy will have'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_eHelo_Level_3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 4 helos operating at task area"
	eHelo = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy will have'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_eHelo_Level_4()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 8 helos operating at task area"
	eHelo = 4

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy will have'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
     ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_aHelo_Level_1()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " no helos operating at task area"
	aHelo = 1

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Enemy will have'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_aHelo_Level_2()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 2 helos operating at task area"
	aHelo = 2

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Allies will have'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function Set_aHelo_Level_3()
	------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local New_Set = " 4 helos operating at task area"
	aHelo = 3

	trigger.action.outSoundForCoalition(coalition.side.RED, 'setting.ogg')
	  local msg = {} 
	    msg.text = ' Allies will have'..tostring(New_Set)
	    msg.displayTime = 20
	    msg.msgFor = {coa = {'all'}}
	      mist.message.add(msg)
	end
	------
  
  
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
	end
	------
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
	end
	----
	--[[Useage example:
	if you have the file named "ScriptFile.lua" in Saved Games/DCS.
	Put this code in a DO SCRIPT action that is triggered by an F10 radio menu selection.
	]]

	----------------------------------
	function reloadscript()
	----------------------------------
	do
		local fName = lfs.writedir() .. [[csilk_script.lua]]
		doScriptFile(fName)

			  local msg = {} 
	    msg.text = ' Reloaded script GOODLUCK. '

	    msg.displayTime = 10
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

		end

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
	---
	-----------------------------------
	function Mission_Complete_Checks(arg, time)
	-----------------------------------

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
  
  		if trigger.misc.getUserFlag('802') == 1 then

			trigger.action.setUserFlag('802',0)

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
      
      					if trigger.misc.getUserFlag('801') == 1 then
				if castask == 1 then
				local msg = {}

			msg.text = ' CAS mission completed.'

	    msg.displayTime = 60
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			trigger.action.setUserFlag('802', 1)				-- stop victory
			castask = 0
			cas_complete = 0

			trigger.action.outSoundForCoalition(coalition.side.RED, 'missioncomplete.ogg')
			--trigger.action.deactivateGroup(Group.getByName(egrpName))				-- deactivate escorts
			--trigger.action.deactivateGroup(Group.getByName(bgrpName))				-- deactivate bombers
			
				end
			end
	


	Debug_Show()
	--return time + 5

end
	---

	function Debug_Show()

			if Debugger == 1 then
			local msg = {}
	    msg.text = ' Debug variables'
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

			

			local msg = {}
	    msg.text = ' TasksStart' ..tostring(airfield) ..tostring(mudtask) ..tostring(convoytask) ..tostring(intercepttask) ..tostring(bombertask) ..tostring(striketask)
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

			
			local msg = {}
	    msg.text = ' CompletedTask' ..tostring(airfield_complete) ..tostring(mud_complete) ..tostring(convoy_complete) ..tostring(intercept_complete) ..tostring(bomber_complete) .tostring(strike_complete)
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)
			

			local msg = {}
	    msg.text = ' Debug variables'
	    msg.displayTime = 1
	    msg.msgFor = {coa = {'all'}}
	    mist.message.add(msg)

			end


	end

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

	
  
  
  
  
  ------------------------------------------------------------------------------------------------------------------------------------------------------------------
	function random_move(_grp, _targetNames, _minspeed, _maxspeed, _oradius, _iradius, _form, _orderfrequency, _returnzone)
	------------------------------------------------------------------------------------------------------------------------------------------------------------------	
  local grpName = ""
  local target = ""
  local targetgroup = ""
  local targetNames = {}
  local path = {} 
  local targetPos = {}
  local unitPos = {}
  local returnPos = {}
  local maxdist = 0
  local mindist = 0
  local oradius = _oradius
  local iradius = _iradius
  local orderfrequency = _orderfrequency
  local form = _form
  local commandedgroup = ""
  local zonetouse = ""
  local maxvelocity = _maxspeed
  local minvelocity = _minspeed
  local randomizer_speed = math.random(minvelocity, maxvelocity)
  local formationrand = mist.random(1,3)
  local errormargin = {}
  
  targetNames = _targetNames
  commandedgroup = _grp
  zonetouse = _returnzone
  grpName = Group.getByName(commandedgroup) 
  unitPos = mist.getLeadPos(grpName)
  zonetouse = _returnzone
  returnPos = mist.utils.zoneToVec3(zonetouse)
  returnPos = {x = returnPos.x + math.random(iradius,oradius), y = returnPos.y, z = returnPos.z + math.random(iradius,oradius)}
 
  if unitPos == nil then
        return
        end
  
  for selected = 1, #targetNames do
        targetgroup = targetNames[selected]
        target = Group.getByName(targetgroup) 
        targetPos = mist.getLeadPos(target)      
     
        if targetPos ~= nil then
        
                    errormargin = mist.getRandPointInCircle(targetPos, oradius, iradius)
        
               			if form == "Random" then
                    if formationrand == 1 then
                    path[#path + 1] = mist.ground.buildWP(unitPos, 'Rank', randomizer_speed) 
                    path[#path + 1] = mist.ground.buildWP(errormargin, 'Rank', randomizer_speed) 
      
                    elseif formationrand == 2 then
                    path[#path + 1] = mist.ground.buildWP(unitPos, 'EchelonL', randomizer_speed)
                    path[#path + 1] = mist.ground.buildWP(errormargin, 'EchelonL', randomizer_speed) 

                    elseif formationrand == 3 then
                    path[#path + 1] = mist.ground.buildWP(unitPos, 'EchelonR', randomizer_speed)
                    path[#path + 1] = mist.ground.buildWP(errormargin, 'EchelonR', randomizer_speed) 
                    end
                    end
                    
                    if form == "EchelonR" then
                    path[#path + 1] = mist.ground.buildWP(unitPos, 'EchelonR', randomizer_speed)
                    path[#path + 1] = mist.ground.buildWP(errormargin, 'EchelonR', randomizer_speed) 
                    
                    elseif form == "EchelonL" then
                    path[#path + 1] = mist.ground.buildWP(unitPos, 'EchelonL', randomizer_speed)
                    path[#path + 1] = mist.ground.buildWP(errormargin, 'EchelonL', randomizer_speed) 
                    
                    
                    elseif form == "Rank" then
                    path[#path + 1] = mist.ground.buildWP(unitPos, 'Rank', randomizer_speed) 
                    path[#path + 1] = mist.ground.buildWP(errormargin, 'Rank', randomizer_speed) 
                    end
                    
                    if scheduled == true then
                    mist.removeFunction(execution)
                    end

                    execution = mist.scheduleFunction(random_move, {_grp, _targetNames, _minspeed, _maxspeed, _oradius, _iradius, _form, _orderfrequency, _returnzone}, timer.getTime() + _orderfrequency)
                    
                    mist.goRoute(grpName, path)  
                    scheduled = true
                    
                    break
        end
  end
                    if targetPos == nil then
                    path[#path + 1] = mist.ground.buildWP(unitPos, 'Rank', randomizer_speed) 
                    path[#path + 1] = mist.ground.buildWP(returnPos, 'Rank', randomizer_speed) 
                    mist.goRoute(grpName, path)
                    end
  
  
	end
	---
  
  function random_markers(_group, _mindistance, _maxdistance, _color, _interval, _endsmoke)
local zonetouse = ""
local mindist = 0
local maxdist = 0
local mindist2 = 0
local maxdist2 = 0
local mindist3 = 0
local maxdist3 = 0
local unitPos = {}
local decision = ""
local unitstouse = ""
local direction = 0
local delay = 0
local interval = _interval
local endsmoke = _endsmoke

unittouse = Group.getByName(_group) 

mindist = _mindistance
maxdist = _maxdistance
mindist2 = mindist + 7
maxdist2 = maxdist + 7
mindist3 = mindist + 14
maxdist3 = maxdist + 14
direction = math.random(1,4)
delay = math.random(5,15)
decision = _color

unitPos = mist.getLeadPos(unittouse)

if unitPos == nil then
return
end

  if decision == "Blue" then
    if direction == 1 then
      trigger.action.smoke({x=unitPos.x + math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.Blue)
    elseif direction == 2 then
      trigger.action.smoke({x=unitPos.x - math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.Blue)
    elseif direction == 3 then
      trigger.action.smoke({x=unitPos.x - math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z - math.random(mindist,maxdist)}, trigger.smokeColor.Blue)
    elseif direction == 4 then
      trigger.action.smoke({x=unitPos.x + math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z - math.random(mindist,maxdist)}, trigger.smokeColor.Blue)
    end
   end
    
      if decision == "Red" then
    if direction == 1 then
      trigger.action.smoke({x=unitPos.x + math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.Red)
    elseif direction == 2 then
      trigger.action.smoke({x=unitPos.x - math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.Red)
    elseif direction == 3 then
      trigger.action.smoke({x=unitPos.x - math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z - math.random(mindist,maxdist)}, trigger.smokeColor.Red)
    elseif direction == 4 then
      trigger.action.smoke({x=unitPos.x + math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z - math.random(mindist,maxdist)}, trigger.smokeColor.Red)
    end
   end
    
      if decision == "White" then
    if direction == 1 then
      trigger.action.smoke({x=unitPos.x + math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x + math.random(mindist2,maxdist2), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist2,maxdist3)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x + math.random(mindist3,maxdist3), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist2,maxdist3)}, trigger.smokeColor.White)
    elseif direction == 2 then
      trigger.action.smoke({x=unitPos.x - math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x - math.random(mindist2,maxdist2), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist2)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x - math.random(mindist3,maxdist3), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist3)}, trigger.smokeColor.White)
    elseif direction == 3 then
      trigger.action.smoke({x=unitPos.x + math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x + math.random(mindist2,maxdist2), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist2,maxdist3)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x + math.random(mindist3,maxdist3), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist2,maxdist3)}, trigger.smokeColor.White)
    elseif direction == 4 then
      trigger.action.smoke({x=unitPos.x - math.random(mindist,maxdist), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x - math.random(mindist2,maxdist2), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist2)}, trigger.smokeColor.White)
      trigger.action.smoke({x=unitPos.x - math.random(mindist3,maxdist3), y= land.getHeight({x = unitPos.x, y = unitPos.z}), z=unitPos.z + math.random(mindist,maxdist3)}, trigger.smokeColor.White)
    end
      end
end
  
  
  
  
  

	------------------------------------------------------------------
	timer.scheduleFunction(Radio_Add, nil, timer.getTime() + 5)
	timer.scheduleFunction(Radio_Check, nil, timer.getTime() + 2)


	timer.scheduleFunction(Introduce_Mission, nil, timer.getTime() + 4)
	timer.scheduleFunction(Mission_Complete_Checks, nil, timer.getTime() + 5) 
	------------------------------------------------------------------

  
  
 

