function user_job_setup()
	state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
	state.HybridMode:options('Normal','PDT','PetTank','BothDD')
	state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'Refresh', 'Reraise')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PetPDT', 'PDT', 'Reraise', 'PKiller')
	state.MagicalDefenseMode:options('PetMDT','MDT', 'MKiller')
	state.ResistDefenseMode:options('PetMEVA', 'MEVA')
	state.Weapons:options('None','DualWeapons')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Knockback','Suppa','DWEarrings'}

	gear.PHYKumbha1 = {name="Kumbhakarna", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl.Atk."+4 Pet: Crit.hit rate +4','Pet: TP Bonus+180',}}
	gear.PHYKumbha2 = {name="Kumbhakarna", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: TP Bonus+160',}}
	gear.PDTMABKumbha = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+200',}}
	gear.MABKumbha = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+19','Pet: TP Bonus+160',}}
	
	ArtioDA = { name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	ArtioMNDWSD = { name="Artio's Mantle", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}
	ValorousHeadSTRWSD = { name="Valorous Mask", augments={'Attack+25','Weapon skill damage +4%','STR+14','Accuracy+10',}}
	ValorousBodySTRWSD = { name="Valorous Mail", augments={'Attack+26','Weapon skill damage +4%','STR+8',}}
	ValorousBootsSTRWSD = { name="Valorous Greaves", augments={'Weapon skill damage +5%','AGI+9','Accuracy+13','Attack+4',}}
	ValorousPantsSTP = { name="Valor. Hose", augments={'Attack+30','"Store TP"+7','DEX+8','Accuracy+5',}}
	ValorousBootsDA = { name="Valorous Greaves", augments={'Accuracy+16 Attack+16','"Dbl.Atk."+4','INT+12','Accuracy+15',}}
	ValorousBootsMABWS = { name="Valorous Greaves", augments={'"Mag.Atk.Bns."+20','"Blood Pact" ability delay -5','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}
	
	ValorousPantsPetDA = { name="Valor. Hose", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+3','Pet: VIT+5','Pet: Accuracy+6 Pet: Rng. Acc.+6',}}
    ValorousBootsPetDA = { name="Valorous Greaves", augments={'Pet: "Dbl. Atk."+5','Pet: VIT+3','Pet: Accuracy+4 Pet: Rng. Acc.+4','Pet: Attack+15 Pet: Rng.Atk.+15',}}
	
	ValorousHeadPetMAB = { name="Valorous Mask", augments={'Pet: "Mag.Atk.Bns."+30','"Store TP"+2','Pet: DEX+9','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Attack+10 Pet: Rng.Atk.+10',}}
	ValorousPantsPetMAB = { name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','"Dbl.Atk."+1','Pet: AGI+2',}}
    ValorousBootsPetMAB = { name="Valorous Greaves", augments={'Pet: "Mag.Atk.Bns."+30',}}

	-- Set up Jug Pet cycling and keybind Ctrl+F7
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode', 'HippogryphFamiliar', 'SlimeFamiliar','PorterCrabFamiliar','YellowBeetleFamiliar','ScissorlegXerin','BlackbeardRandy','GenerousArthur','AttentiveIbuki','DroopyDortwin','WarlikePatrick','AcuexFamiliar'}
	send_command('bind ^f7 gs c cycle JugMode')

	-- Set up Monster Correlation Modes and keybind Alt+F7
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	send_command('bind !f7 gs c cycle CorrelationMode')

	-- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
	state.PetMode = M{['description']='Pet Mode','Tank','DD'}
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
	sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +3"} --head="Ankusa Helm +1"
	sets.precast.JA['Bestial Loyalty'] = {body="Mirke Wardecors",hands="Ankusa Gloves +1"}
	sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
	sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
	sets.precast.JA.Tame = {head="Totemic Helm +1"}
	sets.precast.JA.Spur = {back="Artio's Mantle",feet="Nukumi Ocreae +1"}
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
		head=gear.valorous_pet_head,neck="Loricate Torque +1",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Tot. Jackcoat +3",hands="Regimen Mittens",ring1="Valseur's Ring",ring2="Asklepian Ring",
		back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet="Valorous Greaves"}

		-- HEALING WALTZ
	sets.precast.Waltz['Healing Waltz'] = {}

		-- STEPS
	sets.precast.Step = {ammo="Voluspa Tathlum",
		head="Gavialis Helm",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Heartseeker Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Valorous Greaves"}

		-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {ammo="Voluspa Tathlum",
		head="Gavialis Helm",neck="Combatant's Torque",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Olseni Belt",legs="Flamma Dirs +2",feet="Valorous Greaves"}

	sets.precast.FC = {ammo="Impatiens",
		neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Jumalik Mail",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring"}
		sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

		-- MIDCAST SETS
	sets.midcast.FastRecast = {
		head="Gavialis Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Klouskap Sash",legs="Tali'ah Sera. +2",feet="Tot. Gaiters +1"}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Cure = {
		head="Gavialis Helm",neck="Phalaina Locket",ear1="Enmerkar Earring",ear2="Handler's Earring +1",
		body="Sacro Breastplate",hands="Macabre Gaunt. +1",ring1="Lebeche Ring",ring2="Janniston Ring",
		back="Pastoralist's Mantle",waist="Klouskap Sash",legs="Tali'ah Sera. +2",feet="Tot. Gaiters +1"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.midcast.Stoneskin = sets.midcast.FastRecast

	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})

	sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {ring2="Sheltered Ring"})
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {ring2="Sheltered Ring"})
	sets.midcast.Shellra = sets.midcast.Shell

	sets.midcast['Enfeebling Magic'] = sets.midcast.FastRecast

	sets.midcast['Elemental Magic'] = sets.midcast.FastRecast

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']

		-- WEAPONSKILLS
		-- Default weaponskill sets.
	sets.precast.WS = {ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet=ValorousBootsDA,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}

	sets.precast.WS.SomeAcc = {ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet=ValorousBootsDA,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA
	}
	
	sets.precast.WS.Acc = {ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet=ValorousBootsDA,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA
	}

	sets.precast.WS.FullAcc = {ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet=ValorousBootsDA,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA
	}

	-- Specific weaponskill sets.
	sets.precast.WS['Decimation'] = {ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands="Argosy Mufflers +1",
		legs="Meg. Chausses +2",
		feet="Argosy Sollerets +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}
	--sets.precast.WS['Decimation'].Mekira = set_combine(sets.precast.WS['Decimation'], {head="Gavialis Helm"})
	sets.precast.WS['Decimation'].WSMidAcc = set_combine(sets.precast.WS.WSMidAcc, {})
	sets.precast.WS['Decimation'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {})
	
	sets.precast.WS['Ruinator'] = {ammo="Aurgelmir Orb +1",
		head="Argosy Celata +1",
		body="Argosy Hauberk +1",
		hands="Argosy Mufflers +1",
		legs="Argosy Breeches +1",
		feet="Argosy Sollerets +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}
	--sets.precast.WS['Ruinator'].Mekira = set_combine(sets.precast.WS['Ruinator'], {head="Gavialis Helm"})
	sets.precast.WS['Ruinator'].WSMidAcc = set_combine(sets.precast.WS.WSMidAcc, {})
	sets.precast.WS['Ruinator'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {})
	
	sets.precast.WS['Calamity'] = {ammo="Aurgelmir Orb +1",
		head="Ankusa Helm +3",
		body=ValorousBodySTRWSD,
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
		feet=ValorousBootsSTRWSD,
		neck="Caro Necklace",
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Regal Ring",
		right_ring="Epaminondas's Ring",
		back=ArtioMNDWSD,
	}
	--sets.precast.WS['Calamity'].Mekira = set_combine(sets.precast.WS['Calamity'], {head="Gavialis Helm"})
	sets.precast.WS['Calamity'].WSMidAcc = set_combine(sets.precast.WS.WSMidAcc, {})
	sets.precast.WS['Calamity'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {})
	
	sets.precast.WS['Mistral Axe'] = {ammo="Aurgelmir Orb +1",
		head="Ankusa Helm +3",
		body=ValorousBodySTRWSD,
		hands="Meg. Gloves +2",
		legs={ name="Lustr. Subligar +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
		feet=ValorousBootsSTRWSD,
		neck="Caro Necklace",
		waist="Sailfi Belt +1",
		left_ear="Moonshade Earring",
		right_ear="Thrud Earring",
		left_ring="Regal Ring",
		right_ring="Epaminondas's Ring",
		back=ArtioMNDWSD,
	}
	--sets.precast.WS['Mistral Axe'].Mekira = set_combine(sets.precast.WS['Mistral Axe'], {head="Gavialis Helm"})
	sets.precast.WS['Mistral Axe'].WSMidAcc = set_combine(sets.precast.WS.WSMidAcc, {})
	sets.precast.WS['Mistral Axe'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {})
	
	sets.precast.WS['Rampage'] = {ammo="Aurgelmir Orb +1",
		head="Skormoth Mask",
		body="Tali'ah Manteel +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +2",
		feet=ValorousBootsDA,
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}
	--sets.precast.WS['Rampage'].Mekira = set_combine(sets.precast.WS['Rampage'], {head="Gavialis Helm"})
	sets.precast.WS['Rampage'].WSMidAcc = set_combine(sets.precast.WS.WSMidAcc, {})
	sets.precast.WS['Rampage'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {})

	sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Onslaught'].WSMidAcc = set_combine(sets.precast.WSMidAcc, {})
	sets.precast.WS['Onslaught'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {})

	sets.precast.WS['Primal Rend'] = {
		ammo="Dosis Tathlum",
		head="Ankusa Helm +3",
		body="Sacro Breastplate",
		hands="Leyline Gloves",
		legs="Augury Cuisses +1",
		feet=ValorousBootsMABWS,
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Regal Ring",
		right_ring="Weather. Ring",
		back=ArtioMNDWSD
	}
	sets.precast.WS['Cloudsplitter'] = {
		ammo="Dosis Tathlum",
		head="Jumalik Helm",
		body="Sacro Breastplate",
		hands="Leyline Gloves",
		legs="Augury Cuisses +1",
		feet=ValorousBootsMABWS,
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Regal Ring",
		right_ring="Epaminondas's ring",
		back=ArtioMNDWSD
	}

		-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

				-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {ammo="Voluspa Tathlum",
		head="Emicho Coronet +1",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="Domesticator's Earring",
		body="Taeon Tabard",hands="Nukumi Manoplas +1",ring1="Varar Ring",ring2="C. Palug Ring",
		back="Artio's Mantle",waist="Incarnation Sash",legs=ValorousPantsPetDA,feet=ValorousBootsPetDA}

	sets.midcast.Pet.SomeAcc = set_combine(sets.midcast.Pet.WS, {})
	sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {head="Totemic Helm +1"})
	sets.midcast.Pet.FullAcc = set_combine(sets.midcast.Pet.WS, {head="Totemic Helm +1"})
				
	sets.midcast.Pet.MagicReady = {ammo="Voluspa Tathlum",
		head=ValorousHeadPetMAB,neck="Adad Amulet",ear1="Enmerkar Earring",ear2="Domesticator's Earring",
		body="Emicho Haubert +1",hands="Nukumi Manoplas +1",ring1="Varar Ring",ring2="Varar Ring",
		back="Artio's Mantle",waist="Incarnation Sash",legs=ValorousPantsPetMAB,feet=ValorousBootsPetMAB}

	sets.midcast.Pet.ReadyRecast = {legs="Desultor Tassets"}
	sets.midcast.Pet.ReadyRecastDW = {legs="Desultor Tassets"}
	sets.midcast.Pet.Neutral = {head="Totemic Helm +1"}
	sets.midcast.Pet.Favorable = {head="Nukumi Cabasset +1"}
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1"}

	-- RESTING
	sets.resting = {}

	sets.idle = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Sacro Breastplate",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}

	sets.idle.Refresh = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Sacro Breastplate",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	sets.idle.Pet = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Sacro Breastplate",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}

	sets.idle.Pet.Engaged = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Sacro Breastplate",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}

	sets.idle.Pet.Engaged.DW = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Sacro Breastplate",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}
	-- DEFENSE SETS
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}

	sets.defense.PetPDT = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}

	sets.defense.PetMDT = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}

	sets.defense.PetMEVA = sets.defense.PetMDT

	sets.defense.PKiller = set_combine(sets.defense.PDT, {body="Nukumi Gausape +1"})
	sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meghanada chausses +2",feet="Malignance boots"}

	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Malignance chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Genmei Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Regal Ring",ring2="Defending Ring",
		back=ArtioDA,waist="Flume Belt",legs="Meg. Chausses +2",feet="Malignance boots"}

	sets.defense.MKiller = set_combine(sets.defense.MDT, {body="Nukumi Gausape +1"})

	sets.Kiting = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

	sets.engaged.SomeAcc = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

	sets.engaged.Acc = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

	sets.engaged.FullAcc = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}


	-- MELEE (SINGLE-WIELD) HYBRID SETS
	sets.engaged.PDT = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

	sets.engaged.SomeAcc.PDT = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

	sets.engaged.Acc.PDT = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

	sets.engaged.FullAcc.PDT = {ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",neck="Anu torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
		back=ArtioDA,waist="Sailfi Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

	-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {
		ammo="Aurgelmir Orb +1",
		head="Emicho coronet +1",
		body="Tali'ah Manteel +2",
		hands="Emi. Gauntlets +1",
		legs=ValorousPantsSTP,
		feet=ValorousBootsDA,
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}

	sets.engaged.DW.SomeAcc = {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Tali'ah Manteel +2",
		hands="Emi. Gauntlets +1",
		legs=ValorousPantsSTP,
		feet=ValorousBootsDA,
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}

	sets.engaged.DW.Acc = {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Tali'ah Manteel +2",
		hands="Emi. Gauntlets +1",
		legs=ValorousPantsSTP,
		feet=ValorousBootsDA,
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}

	sets.engaged.DW.FullAcc = {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Tali'ah Manteel +2",
		hands="Emi. Gauntlets +1",
		legs=ValorousPantsSTP,
		feet=ValorousBootsDA,
		neck="Anu Torque",
		waist="Sailfi Belt +1",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back=ArtioDA,
	}

	-- MELEE (DUAL-WIELD) HYBRID SETS
	sets.engaged.DW.PDT = set_combine(sets.engaged.PDT, {})
	sets.engaged.DW.SomeAcc.PDT = set_combine(sets.engaged.SomeAcc.PDT, {})
	sets.engaged.DW.Acc.PDT = set_combine(sets.engaged.Acc.PDT, {})
	sets.engaged.DW.FullAcc.PDT = set_combine(sets.engaged.FullAcc.PDT, {})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
	sets.engaged.BothDD = set_combine(sets.engaged,{})
	sets.engaged.BothDD.SomeAcc = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.BothDD.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.BothDD.FullAcc = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.BothDD.Fodder = set_combine(sets.engaged.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
	sets.engaged.PetTank = set_combine(sets.engaged,{})
	sets.engaged.PetTank.SomeAcc = set_combine(sets.engaged.SomeAcc, {})
	sets.engaged.PetTank.Acc = set_combine(sets.engaged.Acc, {})
	sets.engaged.PetTank.FullAcc = set_combine(sets.engaged.FullAcc, {})
	sets.engaged.PetTank.Fodder = set_combine(sets.engaged.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
	sets.engaged.DW.BothDD = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.BothDD.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {})
	sets.engaged.DW.BothDD.Acc = set_combine(sets.engaged.DW.Acc, {})
	sets.engaged.DW.BothDD.FullAcc = set_combine(sets.engaged.DW.FullAcc, {})
	sets.engaged.DW.BothDD.Fodder = set_combine(sets.engaged.DW.Fodder, {})

	-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
	sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,{})
	sets.engaged.DW.PetTank.SomeAcc = set_combine(sets.engaged.DW.SomeAcc, {})
	sets.engaged.DW.PetTank.Acc = set_combine(sets.engaged.DW.Acc, {})
	sets.engaged.DW.PetTank.FullAcc = set_combine(sets.engaged.DW.FullAcc, {})
	sets.engaged.DW.PetTank.Fodder = set_combine(sets.engaged.DW.Fodder, {})

	sets.buff['Killer Instinct'] = {body="Nukumi Gausape +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Sherida Earring"}
	sets.DWEarrings = {}
	
	-- Weapons sets
	sets.weapons.PetPDTAxe = {main ="Dolichenus"}
	sets.weapons.DualWeapons = {main ="Dolichenus",sub="Barbarity +1"}
	sets.weapons.AxeDagger = {main ="Dolichenus",sub="Tauret"}


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