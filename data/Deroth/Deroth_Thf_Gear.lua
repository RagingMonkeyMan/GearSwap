-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Normal','Savage','MagicWeapons','ProcDagger','ProcStaff','ProcClub','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana')


    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
	state.AmbushMode = M(false, 'Ambush Mode')

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
	send_command('bind ^p gs c weapons ProcDagger;gs c set WeaponSkillMode proc;')
	send_command('bind !f7 gs c set weapons Normal')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind ^q gs c weapons Normal;gs c set WeaponSkillMode match') --Requips weapons and gear.
	send_command('bind !y gs c weapons MagicWeapons')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	
	HercHelmSTRTA = { name="Herculean Helm", augments={'Accuracy+22','"Triple Atk."+4'}}
	HercHelmSTRWSD = { name="Herculean Helm", augments={'Accuracy+29','Weapon skill damage +4%','STR+5','Attack+5',}}
	HercHelmMABWSD = { name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +4%','Mag. Acc.+4','"Mag.Atk.Bns."+3',}}
	HercGlovesMABWS = { name="Herculean Gloves", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +4%',}}
	HercGlovesSTRTA = { name="Herculean Gloves", augments={'Rng.Atk.+10','"Triple Atk."+4','STR+3','Attack+11',}}
	HercPantsSTRWSD = { name="Herculean Trousers", augments={'Attack+16','Weapon skill damage +3%','STR+10','Accuracy+7',}}
	HercPantsMAB = { name="Herculean Trousers", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','Weapon skill damage +4%','INT+2','Mag. Acc.+2','"Mag.Atk.Bns."+14',}}
	HercPantsRAWS = { name="Herculean Trousers", augments={'Rng.Acc.+13','Weapon skill damage +5%','AGI+7',}}
    HercBootsSTRTA = { name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','STR+2','Attack+1',}}
	HercBootsMABWSD = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +3%','MND+6',}}
	HercBootsRattWSD = { name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Weapon skill damage +4%',}}
	HercBootsWSD = { name="Herculean Boots", augments={'Attack+9','Weapon skill damage +4%','Accuracy+10',}}
	HercBodyQuad = { name="Herculean Vest", augments={'Pet: Mag. Acc.+26','Pet: INT+2','Quadruple Attack +3','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
    HercBodyRattWSD = { name="Herculean Vest", augments={'Rng.Acc.+12 Rng.Atk.+12','Weapon skill damage +4%','DEX+3','Rng.Acc.+1',}}
	HercBodyWSD = { name="Herculean Vest", augments={'Weapon skill damage +4%','AGI+3','Accuracy+10',}}

    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = {head="White rarab cap +1",body="Volte Jupon", hands="Plunderer's Armlets +1", waist="Chaac Belt", feet="Skulker's Poulaines +1",ammo="Per. Lucky Egg"}
    sets.ExtraRegen = {}
    sets.Kiting = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {ear1="Sherida Earring", ear2="Suppanomimi"}
	sets.DWEarrings = {ear1="Eabani Earring",ear2="Suppanomimi"}
	sets.DWMax = {ear1="Eabani Earring",ear2="Suppanomimi",body="Adhemar Jacket +1",hands="Floral Gauntlets"}
	sets.Parry = {hands="Turms Mittens +1",ring1="Defending Ring"}
	sets.Ambush = {} --body="Plunderer's Vest +1"
	
	-- Weapons sets
	sets.weapons.Normal = {main="Tauret",sub="Sandung"}
	sets.weapons.Savage = {main="Naegling",sub="Blurred Knife +1"}
	sets.weapons.AccSavage = {main="Naegling",sub="Tauret"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Evisceration = {main="Tauret",sub="Blurred Knife +1"}
	sets.weapons.Throwing = {main="Tauret",sub="Blurred Knife +1",range="Raider's Bmrng.",ammo=empty}
	sets.weapons.SwordThrowing = {main="Naegling",sub="Blurred Knife +1",range="Raider's Bmrng.",ammo=empty}
	sets.weapons.Bow = {main="Aeneas",sub="Kustawi +1",range="Kaja Bow",ammo="Chapuli Arrow"}
	
	sets.weapons.ProcStaff = {main="Light Staff"}
	sets.weapons.ProcDagger = {main="Wind Knife",sub="Wind Knife"}
	sets.weapons.ProcClub = {main="Octave club",sub="Wind knife"}
	sets.weapons.ProcSword = {main="Nihility",sub="Wind Knife"}
	sets.weapons.ProcGreatSword = {main="Ophidian Sword",sub=empty}
	sets.weapons.ProcScythe = {main="Ark Scythe",sub=empty}
	sets.weapons.ProcPolearm = {main="Tzee Xicu's Blade",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Mutsunokami +1",sub=empty}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Sacro Mantle",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.JA['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Crep. Earring",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Sacro Mantle",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {"Skulker's Bonnet"}
    sets.precast.JA['Accomplice'] = {"Skulker's Bonnet"}
    sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest"} 
    sets.precast.JA['Steal'] = {hands="Pill. Armlets +1"}
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {legs="Skulker's Culottes",feet="Skulk. Poulaines +1"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}

	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		legs="Rawhide Trousers"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


    -- Ranged snapshot gear
    sets.precast.RA = {}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Cath Palug stone",
        head="Adhemar bonnet +1",neck="Anu torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Adhemar jacket +1",hands={ name="Adhemar wristbands +1", bag="Wardrobe 2"},ring1="Ephramad's ring",ring2="Gere Ring",
        back="Sacro Mantle",waist="Windbuffet belt +1",legs="Samnuha tights",feet=HercBootsSTRTA}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2",feet="Malignance Boots"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Adhemar Jacket +1"})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2"})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2"})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Meg. Cuirie +2"})
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2"})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2"})
	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {ammo="C. Palug Stone"})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",head="Adhemar Bonnet +1",body="Meg. Cuirie +2"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",head="Adhemar Bonnet +1",body="Meg. Cuirie +2"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila",head="Adhemar Bonnet +1",body="Meg. Cuirie +2"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Meg. Cuirie +2"})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2"})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2"})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {ammo="Yetshila",
		head="Gleti's Mask",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Odr Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Ilabrat Ring",
		right_ring="Begrudging Ring",
		back="Sacro Mantle"})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {ammo="Yetshila",head="Adhemar Bonnet +1",ear1="Moonshade Earring",ear2="Odr Earring",neck="Fotia Gorget",body="Abnoba Kaftan",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila",head="Mummu Bonnet +2",ring1="Begrudging Ring",neck="Fotia Gorget",body="Sayadio's Kaftan",hands="Mummu Wrists +2",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {ammo="Yetshila",head="Mummu Bonnet +2",body="Mummu Jacket +2",hands="Mummu Wrists +2",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
	
    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Adhemar Jacket +1",waist="Sailfi Belt +1"})
    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2"})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2"})
	sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"], {ammo="C. Palug Stone",body=gear.herculean_wsd_body,waist="Sailfi Belt +1"})
    sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})
    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})
    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila",body="Meg. Cuirie +2"})

    sets.precast.WS.Proc = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Voltsurge Torque",ear1="Crep. Earring",ear2="Heartseeker Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.WS['Last Stand'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ephramad's ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Empyreal Arrow'] = {
        head="Pill. Bonnet +3",neck="Fotia Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ephramad's ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.WS['Aeolian Edge'] = {ammo="Seething bomblet +1",
        head="Nyame helm",neck="Sibyl Scarf",ear1="Friomisi earring",ear2="Moonshade Earring",
        body="Nyame mail",hands="Nyame gauntlets",ring1="Shiva ring +1",ring2="Epaminondas's ring",
        back="Sacro Mantle",waist="Eschan stone",legs="Nyame flanchard",feet="Nyame sollerets"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Sherida Earring",ear2="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Sherida Earring",ear2="Mache Earring +1"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Tempus Fugit",legs="Rawhide Trousers",feet="Malignance Boots"}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back="Sacro Mantle",waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Apate Ring",ring2="Regal Ring",
        back="Sacro Mantle",waist="Chaac Belt",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Staunch Tathlum +1",
        head="Gleti's Mask",neck="Loricate Torque +1",ear1="Eabani earring",ear2="Odnowa Earring +1",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Sailfi Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.ExtraRegen = {}

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending ring",ring2="Gere Ring",
        back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending ring",ring2="Gere Ring",
        back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending ring",ring2="Gere Ring",
        back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {ammo="Coiste Bodhar",
        head="Adhemar bonnet +1",neck="Iskur Gorget",ear1="Eabani earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar wristbands +1",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
        back="Sacro Mantle",waist="Sailfi Belt +1",legs="Malignance Tights",feet=HercBootsSTRTA}
		
    sets.engaged.SomeAcc = {ammo="Aurgelmir Orb +1",
        head="Adhemar bonnet +1",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar wristbands +1",ring1="Gere Ring",ring2="Epona's Ring",
        back="Sacro Mantle",waist="Reiki Yotai",legs="Samnuha Tights",feet=HercBootsSTRTA}
    
	sets.engaged.Acc = {ammo="Yamarang",
        head="Pill. Bonnet +3",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Floral Gauntlets",ring1="Ilabrat Ring",ring2="Regal Ring",
        back="Sacro Mantle",waist="Olseni Belt",feet="Malignance Boots"}
		
    sets.engaged.FullAcc = {ammo="C. Palug Stone",
        head="Pill. Bonnet +3",neck="Combatant's Torque",ear1="Odr Earring",ear2="Mache Earring +1",
        body="Mummu Jacket +2",hands="Adhemar wristbands +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Sacro Mantle",waist="Olseni Belt",feet="Malignance Boots"}

    sets.engaged.Fodder = {ammo="Aurgelmir Orb +1",
        head="Adhemar bonnet +1",neck="Iskur Gorget",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar wristbands +1",ring1="Gere Ring",ring2="Epona's Ring",
        back="Sacro Mantle",waist="Reiki Yotai",legs="Samnuha Tights",feet=HercBootsSTRTA}

    sets.engaged.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonbeam cape",waist="Flume belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.SomeAcc.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.Acc.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.FullAcc.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Odr Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.Fodder.DT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    
end

--Job Specific Trust Override
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[993] < spell_latency and not have_trust("ArkEV") then
					windower.chat.input('/ma "AAEV" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[955] < spell_latency and not have_trust("Apururu") then
					windower.chat.input('/ma "Apururu (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end