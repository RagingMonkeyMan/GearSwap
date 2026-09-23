function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','CappedSpeed','Acc')
	state.HybridMode:options('Normal','DT', 'MEVA')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('DualNaegling', 'DualNaeglingAcc' ,'DualAeneas','DualAeolian','DualTauret','DualCarnwenhan','DualNaegling','DualNukeWeapons', 'DualPrime','Tauret','Naegling','Carnwenhan','Aeneas', 'Prime','None')
	-- Whether to use Carn under a certain threshhold even when weapons are locked.
	state.CarnMode = M{'Always','300','1000','Never'}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2

	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons DualAeolian;gs c update')
	send_command('bind ^q gs c weapons DualNaegling;gs c update')

	autofood = "Grape Daifuku"

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	WSLinos = { name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +2%','STR+6 DEX+6',}}
	TPLinos = { name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}}
	
	ChironicMABGloves = { name="Chironic Gloves", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','MND+6','"Mag.Atk.Bns."+12',}}
	ChironicMABBoots = { name="Chironic Slippers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Haste+1','INT+4','Mag. Acc.+13','"Mag.Atk.Bns."+15',}}
	
	IntarabusDA = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	IntarabusFC = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
    IntarabusWSD = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

	-- Weapons sets
	sets.weapons.Tauret = {main="Tauret",sub="Genmei Shield"}
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}
	sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.Carnwenhan = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.DualAeneas = {main="Aeneas",sub="Crepuscular Knife"}
	sets.weapons.DualCarnwenhan = {main="Carnwenhan",sub="Crepuscular Knife"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Fusetto +2"}
	sets.weapons.DualNaeglingAcc = {main="Naegling",sub="Crepuscular Knife"}
	sets.weapons.DualTauret = {main="Tauret",sub="Crepuscular Knife"}
	sets.weapons.DualNukeWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.DualAeolian = {main="Aeneas",sub="Tauret"}
	sets.weapons.DualPrime = {main="Mpu Gandring",sub="Crepuscular knife"}
	sets.weapons.Prime = {main="Mpu Gandring",sub="Genmei Shield"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {
		head="Bunzi's Hat",neck="Voltsurge Torque",ear1="Aoidos' earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back=IntarabusFC,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Fili Cothurnes +2"}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {right_ear="Mendi. Earring",feet="Vanya Clogs"})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	sets.precast.FC.BardSong = {
		main="Carnwenhan",
        head="Fili Calot +3",neck="Voltsurge Torque",ear1="Aoidos' Earring",ear2="Loquac. Earring",
        body="Inyanga jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring", ring2="Weatherspoon ring",  --hands Gendewitha Gages +1
        back=IntarabusFC,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Fili Cothurnes +2"}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas",waist="Luminary Sash"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Daurdabla"})
	sets.precast.FC.Lullaby = {range="Marsyas"}
	sets.precast.FC.Lullaby.Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'] = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Daurdabla"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Aria of Passion'] = set_combine(sets.precast.FC.BardSong,{range="Loughnashade"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +3"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		range=WSLinos,
		head="Nyame Helm",
		body="Bihu Justaucorps +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Grunfeld rope",
		left_ear="Odr earring",
		right_ear="Moonshade earring",
		left_ring="Ilabrat Ring",
		right_ring="Cornelia's Ring",
		back=IntarabusWSD
	}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS["Mordant Rime"] = {
		range=WSLinos,
		ammo=empty,
		head={ name="Lustratio Cap +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		body="Ayanmo Corazza +2",
		hands={ name="Lustr. Mittens +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		legs={ name="Lustr. Subligar +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		feet={ name="Lustra. Leggings +1", augments={'Accuracy+20','DEX+8','Crit. hit rate+3%',}},
		neck="Bard's Charm +2",
		waist="Grunfeld Rope",
		left_ear="Moonshade Earring",
		right_ear="Ishvara Earring",
		left_ring="Petrov Ring",
		right_ring="Cornelia's Ring",
		back=IntarabusWSD,
}
		
	sets.precast.WS["Rudra's Storm"] = {
		range=WSLinos,
		head="Nyame Helm",
		body="Bihu Justaucorps +3",
		hands="Nyame Gauntlets",
		legs="Lustratio Subligar +1",
		feet="Lustratio Leggings +1",
		neck="Bard's Charm +2",
		waist="Grunfeld rope",
		left_ear="Odr earring",
		right_ear="Moonshade earring",
		left_ring="Ilabrat Ring",
		right_ring="Cornelia's Ring",
		back=IntarabusWSD
	}
	
	sets.precast.WS["Evisceration"] = {
		range=WSLinos,
		head="Ayanmo Zucchetto +2",
		body="Bihu Justaucorps +3",
		hands="Ayanmo Manopolas +2",
		legs="Ayanmo Cosciales +2",
		feet="Ayanmo Gambieras +2",
		neck="Bard's Charm +2",
		waist="Grunfeld rope",
		left_ear="Odr earring",
		right_ear="Moonshade earring",
		left_ring="Ilabrat Ring",
		right_ring="Apate Ring",
		back=IntarabusWSD
	}
	
	sets.precast.WS["Aeolian Edge"] = {
		range=WSLinos,
		head="Nyame Helm",
		body="Nyame mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Regal Earring",
		right_ear="Moonshade Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back=IntarabusWSD
	}
	
	sets.precast.WS["Savage Blade"] = {
		range=WSLinos,
		head="Nyame Helm",
		body="Bihu Justaucorps +3",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Sailfi belt +1",
		left_ear="Regal earring",
		right_ear="Moonshade earring",
		left_ring="Karieyh Ring",
		right_ring="Cornelia's Ring",
		back=IntarabusWSD
	}
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=IntarabusFC,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Gende. Galosh. +1"}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Fili Rhingrave +2"}
	sets.midcast.Lullaby = {range="Marsyas",hands="Brioso Cuffs +3"}
	sets.midcast.Lullaby.Resistant = {range="Marsyas",hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby'] = {range="Marsyas", hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Daurdabla",hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby'].AoE = {range="Daurdabla",hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas",hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Daurdabla",hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Daurdabla",hands="Brioso Cuffs +3"}
	sets.midcast.Madrigal = {head="Fili Calot +3"}
	sets.midcast.Paeon = {head="Brioso Roundlet +3"}
	sets.midcast.March = {hands="Fili Manchettes +2"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast['Aria of Passion'] = {range="Loughnashade"}
	sets.midcast.Minuet = {body="Fili Hongreline +3"}
	sets.midcast.Minne = {legs="Mousai Seraweels"}
	sets.midcast.Carol = {hands="Mousai Gages +1"}
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +2"}
	sets.midcast['Magic Finale'] = {legs="Fili Rhingrave +2"}
	sets.midcast.Mazurka = {range="Marsyas"}
	sets.midcast.Threnody = {range="Gjallarhorn", body="Mousai Manteel +1"}

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Carnwenhan",range="Gjallarhorn",ammo=empty,
		head="Fili Calot +3",neck="Mnbw. Whistle +1",ear1="Regal earring",ear2="Loquac. Earring",
		body="Fili Hongreline +3",hands="Inyan. Dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
		back=IntarabusFC,waist="",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}
		
	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Carnwenhan",sub="Ammurapi Shield",range="Marsyas",ammo=empty,
		head="Brioso Roundlet +3",neck="Moonbow whistle +1",ear1="Regal earring",ear2="Dignitary's Earring",
        body="Fili Hongreline +3",hands="Inyanga dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=IntarabusFC,waist="Luminary sash",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}

	sets.midcast.Requiem = {range="Marsyas",ammo=empty,
		head="Brioso Roundlet +3",neck="Moonbow whistle +1",ear1="Regal earring",ear2="Dignitary's Earring",
        body="Fili Hongreline +3",hands="Inyanga dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=IntarabusFC,waist="Luminary sash",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Carnwenhan",sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Brioso Roundlet +3",neck="Moonbow whistle +1",ear1="Regal earring",ear2="Dignitary's Earring",
        body="Brioso justaucorps +3",hands="Inyanga dastanas +2",ring1="Stikini Ring",ring2="Stikini Ring",
        back=IntarabusFC,waist="Luminary sash",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main="Carnwenhan",sub="Ammurapi Shield",range="Daurdabla",ammo=empty,
		head="Nahtirah Hat",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=IntarabusFC,waist="Witful Belt",legs="Fili Rhingrave +2",feet="Aya. Gambieras +2"}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})
	
	-- DUMMY SONGS HERE
	sets.midcast["Army's Paeon II"] = sets.midcast.DaurdablaDummy
	sets.midcast["Army's Paeon"] = sets.midcast.DaurdablaDummy
	sets.midcast["Knight's Minne II"] = sets.midcast.DaurdablaDummy
	sets.midcast["Knight's Minne"] = sets.midcast.DaurdablaDummy
	sets.midcast["Herb Pastoral"] = sets.midcast.DaurdablaDummy
	sets.midcast["Goblin Gavotte"] = sets.midcast.DaurdablaDummy
	sets.midcast["Gold Capriccio"] = sets.midcast.DaurdablaDummy
	
	-- Other general spells and classes.
	sets.midcast.Cure = {main="Daybreak",
		head="Vanya hood",neck="Colossus's Torque",ear1="Mendicant's Earring",ear2="Regal earring",
		body="Bunzi's robe",hands="Vanya cuffs",ring1="Ephedra Ring",ring2="Sirona's Ring",
		back="Solemnity cape",waist="Witful Belt",legs="Vanya slops",feet="Vanya clogs"}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=IntarabusFC,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Ephedra Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Daybreak",sub="Genmei Shield",ranged="Marsyas",
		head="Inyanga tiara +2",neck="Loricate Torque +1",ear1="Regal earring",ear2="Dignitary's Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Ayanmo Ring",
		back=IntarabusFC,waist="Flume Belt +1",legs="Inyanga Shalwar +2",feet="Inyanga Crackows +2"}
	
	sets.idle = {
		ranged="Marsyas",
		head="Nyame Helm",
		body="Nyame mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Flume Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusFC
	}
		
	sets.idle.NoRefresh = {main="Daybreak",sub="Genmei Shield",ranged="Marsyas",
		head="Nyame Helm",
		body="Nyame mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Flume Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusFC
	}

	sets.idle.DT = {
		ranged="Marsyas",
		head="Nyame Helm",
		body="Nyame mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Flume Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusFC
	}
	
	-- Defense sets

	sets.defense.PDT = {
		head="Nyame Helm",
		body="Nyame mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Flume Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusFC
	}

	sets.defense.MDT = {
		head="Nyame Helm",
		body="Nyame mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Bard's Charm +2",
		waist="Flume Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusFC
	}

	sets.Kiting = {feet="Fili Cothurnes +2"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back=IntarabusDA
	}
	sets.engaged.DT = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Loricate torque +1",
		waist="Sailfi Belt +1",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusDA
	}
	
	sets.engaged.MEVA = {
		range=TPLinos,
		head="Nyame helm",
		body="Nyame Mail",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Loricate torque +1",
		waist="Sailfi Belt +1",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Defending Ring",
		right_ring="Petrov Ring",
		back=IntarabusDA
	}
	
	sets.engaged.Acc = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back=IntarabusDA
	}
	sets.engaged.DW = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back=IntarabusDA
	}

	sets.engaged.DW.DT = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Telos Earring",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusDA
	}

	sets.engaged.DW.CappedSpeed = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back=IntarabusDA
	}

	sets.engaged.DW.CappedSpeed.DT = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Sailfi Belt +1",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back=IntarabusDA
	}
	
	sets.engaged.DW.Acc = {
		range=TPLinos,
		head="Aya. Zucchetto +2",
		body="Ashera Harness",
		hands="Bunzi's Gloves",
		legs="Volte Tights",
		feet="Volte Spats",
		neck="Bard's Charm +2",
		waist="Reiki Yotai",
		left_ear="Eabani Earring",
		right_ear="Telos Earring",
		left_ring="Ilabrat Ring",
		right_ring="Petrov Ring",
		back=IntarabusDA
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 2)
	
	--send_command('wait 10;gs c set unlockweapons on')
