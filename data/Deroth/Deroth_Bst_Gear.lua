function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','PDT','PetTank','BothDD')
	state.WeaponskillMode:options('Match', 'UncappedAtt','Normal', 'Acc')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'Refresh', 'Reraise')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PetPDT', 'PDT', 'Reraise', 'PKiller')
	state.MagicalDefenseMode:options('PetMDT','MDT', 'MKiller')
	state.ResistDefenseMode:options('PetMEVA', 'MEVA')
	state.Weapons:options('DualWeapons', 'MaccAxes', 'AxeDagger', 'Savage', 'None')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'} -- ,'Knockback','Suppa','DWEarrings'

	gear.PHYKumbha1 = {name="Kumbhakarna", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4','Pet: TP Bonus+180',}}
	gear.PHYKumbha2 = {name="Kumbhakarna", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: TP Bonus+160',}}
	gear.PDTMABKumbha = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+200',}}
	gear.MABKumbha = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+19','Pet: TP Bonus+160',}}
	
	ArtioDA = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}
	ArtioSTRWSD = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%'}}
	ArtioMNDWSD = { name="Artio's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
	ValorousHeadSTRWSD = { name="Valorous Mask", augments={'Attack+25','Weapon skill damage +4%','STR+14','Accuracy+10',}}
	ValorousBodySTRWSD = { name="Valorous Mail", augments={'Attack+26','Weapon skill damage +4%','STR+8',}}
	ValorousBootsSTRWSD = { name="Valorous Greaves", augments={'Weapon skill damage +5%','AGI+9','Accuracy+13','Attack+4',}}
	ValorousPantsSTP = { name="Valor. Hose", augments={'Attack+30','"Store TP"+7','DEX+8','Accuracy+5',}}
	ValorousBootsDA = { name="Valorous Greaves", augments={'Accuracy+16 Attack+16','"Dbl.Atk."+4','INT+12','Accuracy+15',}}
	ValorousBootsMABWS = { name="Valorous Greaves", augments={'"Mag.Atk.Bns."+20','"Blood Pact" ability delay -5','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}
	
	ValorousPantsPetDA = { name="Valor. Hose", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+3','Pet: VIT+5','Pet: Accuracy+6 Pet: Rng. Acc.+6',}}
    ValorousBootsPetDA = { name="Valorous Greaves", augments={'Pet: "Dbl. Atk."+5','Pet: VIT+3','Pet: Accuracy+4 Pet: Rng. Acc.+4','Pet: Attack+15 Pet: Rng.Atk.+15',}}
	
	
	ValorousMaskTH = { name="Valorous Mask", augments={'"Fast Cast"+4','Pet: DEX+10','"Treasure Hunter"+2','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}
    ValorousBodyPhalanx = { name="Valorous Mail", augments={'Attack+13','DEX+1','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	ValorousMaskPetMAB ={ name="Valorous Mask", augments={'Accuracy+19','Pet: "Mag.Atk.Bns."+30','Accuracy+2 Attack+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
    ValorousBodyQuad ={ name="Valorous Mail", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Attack+10','Quadruple Attack +2','Accuracy+18 Attack+18','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
	ValorousPantsPetMAB = { name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','"Dbl.Atk."+1','Pet: AGI+2',}}
    ValorousBootsPetMAB = { name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+30',}}

	-- Set up Jug Pet cycling and keybind Ctrl+F7
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode', 'GenerousArthur','ScissorlegXerin','HippogryphFamiliar','AcuexFamiliar','AttentiveIbuki','SlimeFamiliar','RhymingShizuna','LynxFamiliar','PorterCrabFamiliar','YellowBeetleFamiliar','MosquitoFamiliar','SpiderFamiliar','ColibriFamiliar','SurgingStorm','BlackbeardRandy','SunburstMalfik','RedolentCandi','DroopyDortwin','WarlikePatrick'}
	send_command('bind ^f7 gs c cycle JugMode')
	send_command('bind !f7 gs c set JugMode GenerousArthur')

	-- Set up Monster Correlation Modes and keybind Alt+F7
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	send_command('bind ^f8 gs c cycle CorrelationMode')

	-- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
	state.PetMode = M{['description']='Pet Mode','DD','Tank'}
	send_command('bind @f7 gs c cycle PetMode')

	-- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta'}
	send_command('bind ^backspace gs c cycle RewardMode')

	send_command('bind @f8 gs c toggle AutoReadyMode')
	send_command('bind !` gs c ready default')

	--Example of how to change default ready moves.
	--ready_moves.default.WarlikePatrick = 'Tail Blow'

	select_default_macro_book()
end

-- BST gearsets
function init_gear_sets()
	-- PRECAST SETS
	sets.precast.JA['Killer Instinct'] = {main="Arktoi",sub="Kaidate",ranged="Killer Shortbow",head="Ankusa Helm +3", body="Nukumi Gausape +2", hands="Founder's Gauntlets", legs="Founder's Hose", feet="Founder's Greaves"}
	sets.precast.JA['Bestial Loyalty'] = {body="Mirke Wardecors",hands="Ankusa Gloves +1",feet="Gleti's Boots"}
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
	sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
	sets.precast.JA.Tame = {head="Totemic Helm +1"}
	sets.precast.JA.Spur = {back="Artio's Mantle",feet="Nukumi Ocreae +2"}
	sets.SpurAxe = {main="Skullrender"}
	sets.SpurAxesDW = {main="Skullrender",sub="Skullrender"}

	sets.precast.JA['Feral Howl'] = {}

	sets.precast.JA.Reward = {
		neck="Phalaina Locket",ear1="Etiolation Earring",ear2="Domesticator's Earring",
		body="Tot. Jackcoat +3",hands="Regimen Mittens",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Pastoralist's Mantle",waist="Klouskap Sash",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +3"}

	sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
	sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
	sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})
	
	sets.RewardAxe = {}
	sets.RewardAxesDW = {}

	sets.precast.JA.Charm = {}

	-- CURING WALTZ
	sets.precast.Waltz = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Malignance tights",feet="Malignance Boots"}

		-- HEALING WALTZ
	sets.precast.Waltz['Healing Waltz'] = {}

		-- STEPS
	sets.precast.Step = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Malignance tights",feet="Malignance Boots"}

		-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}

	sets.precast.Flourish1['Violent Flourish'] = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Malignance tights",feet="Malignance Boots"}

	-- fix this set
	sets.precast.FC = {ammo="Impatiens",
		neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Jumalik Mail",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring"}
		
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

		-- MIDCAST SETS
	sets.midcast.FastRecast = {
		head="Gavialis Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Klouskap Sash",legs="Tali'ah Sera. +2",feet="Tot. Gaiters +1"}

		-- WEAPONSKILLS
		-- Default weaponskill sets.
	sets.precast.WS = {ammo="Coiste Bodhar",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sroda Earring",
		right_ear="Sherida Earring",
		left_ring="Epona's Ring",
		right_ring="Regal Ring",
		back=ArtioDA,
	}

	
	sets.precast.WS.Acc = {ammo="Coiste Bodhar",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sroda Earring",
		right_ear="Sherida Earring",
		left_ring="Epona's Ring",
		right_ring="Regal Ring",
		back=ArtioDA,
	}

	-- Specific weaponskill sets.
	sets.precast.WS['Decimation'] = {ammo="Coiste Bodhar",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Nukumi Ocreae +2", 
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sroda Earring", 
		right_ear="Sherida Earring", -- BST Empy Earring
		left_ring="Epona's Ring",
		right_ring="Gere Ring", 
		back=ArtioDA,
	}
	
	sets.precast.WS['Decimation'].UncappedAtt = {ammo="Coiste Bodhar",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Nukumi Ocreae +2", 
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sroda Earring", 
		right_ear="Sherida Earring", -- BST Empy Earring
		left_ring="Epona's Ring",
		right_ring="Gere Ring", 
		back=ArtioDA,
	}
	
	--sets.precast.WS['Decimation'].Mekira = set_combine(sets.precast.WS['Decimation'], {head="Gavialis Helm"})
	sets.precast.WS['Decimation'].Acc = set_combine(sets.precast.WS['Decimation'], {})
	
	sets.precast.WS['Ruinator'] = {ammo="Coiste Bodhar",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Nukumi Ocreae +2", 
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sroda Earring",
		right_ear="Sherida Earring", -- BST Empy Earring
		left_ring="Regal Ring",
		right_ring="Gere Ring", 
		back=ArtioDA,
	}
	
	sets.precast.WS['Ruinator'].UncappedAtt = {ammo="Coiste Bodhar",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Nukumi Ocreae +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sroda Earring",
		right_ear="Sherida Earring", -- BST Empy Earring
		left_ring="Regal Ring",
		right_ring="Gere Ring", 
		back=ArtioDA,
	}
	
	--sets.precast.WS['Ruinator'].Mekira = set_combine(sets.precast.WS['Ruinator'], {head="Gavialis Helm"})
	sets.precast.WS['Ruinator'].Acc = set_combine(sets.precast.WS['Ruinator'], {})
	
	sets.precast.WS['Calamity'] = {
		ammo="Crepuscular Pebble", -- Oshasha's Treatise (VR)
		head="Ankusa Helm +3",
		body="Nyame mail", -- BST EMPY body
		hands="Totemic Gloves +3", 
		legs="Gleti's Breeches",  
		feet="Nukumi Ocreae +2",
		neck="Beastmaster Collar +2",
		waist="Sailfi Belt +1", 
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Ephramad's ring",
		right_ring="Epaminondas's Ring",
		back=ArtioSTRWSD, -- Need STR WSD cape
	}
	
	sets.precast.WS['Calamity'].UncappedAtt = {
		ammo="Crepuscular Pebble", -- Oshasha's Treatise (VR)
		head="Ankusa Helm +3",
		body="Nyame mail", -- BST EMPY body
		hands="Totemic Gloves +3", 
		legs="Nyame Flanchard",  
		feet="Nukumi Ocreae +2",
		neck="Beastmaster Collar +2", 
		waist="Sailfi Belt +1", 
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Ephramad's ring",
		right_ring="Epaminondas's Ring",
		back=ArtioSTRWSD, -- Need STR WSD cape
	}
	
	--sets.precast.WS['Calamity'].Mekira = set_combine(sets.precast.WS['Calamity'], {head="Gavialis Helm"})
	sets.precast.WS['Calamity'].Acc = set_combine(sets.precast.WS['Calamity'], {})
	
	sets.precast.WS['Mistral Axe'] = {
		ammo="Crepuscular Pebble", -- Oshasha's Treatise (VR)
		head="Ankusa Helm +3",
		body="Nyame mail", -- BST EMPY body
		hands="Totemic Gloves +3",
		legs="Gleti's Breeches",  
		feet="Nukumi Ocreae +2",
		neck="Beastmaster Collar +2",
		waist="Sailfi Belt +1", 
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Ephramad's ring",
		right_ring="Epaminondas's Ring",
		back=ArtioSTRWSD, -- Need STR WSD cape
	}
	
	sets.precast.WS['Mistral Axe'].UncappedAtt = {
		ammo="Crepuscular Pebble", -- Oshasha's Treatise (VR)
		head="Ankusa Helm +3",
		body="Nyame mail", -- BST EMPY body
		hands="Totemic Gloves +3",
		legs="Nyame Flanchard",  
		feet="Nukumi Ocreae +2",
		neck="Beastmaster Collar +2",
		waist="Sailfi Belt +1", 
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Ephramad's ring",
		right_ring="Epaminondas's Ring",
		back=ArtioSTRWSD, -- Need STR WSD cape
	}
	
	--sets.precast.WS['Mistral Axe'].Mekira = set_combine(sets.precast.WS['Mistral Axe'], {head="Gavialis Helm"})
	sets.precast.WS['Mistral Axe'].Acc = set_combine(sets.precast.WS['Mistral Axe'], {})
	
	sets.precast.WS['Rampage'] = {ammo="Coiste Bodhar",
		head="Blistering Sallet +1",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Regal Ring",
		right_ring="Begrudging Ring",
		back=ArtioDA, -- STR/Crit cape
	}
	--sets.precast.WS['Rampage'].Mekira = set_combine(sets.precast.WS['Rampage'], {head="Gavialis Helm"})
	sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS['Rampage'], {})


	sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Onslaught'].Acc = set_combine(sets.precast.WS['Onslaught'], {})

	sets.precast.WS['Primal Rend'] = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Weather. Ring",
		back=ArtioSTRWSD
	}
	sets.precast.WS['Cloudsplitter'] = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Orpheus's Sash",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's ring", -- Maybe MAB ring?
		right_ring="Shiva Ring +1", 
		back=ArtioSTRWSD
	}

				-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {ammo="Hesperiidae",
		head="Emicho Coronet",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Crep. Earring",
		body=ValorousBodyQuad,hands="Nukumi Manoplas +2",ring1="Varar Ring",ring2="C. Palug Ring",
		back=ArtioPet,waist="Incarnation Sash",legs="Gleti's Breeches",feet="Gleti's Boots"}

	sets.midcast.Pet.SomeAcc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.FullAcc = set_combine(sets.midcast.Pet.WS, {})
	
	sets.midcast.Pet.MultiHitReady = {ammo="Hesperiidae",
		head="Emicho Coronet",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Crep. Earring",
		body=ValorousBodyQuad,hands="Nukumi Manoplas +2",ring1="Varar Ring",ring2="C. Palug Ring",
		back=ArtioPet,waist="Incarnation Sash",legs="Gleti's Breeches",feet="Gleti's Boots"}
				
	sets.midcast.Pet.MagicReady = {ammo="Hesperiidae",
		head=ValorousHeadPetMAB,neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Crep. Earring",
		body="Udug Jacket",hands="Nukumi Manoplas +2",ring1="Varar Ring",ring2="Varar Ring",
		back=ArtioPetMagic,waist="Incarnation Sash",legs=ValorousPantsPetMAB,feet=ValorousBootsPetMAB}
		
	sets.midcast.Pet.DebuffReady = {main="Agwu's Axe",sub=gear.PDTMABKumbha,ammo="Hesperiidae",
		head="Nyame helm",neck="Bst. Collar +2",ear1="Crep. Earring",ear2="Nukumi Earring",
		body="Nyame mail",hands="Nyame Gauntlets",ring1="Tali'ah Ring",ring2="C. Palug Ring",
		back=ArtioPetMagic,waist="Incarnation Sash",legs="Nyame Flanchard",feet="Gleti's Boots"}
		
	sets.midcast.Pet.PhysicalDebuffReady = {main="Agwu's Axe",sub=gear.PDTMABKumbha,ammo="Hesperiidae",
		head="Nyame helm",neck="Bst. Collar +2",ear1="Crep. Earring",ear2="Nukumi Earring",  -- Enmerkar and Nukumi +1 or +2
		body="Nyame mail",hands="Nyame Gauntlets",ring1="Tali'ah Ring",ring2="C. Palug Ring",  -- need C. Palug
		back=ArtioPetMagic,waist="Incarnation Sash",legs="Nyame Flanchard",feet="Gleti's Boots"} -- Need cape and Incarnation Sash

	sets.midcast.Pet.ReadyRecast = {legs="Gleti's Breeches"}
	sets.midcast.Pet.ReadyRecastDW = {legs="Gleti's Breeches"}
	sets.midcast.Pet.Neutral = {}
	sets.midcast.Pet.Favorable = {head="Nukumi Cabasset +1"}
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +2"}

	-- RESTING
	sets.resting = {}

	sets.idle = {ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
		
	sets.idle.Reraise = set_combine(sets.idle, {})

	sets.idle.Pet = {ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

	sets.idle.Pet.Engaged = {ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}

	sets.idle.Pet.Engaged.DW = {ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
	-- DEFENSE SETS
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Nyame helm",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

	sets.defense.PetPDT = {ammo="Staunch Tathlum +1",
		head="Nyame helm",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Nyame mail",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

	sets.defense.PetMDT = {ammo="Staunch Tathlum +1",
		head="Nyame helm",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Nyame mail",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

	sets.defense.PetMEVA = sets.defense.PetMDT

	sets.defense.PKiller = set_combine(sets.defense.PDT, {body="Nukumi Gausape +2"})
	sets.defense.Reraise = set_combine(sets.defense.PDT, {})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Nyame helm",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Nyame helm",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Odnowa Earring +1",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

	sets.defense.MKiller = set_combine(sets.defense.MDT, {body="Nukumi Gausape +2"})

	sets.Kiting = {feet="Skadi's Jambeaux"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Malignance tights",feet="Malignance Boots"}

	sets.engaged.Acc = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Malignance tights",feet="Malignance Boots"}

	-- MELEE (SINGLE-WIELD) HYBRID SETS
	sets.engaged.PDT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Malignance tights",feet="Malignance Boots"}

	sets.engaged.Acc.PDT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Malignance tights",feet="Malignance Boots"}


	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}

	sets.engaged.DW.Acc = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}


	-- MELEE (DUAL-WIELD) HYBRID SETS
	sets.engaged.DW.PDT = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}
	sets.engaged.DW.Acc.PDT = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}
	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
	sets.engaged.BothDD = set_combine(sets.engaged,{}) -- Needs work
	sets.engaged.BothDD.Acc = set_combine(sets.engaged.Acc, {}) -- Needs work

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
	sets.engaged.PetTank = set_combine(sets.engaged,{}) -- Needs work
	sets.engaged.PetTank.Acc = set_combine(sets.engaged.Acc, {}) -- Needs work
	
	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
	sets.engaged.DW.BothDD = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring", -- Needs work
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}
	sets.engaged.DW.BothDD.Acc = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring", -- Needs work
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}
	
	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
	sets.engaged.DW.PetTank = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring",   -- Needs work
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}
	sets.engaged.DW.PetTank.Acc = {
		ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu torque",ear1="Eabani Earring",ear2="Sherida Earring", -- Needs work
		body="Gleti's Cuirass",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=ArtioDA,waist="Reiki Yotai",legs="Malignance tights",feet="Malignance Boots"
	}

	sets.buff['Killer Instinct'] = {body="Nukumi Gausape +2"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head=ValorousMaskTH,waist="Chaac Belt"})
	sets.Knockback = {}
	
	-- Weapons sets
	sets.weapons.PetPDTAxe = {main="Dolichenus"}
	sets.weapons.DualWeapons = {main="Dolichenus",sub="Agwu axe"}
	sets.weapons.MaccAxes = {main="Mdomo Axe +1",sub="Agwu axe"}
	sets.weapons.AxeDagger = {main="Dolichenus",sub="Ternion dagger +1"}
	sets.weapons.Savage = {main="Naegling",sub="Agwu axe"}
	sets.weapons.Evisceration = {main="Tauret",sub="Agwu axe"}


-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
	sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
	sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
	sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
	sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
	sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
	sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
	sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
	sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
	sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
	sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
	sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
	sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
	sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
	sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
	sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
	sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
	sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
	sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
	sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

	-------------------------------------------------------------------------------------------------------------------
	-- Complete iLvl Jug Pet Precast List
	-------------------------------------------------------------------------------------------------------------------

	sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
	sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
	sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
	sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
	sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
	sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
	sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
	sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
	sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
	sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
	sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
	sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
	sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
	sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
	sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
	sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
	sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
	sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
	sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
	sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
	sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
	sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
	sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
	sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
	sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
	sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
	sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
	sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
	sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
	sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
	sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
	sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
	sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
	sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
	sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
	sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
	sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})
	sets.precast.JA['Bestial Loyalty'].PorterCrabFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rancid Broth"})
	sets.precast.JA['Bestial Loyalty'].JovialEdwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pungent Broth"})
	sets.precast.JA['Bestial Loyalty'].LynxFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Frizzante Broth"})
	sets.precast.JA['Bestial Loyalty'].VivaciousGaston = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spumante Broth"})
	sets.precast.JA['Bestial Loyalty'].YellowBeetleFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Zestul Sap"})
	sets.precast.JA['Bestial Loyalty'].EnergeticSefina = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gassy Sap"})
	sets.precast.JA['Bestial Loyalty'].SlimeFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Decaying Broth"})
	sets.precast.JA['Bestial Loyalty'].SultryPatrice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Putrescent Broth"})
	sets.precast.JA['Bestial Loyalty'].HippogryphFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Turpid Broth"})
	sets.precast.JA['Bestial Loyalty'].DaringRoland = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Feculent Broth"})

end

function job_precast(spell, spellMap, eventArgs)
        if spell.type == "WeaponSkill" and spell.english ~= 'Mistral Axe' and spell.english ~= 'Bora Axe' and spell.target.distance > target_distance then
                eventArgs.cancel = true
                add_to_chat(123, spell.name..' Canceled: [Out of Range]')

		elseif spell.english == 'Reward' then
			equip(sets.precast.JA.Reward[state.RewardMode.value])
			if can_dual_wield then
				equip(sets.RewardAxesDW)
			else
				equip(sets.RewardAxe)
			end

		elseif spell.english == 'Spur' then
			equip(sets.precast.JA.Spur)
			if can_dual_wield then
				equip(sets.SpurAxesDW)
			else
				equip(sets.SpurAxe)
			end

		elseif spell.english == 'Bestial Loyalty' then
				if state.JugMode.value == 'DroopyDortwin' and item_available('Vis. Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].PonderingPeter)
				elseif state.JugMode.value == 'SunburstMalfik' and item_available('Ferm. Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].AgedAngus)
				elseif state.JugMode.value == 'ScissorlegXerin' and item_available('Bubbly Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].BouncingBertha)
				elseif state.JugMode.value == 'AttentiveIbuki' and item_available('Windy Greens') then
					equip(sets.precast.JA['Bestial Loyalty'].SwoopingZhivago)
				elseif state.JugMode.value == 'RedolentCandi' and item_available('Bug-Ridden Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].AlluringHoney)
				elseif state.JugMode.value == 'CaringKiyomaro' and item_available('Tant. Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].VivaciousVickie)
				elseif state.JugMode.value == 'ColibriFamiliar' and item_available('Glazed Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].ChoralLeera)
				elseif state.JugMode.value == 'SpiderFamiliar' and item_available('Slimy Webbing') then
					equip(sets.precast.JA['Bestial Loyalty'].GussyHachirobe)
				elseif state.JugMode.value == 'SurgingStorm' and item_available('Deepwater Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].SubmergedIyo)
				elseif state.JugMode.value == 'AcuexFamiliar' and item_available('Venomous Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].FluffyBredo)
				elseif state.JugMode.value == 'MosquitoFamiliar' and item_available('Heavenly Broth') then
					equip(sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'])
				elseif state.JugMode.value == 'PorterCrabFamiliar' and item_available('Pungent Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].JovialEdwin)
				elseif state.JugMode.value == 'LynxFamiliar' and item_available('Spumante Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].VivaciousGaston)
				elseif state.JugMode.value == 'YellowBeetleFamiliar' and item_available('Gassy Sap') then
					equip(sets.precast.JA['Bestial Loyalty'].EnergeticSefina)
				elseif state.JugMode.value == 'SlimeFamiliar' and item_available('Putrescent Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].SultryPatrice)
				elseif state.JugMode.value == 'HippogryphFamiliar' and item_available('Feculent Broth') then
					equip(sets.precast.JA['Bestial Loyalty'].DaringRoland)
				else
					equip(sets.precast.JA['Bestial Loyalty'][state.JugMode.value])
				end

		elseif spell.english == 'Call Beast' then
				equip(sets.precast.JA['Bestial Loyalty'][state.JugMode.value])

-- Define class for Sic and Ready moves.
        elseif spell.type == 'Monster' then
                classes.CustomClass = "WS"
                if can_dual_wield then
					equip(sets.midcast.Pet.ReadyRecastDW)
                else
					equip(sets.midcast.Pet.ReadyRecast)
                end
        end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 9)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 010')
end