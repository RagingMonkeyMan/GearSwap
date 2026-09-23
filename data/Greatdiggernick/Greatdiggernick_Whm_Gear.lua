-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None')

	gear.obi_cure_waist = "Austerity Belt +1"
	gear.obi_cure_back = "Alaunus's Cape"

	gear.obi_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_nuke_back = "Toro Cape"

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { 
    main="C. Palug hammer",
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Ayanmo Cosciales +2",
    feet="Regal Pumps +1",
    neck="Voltsurge torque",
    waist="Embla Sash",
    right_ear="Malignance Earring",
    left_ear="Loquac. Earring",
    left_ring="Weatherspoon Ring",
    right_ring="Kishar Ring",
    back="Alaunus's Cape",
}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pant. +2"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {right_ear="Mendi. Earring",legs="Ebers Pant. +2"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact =  set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Thuellaic Ecu +1"})

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety bliaut"}

    -- -- Waltz set (chr and vit)
    -- sets.precast.Waltz = {
	-- 	head="Nahtirah Hat",ear1="Roundel Earring",
	-- 	body="Piety bliaut",hands="Telchine Gloves",
	-- 	waist="Chaac Belt",back="Aurist's Cape +1"}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    -- sets.precast.WS = {ammo="Hasty Pinion +1",
	-- 	head="Befouled Crown",neck="Asperity Necklace",ear1="Moonshade Earring",ear2="Brutal Earring",
	-- 	body="Kaykaus Bliaut",hands="Telchine Gloves",ring1={name="Stikini Ring +1", bag="wardrobe1"},ring2={name="Stikini Ring +1", bag="wardrobe2"},
	-- 	back="Buquwik Cape",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}
		
    -- sets.precast.WS.Dagan = {ammo="Hasty Pinion +1",
	-- 	head="Befouled Crown",neck="Asperity Necklace",ear1="Etiolation Earring",ear2="Moonshade Earring",
	-- 	body="Kaykaus Bliaut",hands="Telchine Gloves",ring1={name="Stikini Ring +1", bag="wardrobe1"},ring2={name="Stikini Ring +1", bag="wardrobe2"},
	-- 	back="Buquwik Cape",waist="Fotia Belt",legs="Assid. Pants +1",feet="Gende. Galosh. +1"}
		
	-- sets.precast.WS.Cataclysm = {sub="Alber Strap",
	-- 	ammo="Ombre Tathlum +1",
	-- 	head="Pixie Hairpin +1",
	-- 	body="Shamash Robe",
	-- 	hands="Bunzi's Gloves",
	-- 	legs="Bunzi's Pants",
	-- 	feet="Bunzi's Sabots",
	-- 	neck="Nefarious Collar +1",
	-- 	waist="Sekhmet Corset",
	-- 	ear1="Regal Earring",
	-- 	ear2="Friomisi Earring",
	-- 	ring1="Archon Ring",
	-- 	ring2={name="Stikini Ring +1", bag="wardrobe2"},
	-- 	back="Aurist's Cape +1"}
	
