function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc', 'Fodder')
    state.WeaponskillMode:options('Match','Normal', 'SomeAcc', 'Acc', 'FullAcc')
    state.HybridMode:options('Normal', 'PDT', 'Counter')
    state.PhysicalDefenseMode:options('PDT', 'HP')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Verethragna','Staff','ProcStaff','ProcClub','Barehanded','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')

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
	
	SegomoDA ={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
	SegomoWSD ={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
	AdhemarDEX = { name="Adhemar Wrist. +1", bag="Wardrobe 2"}
	
	HercHelmSTRTA = { name="Herculean Helm", augments={'Accuracy+22','"Triple Atk."+4'}}
	HercHelmSTRWSD = { name="Herculean Helm", augments={'Accuracy+29','Weapon skill damage +4%','STR+5','Attack+5',}}
	HercHelmMABWSD = { name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +4%','Mag. Acc.+4','"Mag.Atk.Bns."+3',}}
	HercGlovesMABWS = { name="Herculean Gloves", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +4%',}}
	HercGlovesSTRTA = { name="Herculean Gloves", augments={'Rng.Atk.+10','"Triple Atk."+4','STR+3','Attack+11',}}
	HercPantsSTRWSD = { name="Herculean Trousers", augments={'Attack+16','Weapon skill damage +3%','STR+10','Accuracy+7',}}
	HercPantsMAB = { name="Herculean Trousers", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','Weapon skill damage +4%','INT+2','Mag. Acc.+2','"Mag.Atk.Bns."+14',}}
	HercPantsRAWS = { name="Herculean Trousers", augments={'Rng.Acc.+13','Weapon skill damage +5%','AGI+7',}}
    HercBootsSTRTA = { name="Herculean Boots", augments={'Attack+24','"Triple Atk."+3','STR+3','Accuracy+12',}}
	HercBootsMABWSD = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+22','Weapon skill damage +4%','STR+13','Mag. Acc.+5',}}
	HercBootsRattWSD = { name="Herculean Boots", augments={'Rng.Atk.+24','Weapon skill damage +4%','AGI+12',}}
	HercBootsWSD = { name="Herculean Boots", augments={'Attack+21','Weapon skill damage +4%','VIT+7',}}
	HercBodyQuad = { name="Herculean Vest", augments={'Pet: Mag. Acc.+26','Pet: INT+2','Quadruple Attack +3','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
    HercBodyRattWSD = { name="Herculean Vest", augments={'Rng.Acc.+12 Rng.Atk.+12','Weapon skill damage +4%','DEX+3','Rng.Acc.+1',}}
	HercBodyWSD = { name="Herculean Vest", augments={'Weapon skill damage +4%','AGI+3','Accuracy+10',}}
	
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
		ammo="Aurgelmir orb +1",
        head="Genmei Kabuto",neck="Unmoving Collar",ear1="Telos Earring",ear2="Sherida Earring",
        body="Anchorite's Cyclas +1",hands="Anchorite's gloves +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Hiza. Hizayoroi +2",feet="Hesychast's Gaiters +3"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Hiza. Hizayoroi +2",feet="Malignance Boots"}
		
	sets.precast.Flourish1 = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Moonbeam Nodowa",ear1="Mache Earring +1",ear2="Telos Earring",
		body="Malignance Tabard",hands="Hesychast's Gloves +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Segomo's Mantle",waist="Olseni Belt",legs="Mummu Kecks +2",feet="Malignance Boots"}


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
        back=SegomoWSD,waist="Moonbow belt +1",legs="Hiza. Hizayoroi +2",feet="Kendatsuba sune-ate +1"}

    sets.precast.WSAcc = {}
    sets.precast.WSMod = {}
    sets.precast.MaxTP = {}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)
    sets.precast.WS.Mod = set_combine(sets.precast.WS, sets.precast.WSMod)

    -- Specific weaponskill sets.

    sets.precast.WS['Raging Fists']    = {
		ammo="Knobkierrie",
		head="Adhemar bonnet +1",
		body="Adhemar jacket +1",
		hands=AdhemarDEX,
		legs="Kendatsuba hakama +1",
		feet="Kendatsuba sune-ate +1",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoDA
	}
	
    sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Hesychast's crown +3",
		body="Kendatsuba Samue +1",
		hands="Anchorite's gloves +3",
		legs="Kendatsuba hakama +1",
		feet=HercBootsSTRTA,
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoWSD
	})
    sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {})
    
	sets.precast.WS["Ascetic's Fury"]   = {
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
		back=SegomoWSD
	}
	
    sets.precast.WS["Victory Smite"]   = {
		ammo="Knobkierrie",
		head="Adhemar Bonnet +1",
		body="Kendatsuba Samue +1",
		hands="Ryuo Tekko +1",
		legs="Kendatsuba hakama +1",
		feet="Ryuo Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Odr Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoDA
	}
		
    sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Kendatsuba jinpachi +1",
		body="Malignance tabard",
		hands="Malignance gloves",
		legs="Kendatsuba hakama +1",
		feet="Kendatsuba sune-ate +1",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Mache Earring +1",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoDA
	})
    sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Hesychast's crown +3",
		body="Kendatsuba Samue +1",
		hands="Anchorite's gloves +3",
		legs="Kendatsuba hakama +1",
		feet="Anchorite's Gaiters +3",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoWSD
	})
    sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Hesychast's crown +3",
		body="Kendatsuba Samue +1",
		hands="Anchorite's gloves +3",
		legs="Kendatsuba hakama +1",
		feet="Anchorite's Gaiters +3",
		neck="Fotia Gorget",
		waist="Moonbow belt +1",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Gere Ring",
		back=SegomoWSD
	})
	
	sets.precast.WS['Cataclysm'] = {
		head="Pixie hairpin +1",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Hecate's Earring",
        body=HercBodyQuad,hands=HercGlovesMABWS,ring1="Archon ring",ring2="Epaminondas's Ring",
        back=SegomoWSD,waist="Eschan stone",legs=HercPantsMAB,feet=HercBootsMABWSD
	}
	
	sets.precast.WS["Shell Crusher"]   = {
		ammo="Pemphredo tathlum",
        head="Malignance Chapeau",neck="Moonlight necklace",ear1="Dignitary's Earring",ear2="Gwati Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Stikini Ring",ring2="Stikini Ring",
        back=SegomoDA,waist="Luminary Sash",legs="Hesychast's hose +3",feet="Malignance boots"
	}

    sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
    sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
    sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
    sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc)
    sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc)
    sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
    sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
    sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

    sets.precast.WS["Raging Fists"].Mod = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSMod)
    sets.precast.WS["Howling Fist"].Mod = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSMod)
    sets.precast.WS["Asuran Fists"].Mod = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSMod)
    sets.precast.WS["Ascetic's Fury"].Mod = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSMod)
    sets.precast.WS["Victory Smite"].Mod = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSMod)
    sets.precast.WS["Shijin Spiral"].Mod = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSMod)
    sets.precast.WS["Dragon Kick"].Mod = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSMod)
    sets.precast.WS["Tornado Kick"].Mod = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSMod)

    
    
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Whirlpool Mask",ear2="Loquacious Earring",
        body="Otronif Harness +1",hands="Thaumas Gloves",
        waist="Black Belt",feet="Otronif Boots +1"}
        
    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Whirlpool Mask",ear2="Loquacious Earring",
        body="Otronif Harness +1",hands="Thaumas Gloves",
        waist="Black Belt",legs="Qaaxo Tights",feet="Otronif Boots +1"}
		
	sets.emnity = {
		ammo="Sapience Orb",
		head="Halitus helm", neck="Moonlight Necklace", ear1="Trux earring", ear2="Cryptic earring",
		body="Emet Harness +1", hands="Kurys gloves", ring1="Petrov ring", ring2="Eihwaz ring",
		back="Enuma mantle", waist="Kasiri Belt", legs="", feet="Ahosi leggings"
	}
	
	sets.precast.JA["Provoke"] = sets.emnity

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Bathy choker +1",
        body="Hesychast's Cyclas",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Idle sets
    sets.idle = {ammo="Aurgelmir orb +1",
        head="Malignance Chapeau",neck="Bathy choker +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Hiza. Haramaki +2",hands="Malignance gloves",ring1="Chirich Ring +1",ring2="Defending Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}

    sets.idle.Town = {ammo="Aurgelmir orb +1",
        head="Kendatsuba jinpachi +1",neck="Moonbeam nodowa",ear1="Telos Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}
    
    sets.idle.Weak = {ammo="Aurgelmir orb +1",
        head="Kendatsuba jinpachi +1",neck="Bathy choker +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}

    sets.defense.HP = {ammo="Staunch tathlum +1",
        head="Kendatsuba jinpachi +1",neck="Loricate torque +1",ear1="Odnowa Earring +1",ear2="Odnowa Earring",
        body="Kendatsuba samue +1",hands=AdhemarDEX,ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Moonbeam cape",waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Hermes' sandals"}

    sets.defense.MDT = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}
		
	sets.defense.MEVA = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}

	
	sets.Kiting = {feet="Hermes' sandals"}
	-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
	sets.engaged = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Telos Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Hesychast's hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.SomeAcc = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Mache Earring +1",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Hesychast's hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.Acc = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Mache Earring +1",ear2="Mache Earring +1",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Hesychast's hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.Mod = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Telos Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Hesychast's hose +3",feet="Anchorite's Gaiters +3"}

    -- Defensive melee hybrid sets
    sets.engaged.PDT = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}
    sets.engaged.SomeAcc.PDT = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}
    sets.engaged.Acc.PDT = {ammo="Staunch tathlum +1",
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Telos Earring",ear2="Sherida Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Kendatsuba hakama +1",feet="Malignance boots"}
    sets.engaged.Counter = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Genmei Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Samnuha tights",feet="Hesychast's gaiters +3"}
    sets.engaged.Acc.Counter = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Mache Earring +1",ear2="Mache Earring +1",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Samnuha tights",feet="Hesychast's gaiters +3"}


    -- Hundred Fists/Impetus melee set mods
    sets.engaged.HF = set_combine(sets.engaged, {legs="Hesychast's hose +3"})
    sets.engaged.HF.Impetus = set_combine(sets.engaged, {body="Bhikku Cyclas +1",legs="Hesychast's hose +3"})
    sets.engaged.Acc.HF = set_combine(sets.engaged.Acc)
    sets.engaged.Acc.HF.Impetus = set_combine(sets.engaged.Acc, {body="Bhikku Cyclas +1", legs="Hesychast's hose +3"})
    sets.engaged.Counter.HF = set_combine(sets.engaged.Counter, {legs="Hesychast's hose +3"})
    sets.engaged.Counter.HF.Impetus = set_combine(sets.engaged.Counter, {body="Bhikku Cyclas +1", legs="Hesychast's hose +3"}) 
    sets.engaged.Acc.Counter.HF = set_combine(sets.engaged.Acc.Counter, {legs="Hesychast's hose +3"})
    sets.engaged.Acc.Counter.HF.Impetus = set_combine(sets.engaged.Acc.Counter, {body="Bhikku Cyclas +1", legs="Hesychast's hose +3"}) 


    -- Footwork combat form
    sets.engaged.Footwork = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Telos Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Hesychast's hose +3",feet="Anchorite's Gaiters +3"}
    sets.engaged.Footwork.Acc = {ammo="Aurgelmir orb +1",
        head="Adhemar bonnet +1",neck="Moonbeam nodowa",ear1="Telos Earring",ear2="Sherida Earring",
        body="Kendatsuba samue +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Niqmaddu Ring",ring2="Gere Ring",
        back=SegomoDA,waist="Moonbow belt +1",legs="Hesychast's hose +3",feet="Anchorite's Gaiters +3"}
        
    -- Quick sets for post-precast adjustments, listed here so that the gear can be Validated.
    sets.impetus_body = {body="Bhikku Cyclas +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Impetus = {body="Bhikku Cyclas +1"}
	sets.buff.Footwork = {feet="Anchorite's Gaiters +3"}
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {feet="Anchorite's Gaiters +3"}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {legs="Ryuo Hakama"}
	
	-- Weapons sets
	sets.weapons.Verethragna = {main="Verethragna"}
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Malignance Pole",sub="Bloodrain Strap"}
	sets.weapons.ProcStaff = {main="Terra's Staff"}
	sets.weapons.ProcClub = {main="Mafic Cudgel"}
	sets.weapons.ProcSword = {main="Ark Sword",sub=empty}
	sets.weapons.ProcGreatSword = {main="Lament",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	set_macro_page(1, 2)
end