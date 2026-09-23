-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal', 'TrueShot', 'DT', 'Crit', 'Acc')
	state.WeaponskillMode:options('Match', 'UncappedAtt', 'Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('DualGastraphetes','DualSavageWeapons','DualAeolian','DualFomalhaut', 'DualArmageddon','DualAnnihilator','Gastraphetes','Fomalhaut','Armageddon','Annihilator','DualSC','DualEviscerationWeapons', 'None')
	
	WeaponType =  {['Fail-Not'] = "Bow",
				   ['Gandiva'] = "Bow",
				   ['Loxley Bow'] = "Bow",
				   ['Sparrowhawk +2'] = "Bow",
                   ['Fomalhaut'] = "Gun",
				   ['Anarchy +2'] = "Gun",
				   ['Holliday'] = "Gun",
				   ['Annihilator'] = "Gun",
				   ['Armageddon'] = "Gun",
				   ['Gastraphetes'] = 'Crossbow'
                   }

	DefaultAmmo = {
		['Bow']  = {['Default'] = "Wooden Arrow",
					['WS'] = "Artemis's Arrow",
					['Acc'] = "Artemis's Arrow",
					['Magic'] = "Artemis's Arrow",
					['MagicAcc'] = "Artemis's Arrow",
					['Unlimited'] = "Hauksbok Arrow",
					['MagicUnlimited'] ="Hauksbok Arrow",
					['MagicAccUnlimited'] ="Hauksbok Arrow"},
					
		['Gun']  = {['Default'] = "Chrono Bullet",
					['WS'] = "Chrono Bullet",
					['Acc'] = "Eradicating Bullet",
					['Magic'] = "Devastating Bullet",
					['MagicAcc'] = "Devastating Bullet",
					['Unlimited'] = "Chrono Bullet",
					['MagicUnlimited'] = "Hauksbok Bullet",
					['MagicAccUnlimited'] ="Hauksbok Bullet"},
					
		['Crossbow'] = {['Default'] = "Quelling Bolt",
						['WS'] = "Quelling Bolt",
						['Acc'] = "Quelling Bolt",
						['Magic'] = "Quelling Bolt",
						['MagicAcc'] = "Quelling Bolt",
						['Unlimited'] = "Quelling Bolt",
						['MagicUnlimited'] = "Quelling Bolt",
						['MagicAccUnlimited'] ="Quelling Bolt"}
	}
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons MagicWeapons;gs c update')
	send_command('bind ^q gs c weapons SingleWeapon;gs c update')
	send_command('bind ^f7 gs c weapons DualGastraphetes;gs c update')
	send_command('bind !f7 gs c weapons Gastraphetes;gs c update')
	
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()

	BelenusRATTWSD = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	BelenusMABWSD = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	BelenusCrit = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Crit.hit rate+10',}}
	BelenusSTP = { name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	BelenusSnapshot = { name="Belenus's Cape", augments={'"Snapshot"+10',}}
	BelenusSTRWSD = { name="Belenus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	BelenusMelee = { name="Belenus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}

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
    HercBootsSTRTA = { name="Herculean Boots", augments={'Accuracy+22','"Triple Atk."+4','STR+2','Attack+1',}}
	HercBootsMABWSD = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+24','Weapon skill damage +3%','MND+6',}}
	HercBootsRattWSD = { name="Herculean Boots", augments={'Rng.Acc.+25 Rng.Atk.+25','Weapon skill damage +4%',}}
	HercBootsWSD = { name="Herculean Boots", augments={'Attack+9','Weapon skill damage +4%','Accuracy+10',}}
	HercBodyQuad = { name="Herculean Vest", augments={'Pet: Mag. Acc.+26','Pet: INT+2','Quadruple Attack +3','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}
    HercBodyRattWSD = { name="Herculean Vest", augments={'Rng.Acc.+12 Rng.Atk.+12','Weapon skill damage +4%','DEX+3','Rng.Acc.+1',}}
	HercBodyWSD = { name="Herculean Vest", augments={'Weapon skill damage +4%','AGI+3','Accuracy+10',}}
	
	sets.Obi = {waist="Hachirin-no-obi"}
	
	sets.TreasureHunter = {head="Wh. Rarab Cap +1",body="Volte Jupon",waist="Chaac Belt"}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {hands="Amini Glove. +3"})
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +3"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Double Shot'] = {back=BelenusSTP}


	-- Fast cast sets for spells

    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Taeon Chapeau",neck="Scout's Gorget +2", -- snapshot Taeon Chapeau
		body="Amini Caban +3",hands="Carmine finger gauntlets +1",ring1="Crepuscular ring",
		back=BelenusSnapshot,waist="Yemaya Belt",legs="Orion Braccae +3",feet="Meghanada jambeaux +2"}

	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {legs="Adhemar Kecks +1",head="Orion Beret +3"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {legs="Adhemar Kecks +1",head="Orion Beret +3"}) -- Arcadian Socks +3
	
	sets.precast.RA.DualGastraphetes = {
		head="Orion Beret +3",neck="Scout's Gorget +2",
		body="Amini Caban +3",hands="Carmine finger gauntlets +1",ring1="Crepuscular ring",
		back=BelenusSnapshot,waist="Yemaya Belt",legs="Orion Braccae +3",feet="Meghanada jambeaux +2"}

	sets.precast.RA.DualGastraphetes.Flurry = set_combine(sets.precast.RA, {legs="Adhemar Kecks +1",head="Orion Beret +3"}) -- Arcadian Socks +3
	sets.precast.RA.DualGastraphetes.Flurry2 = set_combine(sets.precast.RA, {legs="Adhemar Kecks +1",head="Orion Beret +3"}) -- Arcadian Socks +3, Pursuer's pants
	
	sets.precast.RA.Gastraphetes = {
		head="Orion Beret +3",neck="Scout's Gorget +2",
		body="Amini Caban +3",hands="Carmine finger gauntlets +1",ring1="Crepuscular ring",
		back=BelenusSnapshot,waist="Yemaya Belt",legs="Orion Braccae +3",feet="Meghanada jambeaux +2"}
		
	sets.precast.RA.Gastraphetes.Flurry = set_combine(sets.precast.RA, {legs="Adhemar Kecks +1",head="Orion Beret +3"}) -- Arcadian Socks +3
	sets.precast.RA.Gastraphetes.Flurry2 = set_combine(sets.precast.RA, {legs="Adhemar Kecks +1",head="Orion Beret +3"}) -- Arcadian Socks +3, Pursuer's pants


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Moonshade Earring",ear2="Amini Earring +1",
        body="Ikenga's Vest",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=BelenusRATTWSD,waist="Fotia belt",legs="Nyame Flanchard",feet="Amini bottillons +3"}
		
    sets.precast.WS.Acc = {
        head="Orion Beret +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Ikenga's Vest",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=BelenusRATTWSD,waist="Fotia Belt",legs="Nyame Flanchard",feet="Amini bottillons +3"}
		
	sets.precast.WS['Last Stand'] = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Moonshade Earring",ear2="Amini Earring +1",
        body="Ikenga's Vest",hands="Ikenga's gloves",ring1="Ephramad's ring",ring2="Sroda Ring",
        back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25

	sets.precast.WS['Last Stand'].UncappedAtt = {
		head="Orion beret +3",neck="Fotia gorget",ear1="Moonshade Earring",ear2="Amini Earring +1",
		body="Amini Caban +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Dingir ring", 
		back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS["Last Stand"], {})
	
	sets.precast.WS['Coronach'] = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Ishvara Earring",ear2="Amini Earring +1",
        body="Amini Caban +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring", 
        back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25
	
	sets.precast.WS['Coronach'].UncappedAtt = {
		head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara Earring",ear2="Amini Earring +1",
		body="Amini Caban +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25

	sets.precast.WS['Coronach'].Acc = set_combine(sets.precast.WS["Coronach"], {})

	sets.precast.WS['Namas Arrow'] = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Ishvara Earring",ear2="Amini Earring +1",
        body="Amini Caban +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring", 
        back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25
	
	sets.precast.WS['Namas Arrow'].UncappedAtt = {
		head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara Earring",ear2="Amini Earring +1",
		body="Amini Caban +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring", 
		back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25

	sets.precast.WS['Namas Arrow'].Acc = set_combine(sets.precast.WS["Namas Arrow"], {})

	sets.precast.WS['Apex Arrow'] = {
        head="Orion beret +3",neck="Scout's gorget +2",ear1="Ishvara Earring",ear2="Amini Earring +1",
        body="Amini Caban +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25
	
	sets.precast.WS['Apex Arrow'].UncappedAtt = {
		head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara Earring",ear2="Amini Earring +1",
		body="Amini Caban +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=BelenusRATTWSD,waist="Fotia belt",legs="Arcadian braccae +3",feet="Amini bottillons +3"} -- Nyame flanchard once R25

	sets.precast.WS['Apex Arrow'].Acc = set_combine(sets.precast.WS["Apex Arrow"], {})
		
	-- sets.precast.WS["Jishnu's Radiance"] = {  -- OLD SET
    --     head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Odr Earring",ear2="Amini Earring +1",
    --     body="Meghanada cuirie +2",hands="Mummu wrists +2",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
    --     back=BelenusCrit,waist="Fotia belt",legs="Jokushu Haidate",feet="Thereoid greaves"} 

	sets.precast.WS["Jishnu's Radiance"] = {
		head="Blistering Sallet +1",neck="Scout's Gorget +2",ear1="Odr Earring",ear2="Amini Earring +1",
		body="Amini Caban +3",hands="Malignance Gloves",ring1="Ephramad's ring",ring2="Regal Ring",
		back=BelenusCrit,waist="Fotia belt",legs="Ikenga's Trousers",feet="Amini Bottillons +3"} 

	sets.precast.WS["Jishnu's Radiance"].UncappedAtt = {
		head="Orion beret +3",neck="Fotia Gorget",ear1="Odr Earring",ear2="Amini Earring +1",
		body="Amini Caban +3",hands="Amini Glove. +3",ring1="Ephramad's ring",ring2="Regal Ring",
		back=BelenusCrit,waist="Fotia belt",legs="Nyame Flanchard",feet="Amini Bottillons +3"} 
		
	sets.precast.WS["Jishnu's Radiance"].Acc = set_combine(sets.precast.WS["Jishnu's Radiance"], {head="Orion beret +3",legs="Arcadian braccae +3"})

    sets.precast.WS['Wildfire'] = {
        head="Nyame Helm",neck="Scout's gorget +2",ear1="Friomisi earring",ear2="Hecate's Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir ring",
        back=BelenusMABWSD,waist="Eschan stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Wildfire'].Acc = {
        head="Nyame Helm",neck="Scout's gorget +2",ear1="Friomisi earring",ear2="Hecate's Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir ring",
        back=BelenusMABWSD,waist="Eschan stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Trueflight'] = {
        head="Nyame Helm",neck="Scout's gorget +2",ear1="Moonshade Earring",ear2="Friomisi earring",
        body="Nyame Mail",hands="Nyame gauntlets",ring1="Weather. Ring",ring2="Dingir ring",
        back=BelenusMABWSD,waist="Eschan stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Trueflight'].Acc = {
        head="Nyame Helm",neck="Scout's gorget +2",ear1="Moonshade Earring",ear2="Friomisi earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Weather. Ring",ring2="Dingir ring",
        back=BelenusMABWSD,waist="Eschan stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Hot Shot'] = {
		head="Nyame Helm",neck="Fotia gorget",ear1="Moonshade Earring",ear2="Amini Earring +1",
		body="Nyame Mail",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=BelenusMABWSD,waist="Fotia belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Flaming Arrow'] = {
		head="Nyame Helm",neck="Fotia gorget",ear1="Moonshade Earring",ear2="Amini Earring +1",
		body="Nyame Mail",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=BelenusMABWSD,waist="Fotia belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Aeolian Edge'] = {
        body="Nyame Mail",neck="Sybil Scarf",ear1="Moonshade Earring",ear2="Friomisi earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Shiva ring +1",
        back=BelenusMABWSD,waist="Eschan stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.precast.WS['Evisceration'] = {
		head="Adhemar bonnet +1",
		neck="Fotia gorget",
		ear1="Odr earring",
		ear2="Amini earring +1",
		body="Amini Caban +3",
		hands="Adhemar Wrist. +1", 
		ring1="Ephramad's Ring",
		ring2="Epona's Ring",
		back=BelenusCrit,
		waist="Fotia belt",
		legs="Jokushu Haidate",
		feet="Thereoid greaves"}

    sets.precast.WS['Exenterator'] = sets.precast.WS
	
	sets.precast.WS['Savage Blade'] = {
		head="Orion beret +3", -- nyame R25
		neck="Scout's gorget +2",
		ear1="Moonshade earring",
		ear2="Amini earring +1",
		body="Ikenga's Vest", 
		hands="Nyame Gauntlets", 
		ring1="Ephramad's ring",
		ring2="Epaminondas's Ring",
		back=BelenusSTRWSD,
		waist="Sailfi belt +1",
		legs="Nyame Flanchard",
		feet="Amini bottillons +3"
	}

	sets.precast.WS['Savage Blade'].UncappedAtt = {
		head="Orion beret +3", -- nyame R25
		neck="Rep. Plat. Medal",
		ear1="Moonshade earring",
		ear2="Amini earring +1",
		body="Nyame Mail", 
		hands="Nyame Gauntlets", 
		ring1="Ephramad's ring",
		ring2="Regal Ring",
		back=BelenusSTRWSD,
		waist="Sailfi belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}
	
	sets.precast.WS['Decimation'] = {
		head="Nyame helm",
		neck="Scout's gorget +2",
		ear1="Sherida earring",
		ear2="Amini earring +1",
		body="Amini Caban +3", 
		hands="Adhemar Wrist. +1", 
		ring1="Ephramad's ring",
		ring2="Epona's ring",
		back=BelenusSTRWSD,
		waist="Fotia belt",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
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
        head="Carmine Mask +1",neck="Voltsurge torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Weather. Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Flume belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
		
	-- Ranged sets
	--sets.midcast.RA["Your weapon name here"] = {}
	--sets.midcast.RA["Your weapon name here"].AM = {}
	--sets.buff["Double Shot"]["Your weapon name here"] = {}
	--sets.buff["Double Shot"]["Your weapon name here"].AM = {}

	-- Look at ranged STP sets for each weapon

    sets.midcast.RA = {
		head="Arcadian beret +3",neck="Scout's gorget +2",ear1="Dedition earring",ear2="Telos Earring",
		body="Ikenga's Vest",hands="Amini Glove. +3",ring1="Ephramad's ring",ring2="Ilabrat ring",
		back=BelenusSTP,waist="Yemaya belt",legs="Amini Bragues +3",feet="Ikenga's Clogs" } 
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,{waist="Kwahu Kachina belt +1",ring1="Crepuscular ring",ear1="Crepuscular earring"})

	sets.midcast.RA["Gastraphetes"] = {
		head="Arcadian beret +3",neck="Scout's gorget +2",ear1="Dedition earring",ear2="Telos Earring",
		body="Ikenga's Vest",hands="Amini Glove. +3",ring1="Chirich Ring +1",ring2="Crepuscular ring",
		back=BelenusSTP,waist="Yemaya belt",legs="Amini Bragues +3",feet="Malignance Boots" }
		
	sets.midcast.RA["Gastraphetes"].Acc = set_combine(sets.midcast.RA["Gastraphetes"], {waist="Kwahu Kachina belt +1",ring1="Crepuscular ring",ear1="Crepuscular earring"})
	
	sets.midcast.RA["Armageddon"] = {
		head="Arcadian beret +3",neck="Scout's gorget +2",ear1="Dedition earring",ear2="Telos Earring",
		body="Ikenga's Vest",hands="Amini Glove. +3",ring1="Ephramad's ring",ring2="Ilabrat ring", 
		back=BelenusSTP,waist="Yemaya belt",legs="Amini Bragues +3",feet="Ikenga's Clogs" } 

	sets.midcast.RA["Armageddon"].AM = {
		head="Meghanada visor +2",neck="Scout's gorget +2",ear1="Odr earring",ear2="Amini Earring +1",
        body="Nisroch Jerkin",hands="Mummu wrists +2",ring1="Ephramad's ring",ring2="Ilabrat ring",
        back=BelenusCrit,waist="Kwahu Kachina belt +1",legs="Amini Bragues +3",feet="Oshosi leggings +1"} 

	-- sets.buff["Double Shot"]["Armageddon"].AM = { -- THIS SET DOESN"T WORK, SYNTAX IS WRONG
	-- 	head="Meghanada visor +2",neck="Scout's gorget +2",ear1="Odr earring",ear2="Amini Earring +1",
    --     body="Arcadian Jerkin +3",hands="Oshosi gloves +1",ring1="Ephramad's ring",ring2="Ilabrat ring", 
    --     back=BelenusCrit,waist="Kwahu Kachina belt +1",legs="Oshosi trousers +1",feet="Oshosi leggings +1"} 

	-- sets.midcast.RA["Armageddon"].TrueShot.AM = {
	-- 	head="Meghanada visor +2",neck="Scout's gorget +2",ear1="Odr earring",ear2="Amini Earring +1",
	-- 	body="Nisroch Jerkin",hands="Mummu wrists +2",ring1="Ephramad's ring",ring2="Ilabrat ring",
	-- 	back=BelenusCrit,waist="Tellen belt",legs="Amini Bragues +3",feet="Ikenga Clogs"} 

	sets.midcast.RA.Crit = {
		head="Meghanada visor +2",neck="Scout's gorget +2",ear1="Odr earring",ear2="Amini Earring +1",
        body="Nisroch Jerkin",hands="Mummu wrists +2",ring1="Begrudging Ring",ring2="Ilabrat ring", 
        back=BelenusCrit,waist="Kwahu Kachina belt +1",legs="Amini Bragues +3",feet="Oshosi leggings +1"} 

	sets.midcast.RA["Gandiva"] = {
		head="Arcadian beret +3",neck="Scout's gorget +2",ear1="Dedition earring",ear2="Telos Earring",
		body="Ikenga's Vest",hands="Amini Glove. +3",ring1="Ephramad's ring",ring2="Ilabrat ring", 
		back=BelenusSTP,waist="Yemaya belt",legs="Amini Bragues +3",feet="Ikenga's Clogs" } 
	
		
	sets.midcast.RA["Gandiva"].AM = {
		head="Meghanada visor +2",neck="Scout's gorget +2",ear1="Odr Earring",ear2="Amini Earring +1",
        body="Nisroch Jerkin",hands="Mummu wrists +2",ring1="Ephramad's ring",ring2="Ilabrat ring",
        back=BelenusCrit,waist="Kwahu Kachina belt +1",legs="Amini Bragues +3",feet="Oshosi leggings +1"} 

	-- sets.buff["Double Shot"]["Gandiva"].AM = { -- THIS SET DOESN"T WORK, SYNTAX IS WRONG
	-- 	head="Meghanada visor +2",neck="Scout's gorget +2",ear1="Odr earring",ear2="Amini Earring +1",
	-- 	body="Arcadian Jerkin +3",hands="Oshosi gloves +1",ring1="Ephramad's ring",ring2="Ilabrat ring", 
	-- 	back=BelenusCrit,waist="Kwahu Kachina belt +1",legs="Oshosi trousers +1",feet="Oshosi leggings +1"}

	-- sets.midcast.RA["Gandiva"].TrueShot.AM = {
	-- 	head="Meghanada visor +2",neck="Scout's gorget +2",ear1="Odr earring",ear2="Amini Earring +1",
	-- 	body="Nisroch Jerkin",hands="Mummu wrists +2",ring1="Ephramad's ring",ring2="Ilabrat ring",
	-- 	back=BelenusCrit,waist="Tellen belt",legs="Amini Bragues +3",feet="Ikenga Clogs"}
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {body="Orion Jerkin +3"}
	sets.buff.Camouflage.Acc = {body="Orion Jerkin +3"}
	sets.buff['Double Shot'] = {body="Arcadian jerkin +3", hands="Oshosi gloves +1", legs="Oshosi trousers +1", feet="Oshosi leggings +1"}
	sets.buff['Double Shot'].Acc = {body="Arcadian jerkin +3", hands="Oshosi gloves +1", legs="Oshosi trousers +1", feet="Oshosi leggings +1"}
	sets.buff.Barrage = {hands="Orion Bracers +3"}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {
		head="Nyame helm",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Carrier's Sash",legs="Nyame flanchard",feet="Nyame sollerets"}
		
	sets.idle.PDT = {
		head="Nyame helm",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Carrier's Sash",legs="Nyame flanchard",feet="Nyame sollerets"}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Nyame helm",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Carrier's Sash",legs="Nyame flanchard",feet="Nyame sollerets"}

    sets.defense.MDT = {
		head="Nyame helm",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Carrier's Sash",legs="Nyame flanchard",feet="Nyame sollerets"}
		
    sets.defense.MEVA = {
        head="Nyame helm",neck="Loricate torque +1",ear1="Sherida earring",ear2="Telos Earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Chirich Ring +1",
		back="Moonbeam cape",waist="Carrier's Sash",legs="Nyame flanchard",feet="Nyame sollerets"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Fomalhaut = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Annihilator = {main="Perun +1",sub="Nusku Shield",range="Annihilator"}
	sets.weapons.Armageddon = {main="Oneiros Knife",sub="Nusku Shield",range="Armageddon"}
	sets.weapons.Gandiva = {main="Oneiros Knife",sub="Nusku Shield",range="Gandiva"}
	sets.weapons.Gastraphetes = {main="Malevolence",sub="Nusku Shield",range="Gastraphetes"}
	sets.weapons.DualFomalhaut = {main="Perun +1",sub="Kustawi +1",range="Fomalhaut"}
	sets.weapons.DualArmageddon = {main="Gleti's Knife",sub="Oneiros Knife",range="Armageddon"}
	sets.weapons.DualAnnihilator = {main="Perun +1",sub="Kustawi +1",range="Annihilator"}
	sets.weapons.DualGandiva = {main="Gleti's Knife",sub="Oneiros Knife",range="Gandiva"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Sparrowhawk +2"}
	sets.weapons.DualEviscerationWeapons = {main="Tauret",sub="Blurred Knife +1",range="Sparrowhawk +2"}
	sets.weapons.DualGastraphetes = {main="Malevolence",sub="Malevolence",range="Gastraphetes"}
	sets.weapons.DualAeolian = {main="Malevolence",sub="Malevolence",range="Sparrowhawk +2",ammo="Hauksbok Arrow"}
	sets.weapons.DualSC = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		head="Malignance Chapeau",neck="Iskur gorget",ear1="Dedition earring",ear2="Telos Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Chirich Ring +1",ring2="Petrov Ring",
        back=BelenusMelee,waist="Sailfi belt +1",legs="Malignance tights",feet="Malignance boots"}
    
    sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Lissome necklace",ear1="Dedition earring",ear2="Telos Earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Chirich Ring +1",ring2="Petrov Ring",
        back=BelenusMelee,waist="Sailfi belt +1",legs="Malignance tights",feet="Malignance boots"}
	
    sets.engaged.DT = {
		head="Malignance Chapeau",neck="Iskur gorget",ear1="Sherida earring",ear2="Telos Earring",
		body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=BelenusMelee,waist="Sailfi belt +1",legs="Malignance tights",feet="Malignance boots"}

    sets.engaged.DW = {
		head="Malignance chapeau",neck="Iskur gorget",ear1="Sherida earring",ear2="Telos Earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back=BelenusMelee,waist="Patentia sash",legs="Malignance tights",feet="Malignance boots"}
		
    sets.engaged.DW.DT = {
		head="Malignance Chapeau",neck="Iskur gorget",ear1="Eabani Earring",ear2="Telos Earring", -- should be Suppanomimi instead of Eabani
		body="Malignance Tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=BelenusMelee,waist="Patentia sash",legs="Malignance tights",feet="Malignance boots"}
    
    sets.engaged.DW.Acc = {
		head="Malignance chapeau",neck="Iskur gorget",ear1="Sherida earring",ear2="Telos Earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back=BelenusMelee,waist="Patentia sash",legs="Malignance tights",feet="Malignance boots"}

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

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'aeolian' then
		send_command('gs c weapons DualAeolian;gs c update')
				add_to_chat(158,'Aeolian weapon set equiped')
	elseif commandArgs[1]:lower() == 'ddweapons' then
		send_command('gs c weapons DualSavageWeapons;gs c update')
				add_to_chat(158,'Savage weapon set equiped')
	elseif commandArgs[1]:lower() == 'magicweapons' then
		send_command('gs c weapons DualGastraphetes;gs c update')
				add_to_chat(158,'Magic weapon sets equiped')
	elseif commandArgs[1]:lower() == 'skillchainweapons' then
		send_command('gs c weapons DualSC;gs c update')
				add_to_chat(158,'Magic weapon sets equiped')
	elseif commandArgs[1]:lower() == 'rangedweapons' then
		send_command('gs c weapons DualRanged;gs c update')
				add_to_chat(158,'Ranged weapon sets equiped')
	end
end