--     sets.precast.WS['Earth Crusher'] = 	
--     {sub="Alber Strap",
--     ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
--     head="Nyame Helm",
--     body="Nyame Mail",
--     hands="Nyame Gauntlets",
--     legs="Nyame Flanchard",
--     feet="Nyame Sollerets",
--     neck="Quanpur Necklace",
--     waist="Refoccilation Stone",
--     left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
--     right_ear="Malignance Earring",
--     left_ring="Karieyh Ring",
--     right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
--     back="Alaunus's Cape",
-- }

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	-- sets.latent_refresh_grip = {sub="Oneiros Grip"}
	-- sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	-- sets.NightIdle = {back="Umbra Cape"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	-- sets.ConserveMP = {main=gear.grioavolr_fc_staff,sub="Umbra Strap",ammo="Hasty Pinion +1",
	-- 	head="Vanya Hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Gwati Earring",
	-- 	body="Vedic Coat",hands="Fanatic Gloves",ring1="Weatherspoon Ring",ring2="Mephitas's Ring +1",
	-- 	back="Solemnity Cape",waist="Austerity Belt +1",legs="Vanya Slops",feet="Medium's Sabots"}
		
	-- sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    -- sets.MagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {
    main="C. Palug hammer",
    ammo="Impatiens",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Inyanga Jubbah +2",
    hands="Gende. Gages +1",
    legs="Ayanmo Cosciales +2",
    feet="Regal Pumps +1",
    neck="Voltsurge torque",
    waist="Witful Belt",
    right_ear="Malignance Earring",
    left_ear="Loquac. Earring",
    left_ring="Weatherspoon Ring",
    right_ring="Kishar Ring",
    back="Alaunus's Cape",
}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Bunzi's Robe",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Shinjutsu-no-obi +1",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",
}
		
	sets.midcast.CureSolace = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Ebers Bliaut +2",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Shinjutsu-no-obi +1",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",
}

	sets.midcast.LightWeatherCure = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vanya Robe",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Twilight Cape",
}

	sets.midcast.LightWeatherCureSolace = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Ebers Bliaut +2",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",
}
		
	sets.midcast.LightDayCureSolace = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Ebers Bliaut +2",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",
}

	sets.midcast.LightDayCure = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vanya Robe",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Twilight Cape",
}

	sets.midcast.Curaga = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vanya Robe",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Shinjutsu-no-obi +1",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",
}
		
	sets.midcast.LightWeatherCuraga = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vanya Robe",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Twilight Cape",
}
		
	sets.midcast.LightDayCuraga = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Vanya Robe",
    hands="Vanya Cuffs",
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Twilight Cape",
}

	sets.midcast.Cure.DT = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Bunzi's Hat",
    body="Bunzi's Robe",
    hands="Bunzi's Gloves",
    legs="Assid. Pants +1",
    feet="Bunzi's Sabots",
    neck="Loricate Torque +1",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
    back="Moonlight Cape",
}
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
-- 	sets.midcast.MeleeCure = {ammo="Ombre Tathlum +1",
--     head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
--     body="Bunzi's Robe",
--     hands="Vanya Cuffs",
--     legs="Ebers Pant. +2",
--     feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
--     neck="Cleric's Torque", --{ name="Clr. Torque +2", augments={'Path: A',}},
--     waist="Shinjutsu-no-obi +1",
--     left_ear="Mendi. Earring",
--     right_ear="Gifted Earring",
--     left_ring="Lebeche Ring",
--     right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
--     back="Alaunus's Cape",
-- }
		
	-- sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2"})
	-- sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	-- sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	-- sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	-- sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	-- sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})
	-- sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Hachirin-no-Obi"})

	sets.midcast.Cursna = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Ebers Cap +2",neck="Debilis Medallion",ear1="Meili Earring",ear2="Malignance Earring",
		body="Ebers Bliaut +2",hands="Fanatic Gloves",ring1="Haoma's Ring",ring2="Mephitas's Ring +1",
		back="Alaunus's Cape",waist="Witful Belt",legs="Theo. Pant. +2",feet="Vanya Clogs"}

	sets.midcast.StatusRemoval = {main=gear.grioavolr_fc_staff,sub="Clemency Grip",ammo="Hasty Pinion +1",
		head="Ebers Cap +2",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Fanatic Gloves",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		bback="Alaunus's Cape",waist="Witful Belt",legs="Ebers Pant. +2",feet="Regal Pumps +1"}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		head="Telchine Cap",neck="Melic Torque",ear1="Mendi. Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands={ name="Telchine Gloves", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +9',}},ring1={name="Stikini Ring +1", bag="wardrobe1"},ring2={name="Stikini Ring +1", bag="wardrobe2"},
		back="Alaunus's Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Theo. Duckbills +3"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"}) --ear2="Earthcry Earring",legs="Shedir Seraweels"

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +2"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {}) --main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {hands="Ebers Mitts +2",legs="Theo. Pant. +2"}) 
	