end

-- function job_precast(spell, spellMap, eventArgs)
-- 	if spell.action_type == 'Magic' then
-- 		send_command('gs c set unlockweapons on')
-- 		if not sets.precast.FC[spell.english] and (spell.type == 'BardSong' and spell.targets.Enemy) then
-- 			classes.CustomClass = 'SongDebuff'
-- 		end
-- 	end
-- end

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'dd' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Victory March" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Blade Madrigal" <me>; wait 4.5; input /ma "Valor Minuet V" <me>')
                add_to_chat(158,'March x2, Madrigal, Minuet')
	elseif commandArgs[1]:lower() == 'ddslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Victory March" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Blade Madrigal" <me>; wait 6; input /ma "Valor Minuet V" <me>')
                add_to_chat(158,'March x2, Madrigal, Minuet SLOW')
	elseif commandArgs[1]:lower() == 'ddacc' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Victory March" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Blade Madrigal" <me>; wait 4.5; input /ma "Sword Madrigal" <me>')
                add_to_chat(158,'March x2, Madrigal x2')
	elseif commandArgs[1]:lower() == 'ddaccslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Victory March" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Blade Madrigal" <me>; wait 6; input /ma "Sword Madrigal" <me>')
                add_to_chat(158,'March x2, Madrigal x2 SLOW')
	elseif commandArgs[1]:lower() == 'ddatt' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Victory March" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Valor Minuet V" <me>; wait 4.5; input /ma "Valor Minuet IV" <me>')
                add_to_chat(158,'March x2  Minuet x2')
	elseif commandArgs[1]:lower() == 'ddattslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Victory March" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Valor Minuet V" <me>; wait 6; input /ma "Valor Minuet IV" <me>')
                add_to_chat(158,'March x2, Minuet x2 SLOW')
	elseif commandArgs[1]:lower() == 'wave3' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Adventurer\'s Dirge" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Blade Madrigal" <me>; wait 4.5; input /ma "Valor Minuet V" <me>')
                add_to_chat(158,'March, Dirge, Madrigal, Minuet')
	elseif commandArgs[1]:lower() == 'wave3slow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Adventurer\'s Dirge" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Blade Madrigal" <me>; wait 6; input /ma "Valor Minuet V" <me>')
                add_to_chat(158,'March, Dirge, Madrigal, Minuet SLOW')
	elseif commandArgs[1]:lower() == 'wave3acc' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Adventurer\'s Dirge" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Blade Madrigal" <me>; wait 4.5; input /ma "Sword Madrigal" <me>')
                add_to_chat(158,'March, Dirge, Madrigal x2')
	elseif commandArgs[1]:lower() == 'wave3accslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Adventurer\'s Dirge" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Blade Madrigal" <me>; wait 6; input /ma "Sword Madrigal" <me>')
                add_to_chat(158,'March, Dirge, Madrigal x2 SLOW')
	elseif commandArgs[1]:lower() == 'wave3haste' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Adventurer\'s Dirge" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Blade Madrigal" <me>; wait 4.5; input /ma "Victory March" <me>')
                add_to_chat(158,'March x2, Dirge, Madrigal')
	elseif commandArgs[1]:lower() == 'wave3hasteslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Adventurer\'s Dirge" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Blade Madrigal" <me>; wait 6; input /ma "Victory March" <me>')
                add_to_chat(158,'March x2, Dirge, Madrigal SLOW')
	elseif commandArgs[1]:lower() == 'rngatt' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Valor Minuet V" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Valor Minuet IV" <me>; wait 4.5; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'March, Minuet x2, Prelude')
	elseif commandArgs[1]:lower() == 'rngattslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Valor Minuet V" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Valor Minuet IV" <me>; wait 6; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'March, Minuet x2, Prelude SLOW')
	elseif commandArgs[1]:lower() == 'rngacc' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Valor Minuet V" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Hunter\'s Prelude" <me>; wait 4.5; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'March, Minuet, Prelude x2')
	elseif commandArgs[1]:lower() == 'rngaccslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Valor Minuet V" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Hunter\'s Prelude" <me>; wait 6; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'March, Minuet, Prelude x2 SLOW')
	elseif commandArgs[1]:lower() == 'rngdirge' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Valor Minuet V" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Adventurer\'s Dirge" <me>; wait 4.5; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'March, Minuet, Dirge, Prelude')
	elseif commandArgs[1]:lower() == 'rngdirgeslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Valor Minuet V" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Adventurer\'s Dirge" <me>; wait 6; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'March, Minuet, Dirge, Prelude SLOW')
	elseif commandArgs[1]:lower() == 'rngmag' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Swift Etude" <me>; wait 4.5; input /ma "Quick Etude" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Hunter\'s Prelude" <me>; wait 4.5; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'AGI x2, Prelude x2')
	elseif commandArgs[1]:lower() == 'rngmagslow' then
		send_command('input /ma "Swift Etude" <me>; wait 6; input /ma "Quick Etude" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Hunter\'s Prelude" <me>; wait 6; input /ma "Archer\'s Prelude" <me>')
                add_to_chat(158,'AGI x2, Prelude x2 SLOW')
	elseif commandArgs[1]:lower() == 'bal3' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Mage\'s Ballad III" <me>; wait 4.5; input /ma "Mage\'s Ballad II" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Mage\'s Ballad" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Victory March" <me>')
                add_to_chat(158,'Ballad x3 March')
	elseif commandArgs[1]:lower() == 'bal3slow' then
		send_command('input /ma "Mage\'s Ballad III" <me>; wait 6; input /ma "Mage\'s Ballad II" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Mage\'s Ballad" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Victory March" <me>')
                add_to_chat(158,'Ballad x3 March SLOW')
	elseif commandArgs[1]:lower() == 'wave2jeuno' then
		send_command('input /ja "Soul Voice" <me>; wait 1; input /ja "Clarion Call" <me>; wait 1; input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ma "Honor March" <me>; wait 4.5; input /ma "Archer\'s Prelude" <me>; wait 4.5; input /ma "Hunter\'s Prelude" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Valor Minuet V" <me>; wait 4.5; input /ma "Adventurer\'s Dirge" <me>; wait 4.5; input /ja "Pianissimo" <me>; wait 1; input /ma "Blade Madrigal" Kitcho; wait 4.5; input /ja "Pianissimo" <me>; wait 1; input /ma "Sword Madrigal" Kitcho; wait 4.5; input /ja "Pianissimo" <me>; wait 1; input /ma "Mage\'s Ballad III" Dmitrius; wait 4.5; input /ja "Pianissimo" <me>; wait 1; input /ma "Mage\'s Ballad II" Dmitrius')
                add_to_chat(158,'JEUNO W2 LETS GOOOOOOO!')
	elseif commandArgs[1]:lower() == 'wave2jeunoslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Archer\'s Prelude" <me>; wait 6; input /ma "Hunter\'s Prelude" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Valor Minuet V" <me>; wait 6; input /ma "Adventurer\'s Dirge" <me>; wait 6; input /ja "Pianissimo" <me>; wait 1; input /ma "Blade Madrigal" Kitcho; wait 6; input /ja "Pianissimo" <me>; wait 1; input /ma "Sword Madrigal" Kitcho; wait 6; input /ja "Pianissimo" <me>; wait 1; input /ma "Mage\'s Ballad III" Dmitrius; wait 6; input /ja "Pianissimo" <me>; wait 1; input /ma "Mage\'s Ballad III" Dmitrius')
                add_to_chat(158,'JEUNO W2 SLOOOOOOOW!')
	elseif commandArgs[1]:lower() == 'erinys' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Wind Carol" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Blade Madrigal" <me>; wait 4.5; input /ma "Sword Madrigal" <me>')
                add_to_chat(158,'March, Madrigal x2, Wind Carol')
	elseif commandArgs[1]:lower() == 'erinysslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Wind Carol" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Blade Madrigal" <me>; wait 6; input /ma "Sword Madrigal" <me>')
                add_to_chat(158,'March, Madrigal x2, Wind Carol SLOW')
	elseif commandArgs[1]:lower() == 'shiva' then
		send_command('input /ja "Nightingale" <me>; wait 1; input /ja "Troubadour" <me>; wait 1; input /ja "Marcato" <me>; wait 2; input /ma "Honor March" <me>; wait 4.5; input /ma "Victory March" <me>; wait 4.5; input /ma "Knight\'s Minne" <me>; wait 4.5; input /ma "Knight\'s Minne II" <me>; wait 4.5; input /ma "Ice Carol" <me>; wait 4.5; input /ma "Ice Carol II" <me>')
                add_to_chat(158,'March x2  Ice Carol x2')
	elseif commandArgs[1]:lower() == 'shivaslow' then
		send_command('input /ma "Honor March" <me>; wait 6; input /ma "Victory March" <me>; wait 6; input /ma "Knight\'s Minne" <me>; wait 6; input /ma "Knight\'s Minne II" <me>; wait 6; input /ma "Ice Carol" <me>; wait 6; input /ma "Ice Carol II" <me>')
                add_to_chat(158,'March x2  Ice Carol x2 SLOW')
	elseif commandArgs[1]:lower() == 'fast' then
		send_command('input /ma "Chocobo Mazurka" <me>;sing off')
                add_to_chat(158,'MAXIMUM SPEED')
	elseif commandArgs[1]:lower() == 'aeolian' then
		enable('main','sub','range','ammo')
		send_command('gs c weapons DualAeolian;gs c update;aws aeolian edge;aws tp 1000')
		add_to_chat(158,'Aeolian weapon set equiped')
		disable('main','sub','range','ammo')
	elseif commandArgs[1]:lower() == 'ddweapons' then
		enable('main','sub','range','ammo')
		send_command('gs c weapons DualNaegling;gs c update;aws savage blade;aws tp 1000')
		add_to_chat(158,'Savage blade weapon set equiped')
		disable('main','sub','range','ammo')
	elseif commandArgs[1]:lower() == 'ddweaponsacc' then
		enable('main','sub','range','ammo')
		send_command('gs c weapons DualNaeglingAcc;gs c update;aws savage blade;aws tp 1500')
		add_to_chat(158,'Savage blade weapon set equiped')
		disable('main','sub','range','ammo')
	elseif commandArgs[1]:lower() == 'magicweapons' then
        enable('main','sub','range','ammo')
		send_command('gs c weapons DualAeneas;gs c update;aws rudra\'s storm;aws tp 1000')
		add_to_chat(158,'Rudra\'s Storm weapon set equiped')
		disable('main','sub','range','ammo')
	elseif commandArgs[1]:lower() == 'slash' then
		enable('main','sub','range','ammo')
		send_command('gs c weapons DualNaegling;gs c update;aws savage blade;aws tp 1000')
		add_to_chat(158,'Savage blade weapon set equiped')
		disable('main','sub','range','ammo')
	elseif commandArgs[1]:lower() == 'pierce' then
		enable('main','sub','range','ammo')
		send_command('gs c weapons DualAeneas;gs c update;aws rudra\'s storm;aws tp 1000')
		add_to_chat(158,'Rudra\'s Storm weapon set equiped')
		disable('main','sub','range','ammo')
	elseif commandArgs[1]:lower() == 'buffson' then
		send_command('sing on;cpaddon cmd start')
	elseif commandArgs[1]:lower() == 'buffsoff' then
		send_command('sing off;cpaddon cmd stop')
	end
end