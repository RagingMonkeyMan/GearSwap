function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','DualWeapons')

	GeoNukeCape = { name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}
	GeoRegenCape = { name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	
	autoindi = "Haste"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geo. Tunic +1",back=GeoRegenCape}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua sandals +3"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +3"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="C. Palug hammer",sub=None,ammo="Impatiens",
		head="Vanya hood",neck="Voltsurge Torque",ear1="Malignance Earring",ear2="Loquacious Earring",
		body="Agwu's Robe",hands="Agwu's gages",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back="Lifestream Cape",waist="Embla sash",legs="Agwu's Slops",feet="Regal pumps +1"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines +1"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Malignance Earring",ear2="Enchntr. Earring +1",
		body="Twilight Cloak",hands="Volte Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geo. Pants +1",feet="Regal Pumps +1"}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="C. Palug hammer",sub=None,ammo="Impatiens",
	head="Vanya hood",neck="Voltsurge Torque",ear1="Malignance Earring",ear2="Loquacious Earring",
	body="Agwu's Robe",hands="Agwu's gages",ring1="Weatherspoon Ring",ring2="Kishar Ring",
	back="Lifestream Cape",waist="Witful Belt",legs="Agwu's Slops",feet="Agwu's pigaches"}

	sets.midcast.Geomancy = {main="Idris",sub="Genmei Shield",range="Dunna",
		head="Azimuth Hood +3",neck="Bagua Charm +2",ear1="Gna Earring",ear2="Fulla Earring",
		body="Bagua Tunic +1",hands="Geo. Mitaines +3",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Austerity Belt +1",legs="Bagua Pants +3",feet="Bagua sandals +3"}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {back=GeoRegenCape,legs="Bagua Pants +3",feet="Azimuth Gaiters +2"})
		
    sets.midcast.Cure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Vanya Robe",hands="Vanya cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Tempered Cape +1",waist="Witful Belt",legs="Vanya slops",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
	head="Vanya hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
	body="Vanya Robe",hands="Vanya cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
	back="Tempered Cape +1",waist="Witful Belt",legs="Vanya slops",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
	head="Vanya hood",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Etiolation Earring",
	body="Vanya Robe",hands="Vanya cuffs",ring1="Janniston Ring",ring2="Menelaus's Ring",
	back="Tempered Cape +1",waist="Witful Belt",legs="Vanya slops",feet="Vanya Clogs"}

    sets.midcast.Curaga = set_combine(sets.midcast.Cure, {main="Daybreak",sub="Sors Shield"})

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
        head="Azimuth Hood +3",neck="Sibyl Scarf",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke and metamorph +1 augd
        back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  

    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
        head="Azimuth Hood +3",neck="Sibyl Scarf",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke and metamorph +1 augd
        back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  

		
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Loquac. Earring",
        body="Seidr Cotehardie",hands="Hagondes Cuffs +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Assid. Pants +1",feet="Regal Pumps +1"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
        head="Azimuth Hood +3",neck="Sibyl Scarf",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke and metamorph +1 augd
        back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  
		
    sets.midcast['Elemental Magic'].HighTierNuke = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
        head="Azimuth Hood +3",neck="Sibyl Scarf",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke and metamorph +1 augd
        back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  
		
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
        head="Azimuth Hood +3",neck="Sibyl Scarf",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke and metamorph +1 augd
        back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  

	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
        head="Azimuth Hood +3",neck="Sibyl Scarf",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke and metamorph +1 augd
        back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  

	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
        head="Ea hat +1",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
        body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke 
        back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  

	sets.ResistantMagicBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1", -- Ghastly +1 aug 
		head="Ea hat +1",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Friomisi Earring",
		body="Azimuth Coat +3",hands="Agwu's gages",ring1="Shiva Ring +1",ring2="Medada's Ring", -- freke 
		back=GeoNukeCape,waist="Eschan Stone",legs="Azimuth tights +3",feet="Agwu's pigaches"}  

		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Azimuth Hood +3",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Azimuth Coat +3",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Stikini Ring",
        back=GeoNukeCape,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Azimuth Coat +3",hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back=GeoNukeCape,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=GeoNukeCape,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=GeoNukeCape,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Dispel = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Azimuth gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=GeoNukeCape,waist="Acuity Belt +1",legs="Azimuth tights +3",feet=gear.merlinic_aspir_feet}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Null loop",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Azimuth Coat +3",hands="Azimuth gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back=GeoNukeCape,waist="Null belt",legs="Azimuth tights +3",feet="Bagua sandals +3"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Null loop",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Azimuth Coat +3",hands="Azimuth gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back=GeoNukeCape,waist="Null belt",legs="Azimuth tights +3",feet="Bagua sandals +3"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Malignance Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Gifted Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",legs="Assid. Pants +1",feet="Azimuth Gaiters +2"}

	-- Idle sets

	sets.idle = {main="Idris",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Murky Ring",
		back=GeoNukeCape,waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}
		
	sets.idle.PDT = {main="Idris",sub="Ammurapi Shield",ammo="Staunch Tathlum",
		head="Azimuth Hood +3",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
		body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Murky Ring",
		back=GeoNukeCape,waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Idris",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Azimuth Hood +3",neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Azimuth Coat +3",hands="Geo. Mitaines +3",ring1="Defending Ring",ring2="Murky Ring",
		back=GeoRegenCape,waist="Isa Belt",legs="Nyame flanchard",feet="Bagua sandals +3"}

	sets.idle.PDT.Pet = {main="Idris",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Azimuth Hood +3",neck="Loricate Torque +1",ear1="Handler's Earring",ear2="Handler's Earring +1",
		body="Azimuth Coat +3",hands="Geo. Mitaines +3",ring1="Defending Ring",ring2="Murky Ring",
		back=GeoRegenCape,waist="Isa Belt",legs="Nyame flanchard",feet="Bagua sandals +3"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Idris",sub="Ammurapi Shield",ammo="Staunch Tathlum",
	head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
	body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Murky Ring",
	back=GeoNukeCape,waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}

	-- Defense sets
	
	sets.defense.PDT = {main="Idris",sub="Ammurapi Shield",ammo="Staunch Tathlum",
	head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
	body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Murky Ring",
	back=GeoNukeCape,waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}

	sets.defense.MDT = {main="Idris",sub="Ammurapi Shield",ammo="Staunch Tathlum",
	head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
	body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Murky Ring",
	back=GeoNukeCape,waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}
		
    sets.defense.MEVA = {main="Idris",sub="Ammurapi Shield",ammo="Staunch Tathlum",
	head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
	body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Murky Ring",
	back=GeoNukeCape,waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geomancy Sandals +3"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Staunch Tathlum",
	head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
	body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
	back="Solemnity Cape",waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}
		
	sets.engaged.DW = {ammo="Staunch Tathlum",
	head="Volte beret",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Odnowa Earring +1",
	body="Azimuth Coat +3",hands="Nyame gauntlets",ring1="Defending ring",ring2="Stikini Ring",
	back="Solemnity Cape",waist="Carrier's Sash",legs="Nyame flanchard",feet="Azimuth Gaiters +2"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	
	
	sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.DualWeapons = {main='Nehushtan',sub='Nehushtan'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 10)
end

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'buffson' then
		send_command('geo;cpaddon cmd start')
	elseif commandArgs[1]:lower() == 'buffsoff' then
		send_command('thebubbler pause on;cpaddon cmd stop')
	end
end