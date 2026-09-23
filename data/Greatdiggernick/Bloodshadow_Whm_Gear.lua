-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Marin') --'DualWeapons','MeleeWeapons',

	gear.obi_cure_waist = "Shinjutsu-no-obi +1"
	gear.obi_cure_back = "Alaunus's Cape"

--	gear.obi_nuke_waist = "Sekhmet Corset"
--	gear.obi_high_nuke_waist = "Yamabuki-no-Obi"
--	gear.obi_nuke_back = "Toro Cape"

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
--	sets.weapons.MeleeWeapons = {main="Izcalli",sub="Ammurapi Shield"}
--	sets.weapons.DualWeapons = {main="Izcalli",sub="Nehushtan"}
	sets.weapons.Marin = {main="Marin Staff +1",sub="Mensch Strap"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { --82-84 FC before staff/subjob. 7 Quick magic. 
    main="Oranyan",
    sub="Giuoco Grip",
    ammo="Impatiens",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -1%','"Cure" spellcasting time -4%',}},
    legs="Pinga Pants +1",
    feet="Regal Pumps +1",
    neck="Cleric's torque +2",
    waist="Witful Belt",
    right_ear="Malignance Earring",
    left_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
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

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sanctity Necklace",
    waist="Refoccilation Stone",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Malignance Earring",
    left_ring="Karieyh Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",}
		
 --   sets.precast.WS.Dagan = {}
		
	sets.precast.WS.Cataclysm = {
		ammo="Ombre Tathlum +1",
		head="Pixie Hairpin +1",
		body="Shamash Robe",
		hands="Bunzi's Gloves",
		legs="Bunzi's Pants",
		feet="Bunzi's Sabots",
		neck="Sanctity Necklace",
		waist="Sekhmet Corset",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
		ring1="Archon Ring",
		ring2={name="Stikini Ring +1", bag="wardrobe2"},
		back="Aurist's Cape +1"}
	
    sets.precast.WS['Earth Crusher'] = 	
    {
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Quanpur Necklace",
    waist="Refoccilation Stone",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    right_ear="Malignance Earring",
    left_ring="Karieyh Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Alaunus's Cape",
}
		
	sets.MaxTP = {} --ear1="Cessance Earring",ear2="Brutal Earring"
	sets.MaxTP.Dagan = {} --ear1="Etiolation Earring",ear2="Evans Earring"

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}

    -- Midcast Sets

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {}
	sets.latent_refresh_grip = {}
	sets.TPEat = {} --neck="Chrys. Torque"
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {}) 
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {
    ammo="Ombre Tathlum +1",
    head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
    body="Chironic Doublet",
    hands="Shrieker's Cuffs",
    legs={ name="Vanya Slops", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Defending Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}  
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {} --No
	
    sets.midcast.FastRecast = {main="Oranyan",
    sub="Giuoco Grip",
    ammo="Sapience Orb",
    head="Bunzi's Hat",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -1%','"Cure" spellcasting time -4%',}},
    legs="Pinga Pants +1",
    feet="Regal Pumps +1",
    neck="Cleric's torque +2",
    waist="Witful Belt",
    right_ear="Malignance Earring",
    left_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Mephitas's Ring +1",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.FastRecast
	
	sets.midcast.Cure = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Theophany Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Shinjutsu-no-obi +1",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Fi Follet Cape +1",
}
		
	sets.midcast.CureSolace = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Ebers Bliaut +2",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
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
    body="Theophany Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Korin Obi",
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
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Korin Obi",
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
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Korin Obi",
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
    body="Theophany Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Korin Obi",
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
    body="Theophany Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Shinjutsu-no-obi +1",
    left_ear="Gifted Earring",
    right_ear="Mendi. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Fi Follet Cape +1",
}
		
	sets.midcast.LightWeatherCuraga = {
    main="Chatoyant Staff",
    sub="Giuoco Grip",
    ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Theophany Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Korin Obi",
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
    body="Theophany Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Korin Obi",
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
		
	--Melee Curesets are used whenever your Weapons state is set to anything but None.
	sets.midcast.MeleeCure = {ammo="Ombre Tathlum +1",
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    body="Theophany Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs="Ebers Pant. +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck={ name="Clr. Torque +2", augments={'Path: A',}},
    waist="Shinjutsu-no-obi +1",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Fi Follet Cape +1",
}
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Korin Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaut +2",waist="Korin Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Korin Obi"})

	sets.midcast.CureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	sets.midcast.LightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})
	sets.midcast.LightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Korin Obi"})
	sets.midcast.LightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Korin Obi"})
	sets.midcast.LightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.LightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})
	sets.midcast.LightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})
	sets.midcast.MeleeCure.DT = set_combine(sets.midcast.Cure.DT, {})
	
	sets.midcast.MeleeCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2"})
	sets.midcast.MeleeLightWeatherCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})
	sets.midcast.MeleeLightWeatherCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Korin Obi"})
	sets.midcast.MeleeLightDayCureSolace.DT = set_combine(sets.midcast.Cure.DT, {body="Ebers Bliaut +2",waist="Korin Obi"})
	sets.midcast.MeleeLightDayCure.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})
	sets.midcast.MeleeCuraga.DT = set_combine(sets.midcast.Cure.DT, {})
	sets.midcast.MeleeLightWeatherCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})
	sets.midcast.MeleeLightDayCuraga.DT = set_combine(sets.midcast.Cure.DT, {waist="Korin Obi"})

	sets.midcast.Cursna = {
    ammo="Sapience Orb",
    head="Ebers Cap +2",
    body="Ebers Bliaut +2",
    hands={ name="Fanatic Gloves", augments={'MP+25','Healing magic skill +5','"Conserve MP"+1','"Fast Cast"+2',}},
    legs="Th. Pantaloons +2",
    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    neck="Debilis Medallion",
    waist="Witful Belt",
    left_ear="Gifted Earring",
    right_ear="Malignance Earring",
    left_ring="Haoma's Ring",
    right_ring="Menelaus's Ring",
    back="Alaunus's Cape",
}

	sets.midcast.StatusRemoval = {
    ammo="Sapience Orb",
    head="Ebers Cap +2",
    body="Zendik Robe",
    hands="Ebers Mitts +2",
    legs="Th. Pantaloons +2",
    feet="Regal Pumps +1",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Gifted Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Rahab Ring",
    back={ name="Fi Follet Cape +1", augments={'Path: A',}},
}
		
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Cleric's Torque +2"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		head="Telchine Cap",neck="Melic Torque",ear2="Mendi. Earring",ear1="Gifted Earring",
		body="Telchine Chas.",hands={ name="Telchine Gloves", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +9',}},ring1={name="Stikini Ring +1", bag="wardrobe1"},ring2={name="Stikini Ring +1", bag="wardrobe2"},
		back="Fi Follet Cape +1",waist="Embla Sash",legs="Telchine Braconi",feet="Theo. Duckbills +3"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",waist="Siegel Sash"}) --ear2="Earthcry Earring",legs="Shedir Seraweels"

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +2"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {hands="Regal Cuffs"}) --main="Vadose Rod",sub="Ammurapi Shield",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {hands="Ebers Mitts +2",legs="Theophany Pantaloons +2"}) 
	
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
		
	sets.midcast['Elemental Magic'] = {
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

	sets.midcast['Elemental Magic'].Resistant = {
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
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck="Erra Pendant",
    waist=gear.ElementalObi,
    left_ear="Digni. Earring",
    right_ear="Malignance Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}

	sets.midcast['Dark Magic'] = {
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

    sets.midcast.Drain = {
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

    sets.midcast.Drain.Resistant = {
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

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

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
    hands="Regal Cuffs",
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
    ring1={name="Stikini Ring +1", bag="wardrobe1"},
	ring2={name="Stikini Ring +1", bag="wardrobe2"},
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
	sets.idle = {  --47pdt, 27Mdt, 5-6 Refresh
    main="Daybreak",
    sub="Genmei Shield", 
    ammo="Homiliary",
    head="Bunzi's Hat", 
    body="Shamash Robe",  
    hands="Bunzi's Gloves",
    legs="Assid. Pants +1",
    feet="Bunzi's Sabots",
    neck="Sanctity Necklace",
    waist="Carrier's Sash",
    left_ear="Mendi. Earring",
    right_ear="Gifted Earring",
    left_ring={name="Stikini Ring +1", bag="wardrobe1"},
    right_ring={name="Stikini Ring +1", bag="wardrobe2"},
    back="Moonlight Cape", 
}


	sets.idle.PDT = {
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
		
	sets.idle.MDT = {
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
		
	sets.idle.Weak = {
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

    -- Defense sets

	sets.defense.PDT = {
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

	sets.defense.MDT = {
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

    sets.defense.MEVA = {
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
		
		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {}

    sets.engaged.Acc = {}

	sets.engaged.DW = {}

    sets.engaged.DW.Acc = {}

		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +2",back="Mending Cape"}

	sets.HPDown = {}

	sets.HPCure = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 3)
end