--	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Luminary Sash"})
--	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",feet="Piety Duckbills +1",ear1="Gifted Earring",waist="Luminary Sash"})
--	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Luminary Sash"})
--	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",legs="Piety Pantaln. +1",ear1="Gifted Earring",waist="Luminary Sash"})
	
	sets.midcast.BarElement = {main="Beneficus",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		head="Ebers Cap +2",neck="Sanctity Necklace",ear1="Mendi. Earring",ear2="Gifted Earring",
		body="Ebers Bliaut +2",hands="Ebers Mitts +2",ring1={name="Stikini Ring +1", bag="wardrobe1"},ring2={name="Stikini Ring +1", bag="wardrobe2"},
		back="Alaunus's Cape",waist="Embla Sash",legs="Piety Pantaln. +3",feet="Ebers Duckbills +2"}

	sets.midcast.Impact = {
    main="Daybreak",sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
    body="Twilight Cloak",
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
-- 	sets.midcast['Elemental Magic'] = {
--     main="Daybreak",sub="Ammurapi Shield",
--     ammo="Pemphredo Tathlum",
-- 	head=empty,
--     body={ name="Cohort Cloak +1", augments={'Path: A',}},
--     hands="Inyan. Dastanas +2",
--     legs="Chironic Hose",
--     feet="Theo. Duckbills +3",
--     neck="Erra Pendant",
--     waist="Luminary Sash",
--     left_ear="Digni. Earring",
--     right_ear="Malignance Earring",
--     ring1={name="Stikini Ring +1", bag="wardrobe1"},
-- 	ring2={name="Stikini Ring +1", bag="wardrobe2"},
--     back={ name="Aurist's Cape +1", augments={'Path: A',}},
-- }

-- 	sets.midcast['Elemental Magic'].Resistant = {
--     main="Daybreak",sub="Ammurapi Shield",
--     ammo="Pemphredo Tathlum",
-- 	head=empty,
--     body={ name="Cohort Cloak +1", augments={'Path: A',}},
--     hands="Inyan. Dastanas +2",
--     legs="Chironic Hose",
--     feet="Theo. Duckbills +3",
--     neck="Erra Pendant",
--     waist="Luminary Sash",
--     left_ear="Digni. Earring",
--     right_ear="Malignance Earring",
--     ring1={name="Stikini Ring +1", bag="wardrobe1"},
-- 	ring2={name="Stikini Ring +1", bag="wardrobe2"},
--     back={ name="Aurist's Cape +1", augments={'Path: A',}},
-- }

	sets.midcast['Divine Magic'] = {
    main="Daybreak",sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
	sets.midcast.Holy = {
    main="Daybreak",sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Bunzi's Sabots",
    neck="Erra Pendant",
    waist=gear.ElementalObi,
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}

-- 	sets.midcast['Dark Magic'] = {
--     main={ name="Contemplator +1", augments={'Path: A',}},
--     sub="Enki Strap",
--     ammo="Pemphredo Tathlum",
-- 	head=empty,
--     body={ name="Cohort Cloak +1", augments={'Path: A',}},
--     hands="Inyan. Dastanas +2",
--     legs="Chironic Hose",
--     feet="Theo. Duckbills +3",
--     neck="Erra Pendant",
--     waist="Luminary Sash",
--     left_ear="Digni. Earring",
--     right_ear="Malignance Earring",
--     ring1={name="Stikini Ring +1", bag="wardrobe1"},
-- 	ring2={name="Stikini Ring +1", bag="wardrobe2"},
--     back={ name="Aurist's Cape +1", augments={'Path: A',}},
-- }

--     sets.midcast.Drain = {
--     main={ name="Contemplator +1", augments={'Path: A',}},
--     sub="Enki Strap",
--     ammo="Pemphredo Tathlum",
-- 	head=empty,
--     body={ name="Cohort Cloak +1", augments={'Path: A',}},
--     hands="Inyan. Dastanas +2",
--     legs="Chironic Hose",
--     feet="Theo. Duckbills +3",
--     neck="Erra Pendant",
--     waist="Luminary Sash",
--     left_ear="Digni. Earring",
--     right_ear="Malignance Earring",
--     ring1={name="Stikini Ring +1", bag="wardrobe1"},
-- 	ring2={name="Stikini Ring +1", bag="wardrobe2"},
--     back={ name="Aurist's Cape +1", augments={'Path: A',}},
-- }

--     sets.midcast.Drain.Resistant = {
--     main={ name="Contemplator +1", augments={'Path: A',}},
--     sub="Enki Strap",
--     ammo="Pemphredo Tathlum",
-- 	head=empty,
--     body={ name="Cohort Cloak +1", augments={'Path: A',}},
--     hands="Inyan. Dastanas +2",
--     legs="Chironic Hose",
--     feet="Theo. Duckbills +3",
--     neck="Erra Pendant",
--     waist="Luminary Sash",
--     left_ear="Digni. Earring",
--     right_ear="Malignance Earring",
--     ring1={name="Stikini Ring +1", bag="wardrobe1"},
-- 	ring2={name="Stikini Ring +1", bag="wardrobe2"},
--     back={ name="Aurist's Cape +1", augments={'Path: A',}},
-- }

    -- sets.midcast.Aspir = sets.midcast.Drain
	-- sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

	sets.midcast.Stun = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}

	sets.midcast.Stun.Resistant = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
	sets.midcast.Dispel = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})

	sets.midcast['Enfeebling Magic'] = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1="Stikini Ring",
	ring2="Kishar ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}

	sets.midcast['Enfeebling Magic'].Resistant = {
    main={ name="Contemplator +1", augments={'Path: A',}},
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
	head=empty,
    body={ name="Cohort Cloak +1", augments={'Path: A',}},
    hands="Inyan. Dastanas +2",
    legs="Chironic Hose",
    feet="Theo. Duckbills +3",
    neck="Erra Pendant",
    waist="Luminary Sash",
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1="Stikini Ring",
	ring2="Kishar ring",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back="Alaunus's Cape"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {}) --back="Alaunus's Cape"

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Bunzi's Hat",
    body="Shamash Robe",
    hands="Bunzi's Gloves",
    legs="Assid. Pants +1",
    feet="Bunzi's Sabots",
    neck="Loricate Torque +1",
    waist="Luminary Sash",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
    back="Moonlight Cape",
}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes) 
	sets.idle = {
        main="Bolelabunga",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Ebers bliaut +2",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Ebers pantaloons +2",feet="Nyame Sollerets"}


	sets.idle.PDT = {
        main="Bolelabunga",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Ebers bliaut +2",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Ebers pantaloons +2",feet="Nyame Sollerets"}
		
	sets.idle.MDT = {
        main="Bolelabunga",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Ebers bliaut +2",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Ebers pantaloons +2",feet="Nyame Sollerets"}
		
	sets.idle.Weak = {
        main="Bolelabunga",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Ebers bliaut +2",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Ebers pantaloons +2",feet="Nyame Sollerets"}

    -- Defense sets

	sets.defense.PDT = {
        main="Bolelabunga",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Ebers bliaut +2",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Ebers pantaloons +2",feet="Nyame Sollerets"}

	sets.defense.MDT = {
        main="Bolelabunga",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Ebers bliaut +2",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Ebers pantaloons +2",feet="Nyame Sollerets"}

    sets.defense.MEVA = {
        main="Bolelabunga",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Ebers bliaut +2",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
		back="Solemnity Cape",waist="Carrier's Sash",legs="Ebers pantaloons +2",feet="Nyame Sollerets"}
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    -- sets.engaged = {ammo="Staunch Tathlum +1",
    --     head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
	-- 	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
    --     back="Kayapa Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

    -- sets.engaged.Acc = {ammo="Hasty Pinion +1",
    --     head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Brutal Earring",
	-- 	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
    --     back="Kayapa Cape",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	-- sets.engaged.DW = {ammo="Staunch Tathlum +1",
    --     head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Telos Earring",ear2="Suppanomimi",
	-- 	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
    --     back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}

    -- sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
    --     head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Suppanomimi",
	-- 	body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",Ring2="Ilabrat Ring",
    --     back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2",back="Mending Cape"}

	-- sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
	-- 	body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
	-- 	back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}

	-- sets.HPCure = {main="Queller Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
	-- 	head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
	-- 	body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Kunaji Ring",ring2="Meridian Ring",
	-- 	back="Alaunus's Cape",waist="Eschan Stone",legs="Ebers Pant. +2",feet="Kaykaus Boots"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'buffson' then
		send_command('cpaddon cmd start')
	elseif commandArgs[1]:lower() == 'buffsoff' then
		send_command('cpaddon cmd stop')
	end
end