-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None','Normal')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Terpander'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind f11 gs c cycle ExtraSongsMode')

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

	-- Extra Melee sets.  Apply these on top of melee sets.
	sets.Weapons = {main="Kali"}

	-- Buff sets.
	
    -- Precast sets to enhance JAs	
	sets.precast.JA.Nightingale = {}
	sets.precast.JA.Troubadour = {}
	sets.precast.JA['Soul Voice'] = {}	
	sets.precast.Waltz = {}
	sets.precast.Waltz['Healing Waltz'] = {}
	
	-- Fast cast sets for spells
	sets.precast.FC = {main="Kali",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Channeler's Stone",legs="Aya. Cosciales +2",feet="Telchine Pigaches"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear1="Mendi. Earring",feet="Vanya Clogs"})
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.BardSong = {main="Kali",sub="Ammurapi Shield",range="Linos",ammo=empty,
		head="Fili Calot +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Channeler's Stone",legs="Aya. Cosciales +2",feet="Telchine Pigaches"}

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})

    -- Default set for any weapon skill that isn't any more specifically defined
	sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ilabrat Ring",ring2="Rajas Ring",
		back="Rhapsode's Cape",waist="Eschan Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

	-- Specific weapon skill sets.  Uses the base set if an appropriate WSMod version isn't found.		
    sets.precast.WS['Evisceration'] = sets.precast.WS
	
    -- Midcast Sets
	sets.midcast.FastRecast = sets.precast.FC	
	sets.midcast.Ballad = {legs="Fili Rhingrave +1"}
	sets.midcast.Lullaby = {}
	sets.midcast.Madrigal = {head="Fili Calot +1"}
	sets.midcast.Paeon = {}
	sets.midcast.March = {}
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = {range="Terpander"}
	
	sets.midcast.SongEffect = {main="Kali",sub="Genmei Shield",range="Linos",ammo=empty,
		head="Fili Calot +1",neck="Mnbw. Whistle +1",ear1="Enchantr. Earring +1",ear2="Darkside Earring",
		body="Fili Hongreline +1",hands="Inyan. Dastanas +2",ring1="Stikini Ring +1",ring2="Stikini Ring",
		back="Rhapsode's Cape",waist="Kobo Obi",legs="Inyanga Shalwar +2",feet="Brioso Slippers +1"}

	sets.midcast.SongDebuff = {main="Kali",sub="Genmei Shield",range="Linos",
		head="Fili Calot +1",neck="Mnbw. Whistle +1",ear1="Enchantr. Earring +1",ear2="Darkside Earring",
		body="Brioso Just. +1",hands="Inyan. Dastanas +2",ring1="Stikini Ring +1",ring2="Stikini Ring",
		back="Rhapsode's Cape",waist="Luminary Sash",legs="Fili Rhingrave +1",feet="Brioso Slippers +1"}

	sets.midcast.ResistantSongDebuff = sets.midcast.SongDebuff
	sets.midcast.SongRecast = sets.midcast.SongDebuff

    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	sets.midcast.Cure = {main="Chatoyant Staff",sub='Enki Strap',
	    head="Telchine Cap",neck="Nodens Gorget",ear1="Mendi. Earring",ear2="Etiolation Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Hachirin-no-Obi",legs="Telchine Braconi",feet="Telchine Pigaches"}

	sets.midcast['Enhancing Magic'] = {sub="Ammurapi Shield",
		head="Telchine Cap",neck="Nodens Gorget",ear1="Enchntr. Earring +1",ear2="Etiolation Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Siegal Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Resistant = {}
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']
	sets.midcast.Cursna = {}
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})

    -- Idle sets
	sets.resting = {}
	sets.idle = {main="Kali",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Inyanga Tiara +2",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Infused Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring +1",ring2="Woltaris Ring",
		back="Rhapsode's Cape",waist="Fucho-no-Obi",legs="Assid. Pants +1",feet="Fili Cothurnes +1"}

	sets.DayIdle = {}
	sets.NightIdle = {}
	
    -- Defense sets
	sets.defense.PDT = set_combine(sets.idle, {ring1="Defending Ring"})
	sets.defense.MDT = sets.defense.PDT
    sets.defense.MEVA = sets.defense.PDT

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}	
	
	-- Engaged sets
	sets.engaged = {ammo="Ginsen",
        head="Aya. Zucchetto +2",neck="Sanctity Necklace",ear1="Cessance Earring",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rajas Ring",Ring2="Ilabrat Ring",
        back="Rhapsode's Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

    sets.engaged.Acc = sets.engaged
    sets.engaged.PDT = sets.engaged
    sets.engaged.Acc.PDT = sets.engaged
	sets.engaged.MDT = sets.engaged
	sets.engaged.Acc.MDT = sets.engaged
	sets.engaged.MEVA = sets.engaged
	sets.engaged.Acc.MEVA = sets.engaged
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end