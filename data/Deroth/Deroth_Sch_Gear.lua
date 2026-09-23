-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Fodder','Proc','OccultAcumen')
    state.IdleMode:options('Normal','PDT')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('Bunzi','Akademos','Khatvanga','Musa','None')
	state.RegenMode = M{['description'] = 'Regen Mode','Hybrid','Duration','Potency', 'No Staff'}

	AMBUNUKE = { name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	
	FEETMB = {name="Merlinic Crackows", augments={'Mag. Acc.+23','"Fast Cast"+6','INT+2','"Mag.Atk.Bns."+11',}}
	TelEnhHead = {name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}}
	TelenhBody = {name="Telchine Chasuble", augments={'Enh. Mag. eff. dur. +10',}}
	TelEnhLegs = {name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}}
	TelEnhFeet = {name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}}
	TelRegPotBody = {name="Telchine Chasuble", augments={'"Regen" potency+3',}}
	TelRegPotHands = {name="Telchine Gloves", augments={'"Regen" potency+1',}}
	TelRegPotLegs = {name="Telchine Braconi", augments={'"Regen" potency+3',}}
	TelRegPotFeet = {name="Telchine Pigaches", augments={'"Regen" potency+2',}}
	
	
	SR1 = {name="Stikini Ring", bag="wardrobe"}
	SR2 = {name="Stikini Ring", bag="wardrobe2"}
	
	gear.obi_cure_back = "Twilight Cape"
	gear.obi_cure_waist = "Hachirin-no-Obi"

	gear.obi_low_nuke_waist = "Hachirin-no-Obi"
	gear.obi_high_nuke_waist = "Hachirin-no-Obi"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind !b gs c cycle MagicBurstMode')
	send_command('bind !x gs c set CastingMode Proc;gs c set Weapons None')
	send_command('bind !c gs c set CastingMode Normal;gs c set Weapons Bunzi')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	send_command('bind !R gs c cycle RegenMode')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"} -- +3
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"} 

    -- Fast cast sets for spells

    sets.precast.FC = { -- 76% FC
		main="Musa", -- 10
		ammo="Sapience orb", -- 2 
        head="Vanya hood", -- 10
		neck="Unmoving collar +1", -- HP swap to keep from dropping yellow 
		ear1="Malignance Earring", -- 4
		ear2="Loquac. Earring", -- 2
        body="Pinga Tunic", -- 13
		hands="Agwu's gages", -- 6
		ring1="Kishar Ring", -- 4
		ring2="Weather. Ring", -- 5
        back="Fi Follet Cape +1", -- 10
		waist="Embla Sash", -- 5
		legs="Pinga Pants", -- 11
		feet="Peda. Loafers +3"} --8
		
	sets.precast.FC.Arts = set_combine(sets.precast.FC, {head="Peda. M.board +3",feet="Acad. Loafers +3"})

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {}) 

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {}) 

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = {
		main="Musa", -- 10
		ammo="Sapience orb", -- 2 
		head=empty,
		neck="Voltsurge torque", -- HP swap to keep from dropping yellow 
		ear1="Malignance Earring", -- 4
		ear2="Loquac. Earring", -- 2
		body="Crepuscular Cloak",
		hands="Agwu's gages", -- 6
		ring1="Kishar Ring", -- 4
		ring2="Weather. Ring", -- 5
		back="Fi Follet Cape +1", -- 10
		waist="Embla Sash", -- 5
		legs="Pinga Pants", -- 11
		feet="Peda. Loafers +3"} --8
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})

    -- Precase WS sets
    -- SET NEEDS: Ambu Cape (MP) & Shinjutsu
    sets.precast.WS['Myrkr'] = {
		ammo="Psilomene",
		head="Pixie Hairpin +1",
		neck="Dualism Collar +1",
		ear1="Evans Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet +1",
		hands="Regal Cuffs",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Vates Cape +1", -- Ambu Cape with Max MP
		waist="Luminary Sash", -- Shinjutsu
		legs="Amalric Slops +1",
		feet="Arbatel Loafers +3"}

		sets.precast.WS['Cataclysm'] = {
			ammo="Ghastly Tathlum +1",
			head="Pixie Hairpin +1",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Sibyl Scarf",
			waist="Orpheus's Sash",
			left_ear="Moonshade Earring",
			right_ear="Regal earring",
			left_ring="Epaminondas's Ring",
			right_ring="Archon ring",
			back=AMBUNUKE
		}

    -- Midcast Sets

	sets.TreasureHunter = {ammo="Per. Lucky Egg", waist="Chaac Belt", head = "Wh. Rarab Cap +1"} -- +3 need +1 more
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"} -- NEED
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"} -- DONE

    sets.midcast.FastRecast = {
		main="Musa", -- 10
		ammo="Sapience orb", --2
		head="Vanya hood", -- 10
		neck="Unmoving collar +1", -- HP swap to keep from dropping yellow 
		ear1="Loquac. Earring", -- 2
		ear2="Malignance Earring", -- 4
		body="Pinga Tunic", -- 13
		hands="Leyline gloves", -- 8
		ring1="Kishar Ring", -- 4
		ring2="Weather. Ring", -- 5
		back="Fi Follet Cape +1", -- 10
		waist="Embla Sash", -- 5
		legs="Pinga Pants", -- 11
		feet="Peda. Loafers +3"} --6
		
    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",ammo="Pemphredo Tathlum", -- Esper Stone +1
		head="Vanya hood",neck="Incanter's Torque",ear1="Mendicant's Earring",ear2="Malignance Earring",
        body="Vanya robe",hands="Vanya cuffs",ring1="Gelatinous Ring +1",ring2="Lebeche Ring", 
        back="Fi Follet Cape +1",waist="Austerity belt +1",legs="Vanya slops",feet="Vanya clogs"}
		
    sets.midcast.LightWeatherCure = set_combine(sets.midcast.Cure, {main="Chatoyant Staff",sub="Enki Strap", back="Twilight Cape", waist="Hachirin-no-Obi"})
		
    sets.midcast.LightDayCure = set_combine(sets.midcast.LightWeatherCure, {})
		
    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {
		main="Gada",
		head="Vanya Hood",
		neck="Malison Medallion", -- "Debilis Medallion"
		ear1="Meili Earring",
		ear2="Beatific Earring",
		body="Peda. Gown +3",
		hands="Hieros Mittens",
		ring1="Ephedra Ring", --"Haoma's Ring",
		ring2="Menelaus's Ring",
		back="Oretan. Cape +1",
		legs="Acad. Pants +2",
		feet="Vanya Clogs"}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"}) -- TBD

	sets.midcast['Enhancing Magic'] = {
		main="Musa",
		head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Mimir Earring",
		body="Peda. Gown +3",
		hands="Arbatel Bracers +2",
		ring1=SR1,
		ring2=SR2,
		back="Fi Follet Cape +1",
		waist="Embla Sash",
		legs=TelEnhLegs,
		feet=TelEnhFeet}

    sets.midcast.Regen = {
		main="Musa",
		head="Arbatel Bonnet +3",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Mimir Earring",
		body=TelenhBody,
		hands="Arbatel Bracers +2",
		ring1=SR1,
		ring2=SR2,
		back=AMBUNUKE,
		waist="Embla Sash",
		legs=TelEnhLegs,
		feet=TelEnhFeet}

	sets.midcast.Regen.Duration = {
		main="Musa", 
		head=TelEnhHead,
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Mimir Earring",
		body=TelenhBody,
		hands="Arbatel Bracers +2",
		ring1=SR1,
		ring2=SR2,
		back=AMBUNUKE,
		waist="Embla Sash",
		legs=TelEnhLegs,
		feet=TelEnhFeet}

	sets.midcast.Regen.Potency = {
		main="Musa",
		head="Arbatel Bonnet +3",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Mimir Earring",
		body=TelRegPotBody,
		hands=TelRegPotHands,
		ring1=SR1,
		ring2=SR2,
		back=AMBUNUKE,
		waist="Embla Sash",
		legs=TelRegPotLegs,
		feet=TelRegPotFeet}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"}) -- neck="Nodens Gorget",legs="Shedir Seraweels"
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {}) -- head="Amalric Coif +1"
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {}) -- main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {}) --legs="Shedir Seraweels"

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +3"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=empty,neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Cohort's Cloak +1",hands="Arbatel's Bracers +2",ring1=SR1,ring2=SR2,  -- Kyakus +1 gloves
        back="Aurist's Cape +1",waist="Luminary Sash",legs="Arbatel Pants +3",feet="Acad. Loafers +3"}
	
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'], {})
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {ear2="Malignance Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {ear1="Malignance Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Agwu's Cap",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Agwu's Robe",hands="Agwu's Gages",ring1="Stikini Ring",ring2="Stikini Ring",
        back=AMBUNUKE,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"}

    sets.midcast.Kaustra = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Agwu's Robe", hands="Amalric gages +1",ring1="Freke Ring",ring2="Archon Ring",
        back=AMBUNUKE,waist="Sacro cord",legs="Amalric Slops +1",feet="Agwu's Pigaches"} 
		
    sets.midcast.Kaustra.Resistant = set_combine(sets.midcast.Kaustra, {})

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Hirudinea Earring",ear2="Mani Earring",
        body="Merlinic Jubbah",hands="Merlinic Dastanas",ring1="Evanescence Ring",ring2="Archon Ring",
        back="Bookworm's Cape",waist="Fucho-no-obi",legs="Peda. Pants +3", feet="Agwu's pigaches",}
		
    sets.midcast.Drain.Resistant = sets.midcast.Drain
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
	head=empty,neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
	body="Cohort's Cloak +1",hands="Agwu's Gages",ring1=SR1,ring2=SR2,
	back="Lugh's cape",waist="Luminary Sash",legs="Agwu's Slops",feet="Agwu's Pigaches"}

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})
	
    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {
		main={name="Bunzi's Rod",priority=1},
		sub={name="Ammurapi Shield",priority=4},
		ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",
		body="Arbatel Gown +3",
		hands="Agwu's gages", -- Arbatel +3
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist="Sacro cord",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		ring1="Metamorph ring +1",
		ring2="Freke Ring", 
    	back=AMBUNUKE
	}

	sets.midcast['Elemental Magic'].Burst = { -- MB1 on site
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",
		neck="Argute Stole +2",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		Body="Arbatel Gown +3",
		hands="Agwu's Gages",
		ring1="Metamorph ring +1",
		ring2="Freke Ring", 
		back=AMBUNUKE,
		waist="Sacro cord",
		legs="Agwu's Slops",
		feet="Arbatel Loafers +3"}

	sets.midcast['Elemental Magic'].Burst.Resistant = { -- MB1 on site
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",
		neck="Argute Stole +2",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		Body="Arbatel Gown +3",
		hands="Agwu's Gages", -- Arbatel +3
		ring1="Metamorph ring +1",
		ring2="Freke Ring", 
		back=AMBUNUKE,
		waist="Sacro cord",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3"}

	sets.midcast['Elemental Magic'].EarthBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",
		neck="Quanpur Necklace",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		Body="Arbatel Gown +3",
		hands="Agwu's Gages",
		ring1="Metamorph ring +1",
		ring2="Freke Ring", 
		back=AMBUNUKE,
		waist="Sacro cord",
		legs="Agwu's Slops",
		feet="Arbatel Loafers +3"}

	sets.midcast['Elemental Magic'].Fodder = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Peda. M.board +3",
		body="Amalric Doublet +1",
		hands="Amalric Gages +1",
		legs="Amalric Slops +1",
		feet="Amalric Nails +1",
		neck="Argute Stole +2",
		waist="Sacro cord",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		ring1="Metamorph ring +1",
		ring2="Freke Ring", 
    	back=AMBUNUKE
	}

	sets.midcast['Elemental Magic'].Resistant = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Peda. M.board +3", 
		body="Amalric doublet +1",
		hands="Agwu's Gages", -- Arbatel Pants +3
		legs="Arbatel Pants +3", 
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist="Sacro cord",
		ear1="Malignance Earring",
		ear2="Regal Earring",
		ring1="Metamorph ring +1",
		ring2="Freke Ring", 
		back=AMBUNUKE}

	-- Gear for Magic Burst mode.
    -- sets.MagicBurst = { -- MB1 on site
	-- 	main="Bunzi's Rod",
	-- 	sub="Ammurapi Shield",
	-- 	ammo="Ghastly Tathlum +1",
	-- 	head="Peda. M.board +3",
	-- 	neck="Argute Stole +2",
	-- 	ear1="Regal Earring",
	-- 	ear2="Malignance Earring",
	-- 	Body="Agwu's Robe",
	-- 	hands="Amalric Gages +1",
	-- 	ring1="Mujin Band",
	-- 	ring2="Freke Ring", 
	-- 	back=AMBUNUKE,
	-- 	waist="Sacro cord",
	-- 	legs="Agwu's Slops",
	-- 	feet="Arbatel Loafers +3"}

	sets.MagicBurst = sets.midcast['Elemental Magic'].Burst
	sets.MagicBurst.Resistant = sets.midcast['Elemental Magic'].Burst.Resistant
		
    sets.midcast['Elemental Magic'].Proc = {
		ammo="Sapience orb", --2
		head="Vanya hood", -- 10
		neck="Unmoving collar +1", -- HP swap to keep from dropping yellow 
		ear1="Loquac. Earring", -- 2
		ear2="Hearty Earring", -- 4
		body="Pinga Tunic", -- 13
		hands="Vanya cuffs", -- 8
		ring1="Kishar Ring", -- 4
		ring2="Prolix Ring", -- 5
		back="Fi Follet Cape +1", -- 10
		waist="Embla Sash", -- 5
		legs="Pinga Pants", -- 11
		feet="Vanya clogs"
	}
		
    sets.midcast['Elemental Magic'].OccultAcumen = set_combine(sets.midcast['Elemental Magic'], {})
		
    -- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})

	--Agwu hat, body, legs, regal earring
	sets.midcast.Helix = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield", -- Culminus
		ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",
		body="Agwu's Robe",
		hands="Amalric Gages +1", -- Arbatel +3
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist="Sacro cord",
		left_ear="Malignance Earring",
		right_ear="Regal earring",
		left_ring="Freke Ring",
		right_ring="Shiva Ring +1", -- Mallquis ring
		back=AMBUNUKE
	}

	sets.midcast.Helix.Burst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield", -- Culminus
		ammo="Ghastly Tathlum +1",
		head="Peda. M.Board +3",
		body="Agwu's Robe",
		hands="Agwu's gages", -- Arbatel +3
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck="Argute Stole +2",
		waist="Sacro cord",
		left_ear="Malignance Earring",
		right_ear="Arbatel earring +1",
		left_ring="Mujin Band",
		right_ring="Freke Ring", 
		back=AMBUNUKE
	}

	sets.midcast.Helix.EarthBurst = sets.midcast.Helix.Burst

	sets.HelixBurst = sets.midcast.Helix.Burst
	
	sets.midcast.Helix.Resistant = set_combine(sets.midcast.Helix, {})
		
	sets.midcast.Helix.Proc = {
		main="Malignance Pole",
		ammo="Sapience orb", --2
		head="Vanya hood", -- 10
		neck="Unmoving collar +1", -- HP swap to keep from dropping yellow 
		ear1="Loquac. Earring", -- 2
		ear2="Hearty Earring", -- 4
		body="Pinga Tunic", -- 13
		hands="Vanya cuffs", -- 8
		ring1="Kishar Ring", -- 4
		ring2="Prolix Ring", -- 5
		back="Fi Follet Cape +1", -- 10
		waist="Embla Sash", -- 5
		legs="Pinga Pants", -- 11
		feet="Vanya clogs"} 

	-- NEED to research impact set (once have cloak)
	sets.midcast.Impact = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Crepuscular Cloak",hands="Agwu's Gages",ring1="Metamor. Ring +1",ring2="Stikini Ring",
		back="Aurist's Cape +1",waist="Sacro cord",legs="Arbatel Pants +3",feet="Arbatel Loafers +3"}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Crepuscular Cloak"})
		
    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Agwu's Robe",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet={ name="Nyame Sollerets", augments={'Path: B',}}}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		main="Bolelabunga",
		sub="Ammurapi Shield", --"Genmei Shield",
		ammo="Staunch Tathlum +1", -- Homilary
		head="Befouled Crown",--{ name="Chironic Hat", augments={'INT+8','STR+4','"Refresh"+2',}}, -- DM AUG OR BEFOULED CROWN
		body="Arbatel Gown +3",
		hands="Nyame gauntlets",
		legs="Arbatel Pants +3",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Loricate torque +1",		
		waist="Carrier's Sash",
		left_ear="Hearty Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending ring",
		right_ring={name="Stikini Ring", bag="Wardrobe2"},
		back="Moonbeam cape"}

    sets.idle.PDT = {
		main="Bolelabunga",
		sub="Ammurapi Shield", --"Genmei Shield",
		ammo="Staunch Tathlum +1", -- Homilary
		head="Nyame helm",
		body="Arbatel Gown +3",
		hands="Nyame gauntlets",
		legs="Arbatel Pants +3",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sanctity Necklace",		
		waist="Carrier's Sash",
		left_ear="Hearty Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending ring",
		right_ring={name="Stikini Ring", bag="Wardrobe2"},
		back="Moonbeam cape",}
		
	sets.idle.Hippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})
		
    sets.Kiting = {feet="Herald's Gaiters"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {ammo="Staunch Tathlum",
        head="Nyame Helm",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Eihwaz Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet={ name="Nyame Sollerets", augments={'Path: B',}}}
		
	sets.engaged.PDT = {ammo="Staunch Tathlum",
        head="Nyame Helm",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Eihwaz Ring",
        back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet={ name="Nyame Sollerets", augments={'Path: B',}}}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +3"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +3"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +2"}

    sets.buff['Immanence'] = {ammo="Sapience orb", --2
		head="Vanya hood", -- 10
		neck="Unmoving collar +1", -- HP swap to keep from dropping yellow 
		ear1="Loquac. Earring", -- 2
		ear2="Hearty Earring", -- 4
		body="Pinga Tunic", -- 13
		hands="Vanya cuffs", -- 8
		ring1="Kishar Ring", -- 4
		ring2="Prolix Ring", -- 5
		back="Fi Follet Cape +1", -- 10
		waist="Embla Sash", -- 5
		legs="Pinga Pants", -- 11
		feet="Vanya clogs"}

    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +3"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +3"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +3"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {} --legs="Academic's Pants +3"
	sets.buff['Dark Arts'] = {} --body="Academic's Gown +3"

    sets.buff.Sublimation = {head="Acad. Mortar. +3",body="Peda. Gown +3",waist="Embla Sash",ear1="Savant's earring"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Bunzi = {main="Bunzi's Rod",sub="Ammurapi shield"}
	sets.weapons.Akademos = {main="Akademos",sub="Enki Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
	sets.weapons.Musa = {main="Musa",sub="Enki Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 014')
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, spellMap, eventArgs)

    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
	
	if spell.skill == 'Enfeebling Magic' then
		if (state.Buff['Light Arts'] or state.Buff['Addendum: White']) and sets.buff['Light Arts'] then
			equip(sets.buff['Light Arts'])
		elseif (state.Buff['Dark Arts'] or state.Buff['Addendum: Black']) and sets.buff['Dark Arts'] then
			equip(sets.buff['Dark Arts'])
		end
	elseif default_spell_map == 'ElementalEnfeeble' and (state.Buff['Dark Arts']  or state.Buff['Addendum: Black']) and sets.buff['Dark Arts'] then
		equip(sets.buff['Dark Arts'])
    elseif spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' then
		if state.MagicBurstMode.value ~= 'Off' then
			if spellMap == 'Helix' then
				if state.CastingMode.value:contains('Resistant') and sets.ResistantHelixBurst then
					equip(sets.ResistantHelixBurst)
				elseif sets.HelixBurst then
					equip(sets.HelixBurst)
				end
			elseif state.CastingMode.value:contains('Resistant') and sets.ResistantMagicBurst then
				equip(sets.ResistantMagicBurst)
			else
				equip(sets.MagicBurst)
			end
		end
		if not state.CastingMode.value:contains('Resistant') then
			if spell.element == world.weather_element or spell.element == world.day_element then
				-- if item_available('Twilight Cape') and not LowTierNukes:contains(spell.english) and not state.Capacity.value then
					-- sets.TwilightCape = {back="Twilight Cape"}
					-- equip(sets.TwilightCape)
				-- end
				if spell.element == world.day_element and state.CastingMode.value == 'Fodder' then
					if item_available('Zodiac Ring') then
						sets.ZodiacRing = {ring2="Zodiac Ring"}
						equip(sets.ZodiacRing)
					end
				end
				if state.Buff.Klimaform and spell.element == world.weather_element then
					equip(sets.buff['Klimaform'])
				end
			end
			if spell.element and sets.element[spell.element] then
				equip(sets.element[spell.element])
			end
			if state.Buff.Ebullience then
				equip(sets.buff['Ebullience'])
			end
		end
		
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
		
		if state.RecoverMode.value ~= 'Never' and (state.RecoverMode.value == 'Always' or tonumber(state.RecoverMode.value:sub(1, -2)) > player.mpp) then
			if state.MagicBurstMode.value ~= 'Off' then
				if state.CastingMode.value:contains('Resistant') and sets.ResistantRecoverBurst then
					equip(sets.ResistantRecoverBurst)
				elseif sets.RecoverBurst then
					equip(sets.RecoverBurst)
				elseif sets.RecoverMP then
					equip(sets.RecoverMP)
				end
			elseif sets.RecoverMP then
				equip(sets.RecoverMP)
			end
		end
    end
	
	if spell.english:startswith('Regen') then
		if state.RegenMode.value == 'Duration' and sets.midcast.Regen.Duration then
			equip(sets.midcast.Regen.Duration)
		elseif state.RegenMode.value == 'Potency' and sets.midcast.Regen.Potency then
			equip(sets.midcast.Regen.Potency)
		end
		if state.RegenMode.value ~= 'No Staff' then
			equip_weaponset('Musa')
		end
	end
end