function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Kick','Acc')
    state.WeaponskillMode:options('Match', 'UncappedAtt','Normal', 'Acc', 'Proc')
    state.HybridMode:options('Normal', 'DT', 'Counter')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Godhands','Verethragna','Staff','None','ProcStaff','ProcClub','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	SegomoCrit =	{ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	SegomoSTRDA =	{ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	SegomoTP = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	
	-- HercHelmSTRTA = { name="Herculean Helm", augments={'Accuracy+22','"Triple Atk."+4'}}
	-- HercHelmSTRWSD = { name="Herculean Helm", augments={'Accuracy+29','Weapon skill damage +4%','STR+5','Attack+5',}}
	-- HercHelmMABWSD = { name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +4%','Mag. Acc.+4','"Mag.Atk.Bns."+3',}}
	-- HercGlovesMABWS = { name="Herculean Gloves", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +4%',}}
	-- HercGlovesSTRTA = { name="Herculean Gloves", augments={'Rng.Atk.+10','"Triple Atk."+4','STR+3','Attack+11',}}
	-- HercPantsSTRWSD = { name="Herculean Trousers", augments={'Attack+16','Weapon skill damage +3%','STR+10','Accuracy+7',}}
	-- HercPantsMAB = { name="Herculean Trousers", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','Weapon skill damage +4%','INT+2','Mag. Acc.+2','"Mag.Atk.Bns."+14',}}
	-- HercPantsRAWS = { name="Herculean Trousers", augments={'Rng.Acc.+13','Weapon skill damage +5%','AGI+7',}}
    -- HercBootsSTRTA = { name="Herculean Boots", augments={'Attack+24','"Triple Atk."+3','STR+3','Accuracy+12',}}
	-- HercBootsMABWSD = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','STR+13','Mag. Acc.+5',}}
	-- HercBootsRattWSD = { name="Herculean Boots", augments={'Rng.Atk.+24','Weapon skill damage +4%','AGI+12',}}
	-- HercBootsWSD = { name="Herculean Boots", augments={'Attack+21','Weapon skill damage +4%','VIT+7',}}
	-- HercBodyQuad = { name="Herculean Vest", augments={'Pet: Mag. Acc.+26','Pet: INT+2','Quadruple Attack +3','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
    -- HercBodyRattWSD = { name="Herculean Vest", augments={'Rng.Acc.+12 Rng.Atk.+12','Weapon skill damage +4%','DEX+3','Rng.Acc.+1',}}
	-- HercBodyWSD = { name="Herculean Vest", augments={'Weapon skill damage +4%','AGI+3','Accuracy+10',}}
	
	sets.Obi = {waist="Hachirin-no-obi"}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs="Hesychast's Hose +3"}
    sets.precast.JA['Boost'] = {hands="Anchorite's gloves +3"}
    sets.precast.JA['Dodge'] = {feet="Anchorite's Gaiters +3"}
    sets.precast.JA['Focus'] = {head="Anchorite's Crown +1"}
    sets.precast.JA['Counterstance'] = {feet="Hesychast's Gaiters +3"}
    sets.precast.JA['Footwork'] = {feet="Tantra Gaiters +2"}
    sets.precast.JA['Formless Strikes'] = {body="Hesychast's Cyclas"}
    sets.precast.JA['Mantra'] = {feet="Hesychast's Gaiters +3"}

	sets.precast.JA['Chi Blast'] = {}
	
	sets.precast.JA['Chakra'] = {
		ammo="Coiste Bodhar",
        head="Genmei Kabuto",neck="Unmoving Collar",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
        body="Anchorite's Cyclas +1",hands="Anchorite's gloves +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Mpaca's Hose",feet="Hesychast's Gaiters +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=SegomoTP,waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
		
	sets.precast.Flourish1 = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=SegomoTP,waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}


	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
	head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
	body="Dread Jupon",hands="Leyline Gloves",ring2="Lebeche Ring",ring2="Kishar Ring",
	legs="Rawhide Trousers"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
        head="Hesychast's crown +3",neck="Fotia Gorget",ear1="Telos Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Anchorite's gloves +3",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoSTRDA,waist="Moonbow belt +1",legs="Hiza. Hizayoroi +2",feet="Kendatsuba sune-ate +1"}

	sets.precast.WS.Proc = {
		ammo={name="Staunch Tathlum +1", priority=1},
		head=empty,
		body=empty,
		hands=empty,
		legs=empty,
		feet=empty,
		neck={name="Unmoving Collar +1", priority=1},
		waist={name="Plat. Mog. Belt", priority=1},
		left_ear={name="Odnowa Earring +1", priority=1},
		right_ear={name="Tuisto Earring", priority=1},
		left_ring={name="Gelatinous Ring +1", priority=1},
		right_ring=empty,
		back=empty
	}

    sets.precast.MaxTP = {}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)

    -- Specific weaponskill sets.

	sets.precast.WS['Raging Fists'] = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		body="Malignance tabard",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Mnk. Nodowa +2",
		waist="Moonbow belt +1",
		left_ear="Moonshade earring",
		right_ear="Schere Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS['Raging Fists'].UncappedAtt = {
		ammo="Coiste Bodhar",
		head="Mpaca's Cap",
		body="Bhikku Cyclas +3",
		hands="Bhikku gloves +3",
		legs="Mpaca's hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS['Howling Fist'] = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Nyame Sollerets",
		neck="Mnk. Nodowa +2",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Schere Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}
	
    sets.precast.WS['Howling Fist'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}
    sets.precast.WS['Asuran Fists'] = {
		ammo="Crepuscular Pebble",
		head="Nyame helm",
		body="Nyame Mail",
		hands="Bhikku gloves +3",
		legs="Nyame Flanchard",
		feet="Mpaca's Boots",
		neck="Mnk. Nodowa +2",
		waist="Moonbow belt +1",
		left_ear="Moonshade earring",
		right_ear="Schere Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS['Asuran Fists'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Nyame helm",
		body="Nyame Mail",
		hands="Bhikku gloves +3",
		legs="Nyame Flanchard",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade earring",
		right_ear="Schere Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS["Ascetic's Fury"] = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		body="Nyame Mail",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Kendatsuba sune-ate +1",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Schere Earring",
		right_ear="Sherida Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoCrit
	}

	sets.precast.WS["Ascetic's Fury"].UncappedAtt = {
		ammo="Knobkierrie",
		head="Adhemar Bonnet +1",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko +1",
		legs="Kendatsuba hakama +1",
		feet="Ryuo Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoCrit
	}
	
    sets.precast.WS["Victory Smite"] = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		body="Kendatsuba Samue +1",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Sherida Earring",
		right_ear="Schere Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoCrit
	}

	sets.precast.WS["Victory Smite"].Impetus = {
		ammo="Crepuscular Pebble",
		head="Adhemar Bonnet +1",
		body="Bhikku Cyclas +3",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Sherida Earring",
		right_ear="Schere Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS["Victory Smite"].UncappedAtt = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko +1",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Sherida Earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoCrit
	}

	sets.precast.WS["Victory Smite"].UncappedAtt.Impetus = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko +1",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Sherida Earring",
		right_ear="Schere Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}
		
    sets.precast.WS['Shijin Spiral'] = {
		ammo="Crepuscular Pebble",
		head="Kendatsuba jinpachi +1",
		body="Adhemar Jacket +1",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Kendatsuba sune-ate +1",
		neck="Mnk. Nodowa +2",
		waist="Moonbow belt +1",
		left_ear="Mache Earring +1",
		right_ear="Sherida Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS['Shijin Spiral'].UncappedAtt = {
		ammo="Coiste Bodhar",
		head="Kendatsuba jinpachi +1",
		body="Bhikku Cyclas +3",
		hands="Bhikku gloves +3",
		legs="Nyame Flanchard",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Schere Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

    sets.precast.WS['Dragon Kick'] = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Mnk. Nodowa +2",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS['Dragon Kick'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

    sets.precast.WS['Tornado Kick']    = {
		ammo="Crepuscular Pebble",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Bhikku gloves +3",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Mnk. Nodowa +2",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Ephramad's Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}

	sets.precast.WS['Tornado Kick'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoSTRDA
	}
	
	sets.precast.WS['Cataclysm'] = {
		head="Pixie hairpin +1",neck="Sibyl Scarf",ear1="Friomisi earring",ear2="Malignance Earring",
        body="Nyame mail",hands="Nyame gauntlets",ring1="Archon ring",ring2="Epaminondas's Ring",
        back=SegomoSTRDA,waist="Eschan stone",legs="Nyame flanchard",feet="Nyame sollerets"
	}
	
	sets.precast.WS["Shell Crusher"]   = {
		ammo="Pemphredo tathlum",
        head="Malignance Chapeau",neck="Moonlight necklace",ear1="Dignitary's Earring",ear2="Gwati Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Null Shawl",waist="Luminary Sash",legs="Malignance tights",feet="Malignance boots"
	}

    -- Midcast Sets
    sets.midcast.FastRecast = {}
        
    -- Specific spells
    sets.midcast.Utsusemi = {}
		
	sets.enmity = {
		ammo="Sapience Orb",
		head="Halitus helm", neck="Moonlight Necklace", ear1="Trux earring", ear2="Cryptic earring",
		body="Emet Harness +1", hands="Kurys gloves", ring1="Petrov ring", ring2="Eihwaz ring",
		back="Enuma mantle", waist="Kasiri Belt", legs="", feet="Ahosi leggings"
	}
	
	sets.precast.JA["Provoke"] = sets.enmity

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Idle sets
    sets.idle = {ammo="Staunch tathlum +1",
        head="Nyame helm",neck="Bathy choker +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Nyame mail",hands="Nyame gauntlets",ring1="Chirich Ring +1",ring2="Defending Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

    -- Defense sets
    sets.defense.PDT = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}

    sets.defense.MDT = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
		
	sets.defense.MEVA = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}

	
	sets.Kiting = {feet="Herald's gaiters"}
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
	sets.engaged = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.SomeAcc = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.Acc = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Mache Earring +1",
        body="Kendatsuba samue +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
	sets.engaged.Kick = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}

    -- Defensive melee hybrid sets
    sets.engaged.DT = {ammo="Coiste Bodhar",
        head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
        body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
	sets.engaged.Kick.DT = {ammo="Coiste Bodhar",
        head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
        body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
    sets.engaged.SomeAcc.DT = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
    sets.engaged.Acc.DT = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
    sets.engaged.Counter = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Bathy Choker +1",ear1="Cryptic Earring",ear2="Bhikku Earring +1",
		body="Mpaca's Doublet",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Hesychast's gaiters +3"}
    sets.engaged.Acc.Counter = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Bathy Choker +1",ear1="Cryptic Earring",ear2="Bhikku Earring +1",
		body="Mpaca's Doublet",hands="Malignance Gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Hesychast's gaiters +3"}


    -- Hundred Fists/Impetus melee set mods
    -- sets.engaged.HF = set_combine(sets.engaged, {})
    -- sets.engaged.HF.Impetus = set_combine(sets.engaged, {})
    -- sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
    -- sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {})
    -- sets.engaged.Counter.HF = set_combine(sets.engaged.Counter, {})
    -- sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {}) 
    -- sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter, {})
    -- sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {}) 

	 -- Footwork combat form
	sets.engaged.Footwork = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
	sets.engaged.Footwork.Acc = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Schere Earring",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}

	-- GODHANDS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	sets.engaged.Godhands = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.Godhands.SomeAcc = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.Godhands.Acc = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Mache Earring +1",
        body="Kendatsuba samue +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}

    -- Defensive melee hybrid sets
    sets.engaged.Godhands.DT = {ammo="Coiste Bodhar",
        head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
        body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
    sets.engaged.Godhands.SomeAcc.DT = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
    sets.engaged.Godhands.Acc.DT = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Malignance boots"}
    sets.engaged.Godhands.Counter = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Bathy Choker +1",ear1="Mache Earring +1",ear2="Bhikku Earring +1",
		body="Mpaca's Doublet",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Hesychast's gaiters +3"}
    sets.engaged.Godhands.Acc.Counter = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Bathy Choker +1",ear1="Mache Earring +1",ear2="Bhikku Earring +1",
		body="Mpaca's Doublet",hands="Malignance Gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Hesychast's gaiters +3"}


    -- Hundred Fists/Impetus melee set mods
    sets.engaged.Godhands.HF = set_combine(sets.engaged.Godhands, {})
    sets.engaged.Godhands.Acc.HF = set_combine(sets.engaged.Godhands.Acc)
    sets.engaged.Godhands.Counter.HF = set_combine(sets.engaged.Godhands.Counter, {})
    sets.engaged.Godhands.Acc.Counter.HF = set_combine(sets.engaged.Godhands.Acc.Counter, {})

	 -- Footwork combat form
	sets.engaged.Godhands.Footwork = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
	sets.engaged.Godhands.Footwork.Acc = {ammo="Coiste Bodhar",
		head="Mpaca's Cap",neck="Mnk. Nodowa +2",ear1="Mache Earring +1",ear2="Sherida Earring",
		body="Mpaca's Doublet",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=SegomoTP,waist="Moonbow belt +1",legs="Bhikku hose +3",feet="Anchorite's Gaiters +3"}
   
        
    -- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
    sets.impetus_body = {body="Bhikku Cyclas +3"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's Necklace",ring1="Blenmot's Ring",ring2="Purity Ring"})
	sets.buff.Sleep = {}
	sets.buff.Impetus = {body="Bhikku Cyclas +3"}
	sets.precast.Footwork = {feet="Shukuyu Sune-ate"}
	sets.buff.Boost = {waist="Ask Sash"}
	
	sets.FootworkWS = {feet="Anchorite's Gaiters +3"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
	-- Weapons sets
	sets.weapons.Verethragna = {main="Verethragna"}
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Malignance Pole",sub="Bloodrain Strap"}
	sets.weapons.ProcDagger = {main="Wind Knife"}
	sets.weapons.ProcSword = {main="Nihility"}
	sets.weapons.ProcGreatSword = {main="Ophidian Sword",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Tzee Xicu's Blade",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Mutsunokami +1",sub=empty}
	sets.weapons.ProcClub = {main="Octave Club",sub=empty}
	sets.weapons.ProcStaff = {main="Lamia Staff",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	set_macro_page(1, 13)
end