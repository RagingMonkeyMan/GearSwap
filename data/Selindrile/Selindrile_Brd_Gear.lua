function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Terpander'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.Weapons = {main="Aeneas",sub="Kali"}
	sets.Swords = {main="Vampirism",sub="Vampirism"}
	sets.NukeWeapons = {main="Malevolence",sub="Malevolence"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Gende. Galosh. +1"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.BardSong = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Linos",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Telchine Pigaches"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong, {range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {} --feet="Bihu Slippers +1"
	sets.precast.JA.Troubadour = {} --body="Bihu Jstcorps +1"
	sets.precast.JA['Soul Voice'] = {} --legs="Bihu Cannions +1"

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Aya. Zucchetto +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Ilabrat Ring",ring2="Ramuh Ring +1",
		back="Ground. Mantle +1",waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Intarabus's Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet="Gende. Galosh. +1"}

	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = {}
	sets.midcast.Lullaby = {}
	sets.midcast.Madrigal = {}
	sets.midcast.Paeon = {}
	sets.midcast.March = {}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March, {range="Marsyas"})
	sets.midcast.Minuet = {}
	sets.midcast.Minne = {}
	sets.midcast.Carol = {}
	sets.midcast["Sentinel's Scherzo"] = {}
	sets.midcast['Magic Finale'] = {}

	sets.midcast.Mazurka = {range="Marsyas"}
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Kali",sub="Genmei Shield",range="Linos",
		head="Aoidos' Calot +2",neck="Aoidos' Matinee",ear2="Loquacious Earring",
		body="Aoidos' Hongreline +2",hands="Aoidos' Manchettes +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Mdk. Shalwar +1",feet="Brioso Slippers +1"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Legato Dagger",sub="Genmei Shield",range="Linos",
		head="Bihu Roundlet +1",neck="Aoidos' Matinee",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Bihu Jstcorps +1",hands="Bihu Cuffs +1",ring1="Carb. Ring +1",ring2="Mephitas's Ring +1",
		back="Rhapsode's Cape",waist="Aristo Belt",legs="Bihu Cannions +1",feet="Brioso Slippers +1"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = {main=gear.maccstaff,sub="Clerisy Strap +1",range="Linos",
		head="Bihu Roundlet +1",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Digni. Earring",
		body="Bihu Jstcorps +1",hands="Bihu Cuffs +1",ring1="Carb. Ring +1",ring2="Mephitas's Ring +1",
		back="Rhapsode's Cape",waist="Aristo Belt",legs="Bihu Cannions +1",feet="Brioso Slippers +1"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=gear.maccstaff,sub="Clerisy Strap +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear2="Loquac. Earring",
		body="Bihu Jstcorps +1",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Harmony Cape",waist="Corvax Sash",legs="Aoidos' Rhingrave +2",feet="Bihu Slippers +1"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Arka IV",sub='Achaq Grip',
		head="Gendewitha Caubeen +1",neck="Erra Pendant",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Gende. Bilaut +1",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Haoma's Ring",
		back="Tempered Cape +1",waist=gear.ElementalObi,legs="Gyve Trousers",feet="Gende. Galosh. +1"}
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Marin Staff +1",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Vanir Cotehardie",hands="Helios Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Artsieq Hose",feet="Helios Boots"}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff +1",sub="Clerisy Strap +1",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Vanir Cotehardie",hands="Helios Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Artsieq Hose",feet="Helios Boots"}
		
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Fodder
		
	sets.midcast.Cursna = {
		neck="Debilis Medallion",
		ring1="Haoma's Ring",ring2="Haoma's Ring",
		feet="Gende. Galosh. +1"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Marin Staff +1",sub="Clemency Grip"})

	
	-- Sets to return to when not performing an action.
	
	sets.Capacity = {back="Mecisto. Mantle"}
	sets.Warp = {ring2="Warp Ring"}
	sets.RREar = {ear2="Reraise Earring"}
	
	-- Resting sets
	sets.resting = {legs="Assid. Pants +1",feet="Chelona Boots +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Jupiter's Pearl",ear2="Kuwunga Earring"}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Steelflash Earring"}	
	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Terra's Staff", sub="Achaq Grip",range="Gjallarhorn",
		head=empty,neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Woltaris Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assiduity Pants",feet="Bihu Slippers +1"}

	sets.idle.Weak = {main="Terra's Staff", sub="Oneiros Grip",range="Gjallarhorn",
		head=empty,neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Assiduity Pants",feet="Bihu Slippers +1"}
	
	sets.idle.PDT = {main="Terra's Staff", sub="Oneiros Grip",range="Gjallarhorn",
		head="Bihu Roundlet +1",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Gende. Bilaut +1",hands="Bihu Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Bihu Cannions +1",feet="Bihu Slippers +1"}
	
	-- Defense sets

	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",range="Gjallarhorn",
		head="Bihu Roundlet +1",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bihu Jstcorps +1",hands="Bihu Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Bihu Cannions +1",feet="Bihu Slippers +1"}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",range="Gjallarhorn",
		head="Bihu Roundlet +1",neck="Loricate Torque +1",ear1="Moonshade Earring",ear2="Ethereal Earring",
		body="Bihu Jstcorps +1",hands="Bihu Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Bihu Cannions +1",feet="Bihu Slippers +1"}

	sets.Kiting = {feet="Aoidos' Cothurnes +2"}

	-- Gear for specific elemental nukes.
	sets.WindNuke = {main="Marin Staff +1"}
	sets.IceNuke = {main="Ngqoqwanb"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {ammo="Ginsen",
		head="Brioso Roundlet +1",neck="Asperity Necklace",ear1="Brutal Earring",ear2="Telos Earring",
		body="Bihu Jstcorps +1",hands="Brioso Cuffs +1",ring1="Petrov Ring",ring2="Patricius Ring",
		back="Atheling Mantle",waist="Ninurta's Sash",legs="Bihu Cannions +1",feet="Gende. Galosh. +1"}

	sets.engaged.DW = {ammo="Ginsen",
		head="Brioso Roundlet +1",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Telos Earring",
		body="Bihu Jstcorps +1",hands="Brioso Cuffs +1",ring1="Petrov Ring",ring2="Patricius Ring",
		back="Atheling Mantle",waist="Ninurta's Sash",legs="Bihu Cannions +1",feet="Gende. Galosh. +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(10, 10)
end