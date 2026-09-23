-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Gun', 'Gun Crit', 'GunAcc','Bow', 'BowCrit', 'BowAcc')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('Fomalhaut','Gandiva','DualFomalhaut','DualGandiva','DualSavageWeapons','DualMagicWeapons','DualAeolian','DualSC','DualEviscerationWeapons')
	
	WeaponType =  {['Fail-Not'] = "Bow",
				   ['Gandiva'] = "Bow",
				   ['Sparrowhawk +2'] = "Bow",
                   ['Fomalhaut'] = "Gun",
				   ['Anarchy +2'] = "Gun",
				   ['Doomsday'] = "Gun",
                   }

	DefaultAmmo = {
		['Bow']  = {['Default'] = "Artemis's Arrow",
					['WS'] = "Artemis's Arrow",
					['Acc'] = "Artemis's Arrow",
					['Magic'] = "Artemis's Arrow",
					['MagicAcc'] = "Artemis's Arrow",
					['Unlimited'] = "Hauksbok Arrow",
					['MagicUnlimited'] ="Hauksbok Arrow",
					['MagicAccUnlimited'] ="Hauksbok Arrow"},
					
		['Gun']  = {['Default'] = "Chrono Bullet",
					['WS'] = "Chrono Bullet",
					['Acc'] = "Chrono Bullet",
					['Magic'] = "Chrono Bullet",
					['MagicAcc'] = "Chrono Bullet",
					['Unlimited'] = "Animikii Bullet",
					['MagicUnlimited'] = "Animikii Bullet",
					['MagicAccUnlimited'] ="Animikii Bullet"},
					
		['Crossbow'] = {['Default'] = "Eminent Bolt",
						['WS'] = "Eminent Bolt",
						['Acc'] = "Eminent Bolt",
						['Magic'] = "Eminent Bolt",
						['MagicAcc'] = "Eminent Bolt",
						['Unlimited'] = "Hauksbok Bolt",
						['MagicUnlimited'] = "Hauksbok Bolt",
						['MagicAccUnlimited'] ="Hauksbok Bolt"}
	}
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()

	BelenusRATTWSD = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','Weapon skill damage +10%',}}
	BelenusMABWSD = { name="Belenus's Cape", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	BelenusCrit = { name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','DEX+10','Crit.hit rate+10',}}
	BelenusSTP = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','"Store TP"+10',}}
	BelenusSnapshot = { name="Belenus's Cape", augments={'"Snapshot"+10',}}
	BelenusSTRWSD = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	BelenusMelee = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}

	AdhemarDEX = { name="Adhemar Wrist. +1", bag="Wardrobe 2", augments={'DEX+12','AGI+12','Accuracy+20',}}
	AdhemarAGI = { name="Adhemar Wrist. +1", bag="Wardrobe", augments={'AGI+12','Rng.Acc.+20','Rng.Atk.+20',}}
	--------------------------------------
	-- Precast sets
	--------------------------------------
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
	
	
	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +1"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +3"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Double Shot'] = {back=gear.tp_ranger_jse_back}


	-- Fast cast sets for spells

    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Taeon Chapeau", neck="Scout's Gorget +2",
		body="Amini Caban +1",hands="Carmine finger gauntlets +1",
		back=BelenusSnapshot,waist="Impulse Belt",legs="Adhemar Kecks +1",feet="Meghanada jambeaux +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {head="Orion Beret +3",waist="Yemaya Belt"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body=HercBodyRattWSD,hands="Meghanada gloves +2",ring1="Epaminondas's Ring",ring2="Regal ring",
        back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet=HercBootsRattWSD}
		
    sets.precast.WS.Acc = {
        head="Orion Beret +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=BelenusRATTWSD,waist="Fotia Belt",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}
		
	sets.precast.WS['Last Stand'] = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body=HercBodyRattWSD,hands="Meghanada gloves +2",ring1="Epaminondas's Ring",ring2="Regal ring",
        back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet=HercBootsRattWSD}
		
	sets.precast.WS['Last Stand'].Acc = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Enervating earring",ear2="Telos Earring",
        body=HercBodyRattWSD,hands="Meghanada gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet=HercBootsRattWSD}
		
	sets.precast.WS["Jishnu's Radiance"] = {
        head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Odr Earring",ear2="Sherida Earring",
        body="Meghanada cuirie +2",hands="Mummu wrists +2",ring1="Regal ring",ring2="Begrudging Ring",
        back=BelenusCrit,waist="Fotia belt",legs="Jokushu Haidate",feet="Thereoid greaves"} 
		
	sets.precast.WS["Jishnu's Radiance"].Acc = set_combine(sets.precast.WS["Jishnu's Radiance"], {head="Orion beret +3",legs="Arcadian braccae +3"})

    sets.precast.WS['Wildfire'] = {
        head="",neck="Scout's gorget +2",ear1="Friomisi earring",ear2="Hecate's Earring",
        body="Cohort Cloak +1",hands="Carmine finger gauntlets +1",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=BelenusMABWSD,waist="Eschan stone",legs=HercPantsMAB,feet=HercBootsMABWSD}

    sets.precast.WS['Wildfire'].Acc = {
        head="",neck="Scout's gorget +2",ear1="Friomisi earring",ear2="Hecate's Earring",
        body="Cohort Cloak +1",hands="Carmine finger gauntlets +1",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=BelenusMABWSD,waist="Eschan stone",legs=HercPantsMAB,feet=HercBootsMABWSD}
		
	sets.precast.WS['Trueflight'] = {
        head="",neck="Scout's gorget +2",ear1="Friomisi earring",ear2="Moonshade Earring",
        body="Cohort Cloak +1",hands="Carmine finger gauntlets +1",ring1="Weather. Ring",ring2="Dingir Ring",
        back=BelenusMABWSD,waist="Eschan stone",legs=HercPantsMAB,feet=HercBootsMABWSD}

    sets.precast.WS['Trueflight'].Acc = {
        head="",neck="Scout's gorget +2",ear1="Friomisi earring",ear2="Moonshade Earring",
        body="Cohort Cloak +1",hands="Carmine finger gauntlets +1",ring1="Weather. Ring",ring2="Dingir Ring",
        back=BelenusMABWSD,waist="Eschan stone",legs=HercPantsMAB,feet=HercBootsMABWSD}
		
    sets.precast.WS['Aeolian Edge'] = {
        head="",neck="Sanctity Necklace",ear1="Friomisi earring",ear2="Moonshade Earring",
        body="Cohort Cloak +1",hands="Carmine finger gauntlets +1",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=BelenusMABWSD,waist="Eschan stone",legs=HercPantsMAB,feet=HercBootsMABWSD}
		
    sets.precast.WS['Evisceration'] = {
		head="Adhemar bonnet +1",
		neck="Fotia gorget",
		ear1="Odr earring",
		ear2="Sherida earring",
		body="Meghanada cuirie +2", 
		hands="Mummu wrists +2", 
		ring1="Ilabrat ring",
		ring2="Epaminondas's Ring",
		back=BelenusCrit,
		waist="Fotia belt",
		legs="Meghanada chausses +2",
		feet="Mummu gamashes +2"}

    sets.precast.WS['Exenterator'] = sets.precast.WS
	
	sets.precast.WS['Savage Blade'] = {
		head="Orion beret +3",
		neck="Scout's gorget +2",
		ear1="Ishvara earring",
		ear2="Moonshade earring",
		body=HercBodyWSD, 
		hands="Meghanada gloves +2", 
		ring1="Epaminondas's Ring",
		ring2="Regal ring",
		back=BelenusSTRWSD,
		waist="Sailfi belt +1",
		legs="Arcadian braccae +3",
		feet=HercBootsWSD
	}
	
	sets.precast.WS['Decimation'] = {
		head="Orion beret +3",
		neck="Scout's gorget +2",
		ear1="Ishvara earring",
		ear2="Moonshade earring",
		body=HercBodyWSD, 
		hands="Meghanada gloves +2", 
		ring1="Epaminondas's Ring",
		ring2="Regal ring",
		back=BelenusSTRWSD,
		waist="Sailfi belt +1",
		legs="Arcadian braccae +3",
		feet=HercBootsWSD
	}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
		
	-- Ranged sets

    sets.midcast.RA = {
		head="Arcadian beret +3",neck="Iskur gorget",ear1="Dedition earring",ear2="Telos Earring",
		body="Nisroch Jerkin",hands="Malignance gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
		back=BelenusSTP,waist="Yemaya belt",legs="Adhemar kecks +1",feet="Malignance boots" }
		
	sets.midcast.RA.Bow = {
		head="Arcadian beret +3",neck="Iskur gorget",ear1="Dedition earring",ear2="Telos Earring",
		body="Nisroch Jerkin",hands="Malignance gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=BelenusSTP,waist="Yemaya belt",legs="Adhemar kecks +1",feet="Malignance boots" }
	
	sets.midcast.RA.BowCrit = {
		head="Meghanada visor +2",neck="Iskur gorget",ear1="Enervating earring",ear2="Telos Earring",
        body="Nisroch Jerkin",hands="Mummu wrists +2",ring1="Ilabrat ring",ring2="Begrudging Ring",
        back=BelenusCrit,waist="Kwahu Kachina belt +1",legs="Darraigner's Brais",feet="Arcadian socks +3"} 
	
	sets.midcast.RA.BowAcc = set_combine(sets.midcast.RA,{waist="Kwahu Kachina belt +1", ear2="Telos Earring"})
	
	sets.midcast.RA.Gun = {
		head="Arcadian beret +3",neck="Iskur gorget",ear1="Dedition earring",ear2="Telos Earring",
		body="Nisroch Jerkin",hands="Malignance gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
		back=BelenusSTP,waist="Yemaya belt",legs="Adhemar kecks +1",feet="Malignance boots" }
	
	sets.midcast.RA.GunCrit = {
		head="Meghanada visor +2",neck="Iskur gorget",ear1="Dedition earring",ear2="Telos Earring",
        body="Nisroch Jerkin",hands="Mummu wrists +2",ring1="Ilabrat ring",ring2="Begrudging Ring",
        back=BelenusCrit,waist="Kwahu Kachina belt +1",legs="Darraigner's Brais",feet="Arcadian socks +3"} 
	
	sets.midcast.RA.GunAcc = set_combine(sets.midcast.RA,{waist="Kwahu Kachina belt +1", feet="Malignance boots", ear2="Telos Earring"})
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {body="Orion Jerkin +3"}
	sets.buff.Camouflage.Acc = {body="Orion Jerkin +3"}
	sets.buff['Double Shot'] = {head="Oshosi Mask +1", body="Arcadian jerkin +3", hands="Oshosi gloves +1", legs="Oshosi trousers +1", feet="Oshosi leggings +1"}
	sets.buff['Double Shot'].Acc = {head="Oshosi Mask +1", body="Arcadian jerkin +3", hands="Oshosi gloves +1", legs="Oshosi trousers +1", feet="Oshosi leggings +1"}
	sets.buff.Barrage = {hands="Orion Bracers +3"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Arcadian beret +3",neck="Loricate torque +1",ear1="Dedition earring",ear2="Telos Earring",
		body="Nisroch Jerkin",hands="Meghanada gloves +2",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Flume belt",legs="Arcadian braccae +3",feet="Fajin Boots"}
		
	sets.idle.PDT = {
		head="Malignance Chapeau",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}
	
    sets.defense.PDT = {
		head="Malignance Chapeau",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}

    sets.defense.MDT = {
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}
		
    sets.defense.MEVA = {
        head="Malignance Chapeau",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Fomalhaut = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Gandiva = {main="Perun +1",sub="Nusku Shield",range="Gandiva"}
	sets.weapons.DualFomalhaut = {main="Perun +1",sub="Kustawi +1",range="Fomalhaut"}
	sets.weapons.DualGandiva = {main="Perun +1",sub="Kustawi +1",range="Gandiva"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Sparrowhawk +2"}
	sets.weapons.DualEviscerationWeapons = {main="Tauret",sub="Blurred Knife +1",range="Sparrowhawk +2"}
	sets.weapons.DualMagicWeapons = {main="Malevolence",sub="Malevolence",range="Doomsday"}
	sets.weapons.DualAeolian = {main="Malevolence",sub="Malevolence",range="Sparrowhawk +2",ammo="Hauksbok Arrow"}
	sets.weapons.DualSC = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		head="Malignance Chapeau",neck="Iskur gorget",ear1="Dedition earring",ear2="Telos Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
        back=BelenusMelee,waist="Sailfi belt +1",legs="Samnuha tights",feet="Malignance boots"}
    
    sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Lissome necklace",ear1="Dedition earring",ear2="Telos Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
        back=BelenusMelee,waist="Sailfi belt +1",legs="Samnuha tights",feet="Malignance boots"}

		
    sets.engaged.DT = {
		head="Malignance Chapeau",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=BelenusMelee,waist="Flume belt",legs="Meghanada chausses +2",feet="Malignance boots"}

    sets.engaged.DW = {
		head="Adhemar bonnet +1",neck="Iskur gorget",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands="Floral gauntlets",ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=BelenusMelee,waist="Windbuffet belt +1",legs="Samnuha tights",feet=HercBootsSTRTA}
		
    sets.engaged.DW.DT = {
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=BelenusMelee,waist="Flume belt",legs="Samnuha tights",feet="Malignance Boots"}
    
    sets.engaged.DW.Acc = {
		head="Malignance Chapeau",neck="Lissome necklace",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands="Floral gauntlets",ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=BelenusMelee,waist="Windbuffet belt +1",legs="Carmine cuisses +1",feet="Malignance boots"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
     set_macro_page(1, 4)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 004')
end
