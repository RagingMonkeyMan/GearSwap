-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc','Crit')
	state.HybridMode:options('Hybrid','Normal','DT')
	state.RangedMode:options('Normal','Acc')
	state.WeaponskillMode:options('Match','Normal','Acc','Uncapped','Proc')
	state.CastingMode:options('Normal','Proc','Resistant')
	state.IdleMode:options('Normal','Sphere')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Heishi','Tanking',"GreatKatana","Evisceration",'Savage','Aeolian','Tanking','None','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff')

    state.Stance = M{['description']='Stance','None','Innin','Yonin'}

    AmbuDEXDA = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    AmbuHybridWS = { name="Andartia's Mantle", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','STR+10','Weapon skill damage +10%',}}
    AmbuCrit = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
    AmbuTP = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    AmbuFC = { name="Andartia's Mantle", augments={'"Fast Cast"+10',}}

	send_command('bind ^` input /ja "Innin" <me>')
	send_command('bind !` input /ja "Yonin" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !q gs c set WeaponskillMode Proc;;gs c set CastingMode Proc;gs c update')
	send_command('bind ^q gs c weapons Default;gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
	send_command('bind ^f7 gs c weapons Heishi;gs c update')
    send_command('bind ~` gs c cycle Stance')

	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {ammo="Sapience Orb",
        head=TaeonEnmity,neck="Moonlight Necklace",ear1="Cryptic Earring",ear2="Trux Earring",
        body="Emet Harness +1",hands="Kurys Gloves",ring1="Eihwaz Ring",ring2="Supershear Ring",
        back="Moonbeam Cape",waist="Trance Belt",legs="Zoar subligar +1",feet="Mochi. Kyahan +3"}

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama",--main="Nagi"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {} --body="Mochizuki Chainmail"
    sets.precast.JA['Provoke'] = sets.Enmity
    sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=AmbuDEXDA,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"
    }

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {ammo="Date Shuriken",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=AmbuDEXDA,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"
    }

    sets.precast.Flourish1 = {ammo="Date Shuriken",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Dedition Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=AmbuDEXDA,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"
    }

    -- Fast cast sets for spells

    sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring", -- herc head, legs, feet for FC
		body="Dread Jupon",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
		back=AmbuFC,waist="",legs="Rawhide Trousers",feet="Mochi. Kyahan +3"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",back=AmbuDEXDA,feet="Hattori Kyahan +1"})
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {})

    -- Snapshot for ranged
    sets.precast.RA = {}
    
    -- Weaponskill sets

    -- TODO: Add uncapped att sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Hattori Kyahan +3",
        neck="Ninja Nodowa +2",
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back=AmbuHybridWS
    }

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Proc = {ammo="Impatiens",
        head="Malignance Chapeau",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring", 
        body="Dread Jupon",hands="Leyline Gloves",ring1="Weatherspoon Ring",ring2="Kishar Ring",
        back=AmbuFC,waist="Plat. Mog. Belt",legs="Malignance Tights",feet="Maligance Boots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Blade: Hi'] = {
        ammo="Yetshila +1", 
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Hattori Kyahan +3",
        neck="Ninja Nodowa +2", 
        waist="Sailfi belt +1",
        right_ear="Hattori Earring +1",
        left_ear="Odr Earring", 
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back=AmbuHybridWS
    }
    
    sets.precast.WS['Blade: Hi'].Uncapped = set_combine(sets.precast.WS['Blade: Hi'], {})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = {
        ammo="Crepuscular pebble",
        head="Kendatsuba Jinpachi +1",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Mpaca's hose", -- Mpaca's hose once augmented
        feet="Ken. Sune-Ate +1",
        neck="Ninja Nodowa +2",
        waist="Fotia Belt",
        right_ear="Hattori Earring +1",
        left_ear="Lugra Earring +1",
        left_ring="Ephramad's Ring",
        right_ring="Gere Ring",
        back=AmbuHybridWS
    }
    
    sets.precast.WS['Blade: Shun'].Uncapped = set_combine(sets.precast.WS['Blade: Shun'], {legs=""})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS['Blade: Shun'], {})
	
	sets.precast.WS['Blade: Ku'] = {
        ammo="Crepuscular pebble",
        head="Blistering Sallet +1",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Mpaca's hose", -- Mpaca's hose once augmented
        feet="Hattori Kyahan +3",
        neck="Ninja Nodowa +2",
        waist="Fotia Belt",
        right_ear="Hattori Earring +1",
        left_ear="Lugra Earring +1",
        left_ring="Regal Ring",
        right_ring="Gere Ring",
        back=AmbuHybridWS
    }
    
    sets.precast.WS['Blade: Ku'].Uncapped = set_combine(sets.precast.WS['Blade: Ku'], {})
    sets.precast.WS['Blade: Ku'].Acc = set_combine(sets.precast.WS['Blade: Ku'], {})

    sets.precast.WS['Blade: Ten'] = {
        ammo="Crepuscular pebble", 
        head="Hachiya Hatsu. +3", 
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Hattori Kyahan +3",
        neck="Ninja Nodowa +2",
        waist="Sailfi belt +1",
        right_ear="Hattori Earring +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}}, -- odr earring
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back=AmbuHybridWS
    }
    
    sets.precast.WS['Blade: Ten'].Uncapped = set_combine(sets.precast.WS['Blade: Ten'], {neck="Rep. Plat. Medal"})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS['Blade: Ten'], {})

    sets.precast.WS['Blade: Chi'] = {
        ammo="Seeth. Bomblet +1",
        head="Mochi. hatsuburi +3",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia gorget",
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back=AmbuHybridWS
    }

    sets.precast.WS['Blade: To'] = sets.precast.WS['Blade: Chi']
    sets.precast.WS['Blade: Teki'] = sets.precast.WS['Blade: Chi']
    sets.precast.WS['Blade: Yu'] = sets.precast.WS['Blade: Chi']
    sets.precast.WS['Blade: Ei'] = set_combine(sets.precast.WS['Blade: Chi'], {head="Pixie Hairpin +1",neck="Sibyl Scarf",ring2="Archon ring"})
    sets.precast.WS['Tachi: Jinpu'] = sets.precast.WS['Blade: Chi'] -- Nyame head wins out for these 4 once augmented
    sets.precast.WS['Tachi: Goten'] = sets.precast.WS['Blade: Chi']
    sets.precast.WS['Tachi: Kagero'] = sets.precast.WS['Blade: Chi']
    sets.precast.WS['Tachi: Koki'] = sets.precast.WS['Blade: Chi']

    sets.precast.WS['Savage Blade'] = {
        ammo="Crepuscular pebble", 
        head="Hachiya Hatsu. +3",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Hattori Kyahan +3",
        neck="Ninja Nodowa +2",
        waist="Sailfi belt +1",
        right_ear="Hattori Earring +1",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}}, -- odr earring
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's ring",
        back=AmbuHybridWS
    }
    
    sets.precast.WS['Savage Blade'].Uncapped = set_combine(sets.precast.WS['Savage Blade'], {neck="Rep. Plat. Medal"})
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})

    sets.precast.WS['Evisceration'] = {
        ammo="Yetshila +1",
        head="Adhemar Bonnet +1",
        body="Mpaca's Doublet",
        hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
        legs="Mpaca's Hose",
        feet="Ken. Sune-Ate +1",
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist="Fotia Belt",
        right_ear="Hattori Earring +1",
        left_ear="Odr Earring",
        left_ring="Gere Ring",
        right_ring="Ephramad's Ring",
        back=AmbuCrit
    }

    sets.precast.WS['Evisceration'].Uncapped = {
        ammo="Yetshila +1",
        head="Adhemar Bonnet +1",
        body="Mpaca's Doublet",
        hands={ name="Ryuo Tekko +1", augments={'DEX+12','Accuracy+25','"Dbl.Atk."+4',}},
        legs="Jokushu haidate",
        feet="Ken. Sune-Ate +1",
        neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
        waist="Fotia Belt",
        right_ear="Odr Earring",
        left_ear={ name="Lugra Earring +1", augments={'Path: A',}},
        left_ring="Gere Ring",
        right_ring="Ephramad's Ring",
        back=AmbuCrit
    }

    sets.precast.WS['Aeolian Edge'] = {
        ammo="Ghastly Tathlum +1",
        head="Mochizuki hatsuburi +3",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        right_ear="Friomisi Earring",
        left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
        left_ring="Epaminondas's Ring",
        right_ring="Shiva ring +1",
        back=AmbuHybridWS
    }

	-- Swap to these on Moonshade using WS if at 3000 TP
	-- sets.MaxTP = {ear1="Lugra Earring",ear2="Lugra Earring +1",}
	-- sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	-- sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	-- sets.DayMaxTPWSEars = {ear1="Cessance Earring",ear2="Brutal Earring",}
	-- sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	-- sets.DayWSEars = {ear1="Moonshade Earring",ear2="Brutal Earring",}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Mochizuki Tekko +1",ring1="Defending Ring",ring2="Kishar Ring",
        legs="Rawhide Trousers",feet="Malignance Boots"}

    sets.midcast.ElementalNinjutsu = {ammo="Pemphredo Tathlum",
        head="Mochizuki hatsuburi +3",neck="Sibyl Scarf",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Nyame mail",hands="Hattori Tekko +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",  -- body="Samnuha Coat"
        back="Toro Cape",waist="Eschan Stone",legs="Nyame flanchard",feet="Mochi. Kyahan +3"}

	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})

	sets.MagicBurst = {ring1="Mujin Band",ring2="Locus Ring"}

    sets.midcast.NinjutsuDebuff = {ammo="Ghastly Tathlum +1",
        head="Hachiya Hatsu. +3",neck="Null loop",ear1="Crep. Earring",ear2="Digni. Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Stikini Ring",ring2="Stikini Ring", 
        back="Null Shawl",waist="Null Belt",legs="Malignance tights",feet="Mochi. Kyahan +3"}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

    sets.midcast.Utsusemi = set_combine(sets.Enmity, {back="Andartia's Mantle",feet="Hattori Kyahan +3"})

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Crep. Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance gloves",ring1="Crep. Ring",ring2="Dingir Ring", 
        back="Null Shawl",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Crep. Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance gloves",ring1="Crep. Ring",ring2="Dingir Ring", 
        back="Null Shawl",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {ammo="Date Shuriken",
        head="Nyame helm",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Telos Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=AmbuDEXDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

    sets.defense.PDT = {ammo="Date Shuriken",
        head="Nyame helm",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Telos Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1", 
        back=AmbuDEXDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

    sets.defense.MDT = {
        ammo="Date Shuriken",
        head="Nyame helm",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Telos Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1", 
        back=AmbuDEXDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}

	sets.defense.MEVA = {
        ammo="Date Shuriken",
        head="Nyame helm",neck="Ninja Nodowa +2",ear1="Dedition Earring",ear2="Telos Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1", 
        back=AmbuDEXDA,waist="Flume Belt +1",legs="Nyame flanchard",feet="Nyame sollerets"}


    sets.Kiting = {feet="Danzo Sune-Ate"} 
	sets.DuskKiting = {feet="Danzo Sune-Ate"}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
        ammo="Date Shuriken",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Dedition Earring",
        left_ear="Telos Earring",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back=AmbuTP
    }

    sets.engaged.Acc = {
        ammo="Date Shuriken",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Dedition Earring",
        left_ear="Telos Earring",
        left_ring="Gere Ring",
        right_ring="Chirich Ring +1",
        back=AmbuTP
    }

    sets.engaged.Crit = {ammo="Date Shuriken",
        head="Mummu Bonnet +2",neck="Moonbeam Nodowa",ear1="Cessance Earring",ear2="Brutal Earring",
        body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Gere Ring",ring2="Epona's Ring",
        back=AmbuTP,waist="Windbuffet Belt +1",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}

    sets.engaged.DT = {
        ammo="Date Shuriken",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Dedition Earring",
        left_ear="Telos Earring",
        left_ring="Defending Ring",
        left_ring="Gere Ring",
        back=AmbuTP
    }

	sets.engaged.Acc.DT = {
        ammo="Date Shuriken",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        right_ear="Dedition Earring",
        left_ear="Telos Earring",
        left_ring="Defending Ring",
        left_ring="Gere Ring",
        back=AmbuTP
    }

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {} --body="Hattori Ningi +1"
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Futae = {}
    sets.buff.Yonin = {} --legs="Hattori Hakama +1"
    sets.buff.Innin = {} --head="Hattori Zukin +1"

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {}
	sets.DWMax = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head="White rarab cap +1", waist="Chaac Belt"})
	sets.Skillchain = {legs="Ryuo Hakama"}

	-- Weapons sets
	sets.weapons.Heishi = {main="Heishi Shorinken",sub="Kunimitsu"}
    sets.weapons.GreatKatana = {main="Hachimonji",sub="Alber strap"}
    sets.weapons.Tanking = {main="Heishi Shorinken",sub="Yagyu Darkblade"}
	sets.weapons.Savage = {main="Naegling",sub="Uzura +2"}
    sets.weapons.Aeolian = {main="Tauret",sub="Kunimitsu"}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.MagicWeapons = {main="Kunimitsu",sub="Tauret"}
	sets.weapons.ProcDagger = {main="Wind Knife",sub="Wind Knife"}
	sets.weapons.ProcSword = {main="Nihility",sub="Wind Knife"}
	sets.weapons.ProcGreatSword = {main="Ophidian Sword",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Tzee Xicu's Blade",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Mutsunokami +1",sub=empty}
	sets.weapons.ProcKatana = {main="Heishi Shorinken",sub="Kunimitsu"}
	sets.weapons.ProcClub = {main="Octave Club",sub=empty}
	sets.weapons.ProcStaff = {main="Lamia Staff",sub=empty}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 12)
end
