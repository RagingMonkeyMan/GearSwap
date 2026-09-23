function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc') 
	state.HybridMode:options('DT','Normal','MEVA','SubBlow')
    state.WeaponskillMode:options('Match','AttUnCap','PDL','Acc','Proc')
    state.CastingMode:options('Normal','Resistant','Fodder')
    state.IdleMode:options('Normal','Evasion')
	state.Weapons:options('Savage','Magic', 'Maxentius' ,'SavageAcc','Learning','None') --'Tizalmace','Tizbron','TizSak', ,'MagicWeapons','CJ_SET',

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	autows = 'Expiacion'

	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}} -- fix later
		
	BLUCapeWSD={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}} -- done
	BLUCapeCrit={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}} -- {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}} -- done
	BLUCapeNuke={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+5','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}} -- need 5 more INT
	BLUCapeDW= { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}} --{name="Rosmerta's Cape", augments ={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	BLUCapeCure="Solemnity cape" --{name="Rosmerta's Cape", augments ={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Cure" potency +10%','Phys. dmg. taken-10%',}} -- done
	BLUCapeSTP={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}} -- done
	BLUCapeReqWSD={name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}} -- need (fix to below when cape made) - STR to MND
	BLUCapeDA={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}} -- NEED (as below)
	--BLUCapeDA={name = "Rosmerta's Cape", augments = {'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}} -- NEED
	BLUCapeMEVA={name="Rosmerta's Cape", augments ={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Haste+10','Mag. Evasion+15'}} -- done
	
	CarmineMaskFC = {name = "Carmine Mask +1", augments = {'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}
	
	HercTAFeet ={name="Herculean Boots", augments={'Accuracy+20 Attack+20','"Triple Atk."+3','STR+1','Attack+10',}}
	HercWSDFeet ={ name="Herculean Boots", augments={'Attack+20','Weapon skill damage +4%','DEX+3','Accuracy+13',}}
	HercFeetCrit={name="Herculean Boots", augments={'Attack+20','Crit. hit damage +5%','STR+3',}}
	
	HercWSDHead ={ name="Herculean Helm", augments={'Accuracy+17','Weapon skill damage +4%','STR+7','Attack+9',}}
		
	Thead={ name="Taeon Chapeau", augments={'"Fast Cast"+5','Phalanx +2',}}
    Tbody={ name="Taeon Tabard", augments={'DEF+9','"Fast Cast"+5','Phalanx +3',}}
    Thands={ name="Taeon Gloves", augments={'"Fast Cast"+5','Phalanx +3',}}
    Tlegs={ name="Taeon Tights", augments={'"Fast Cast"+5','Phalanx +3',}}
    Tfeet={ name="Taeon Boots", augments={'"Fast Cast"+5','Phalanx +2',}}
	
	AdhemFeetB ={name="Adhe. Gamashes +1", augments={'STR+12','DEX+12','Attack+20',}}
	
	SR1={name="Stikini Ring +1", bag="Wardrobe2"}
	SR2={name="Stikini Ring +1", bag="Wardrobe3"}
	
	gear.obi_cure_waist = "Luminary Sash"
	gear.obi_nuke_waist = "Yamabuki-no-Obi"
	gear.obi_cure_back = "Tempered Cape +1"

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +2"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +2"} -- +3
	sets.buff.Convergence = {head="Luh. Keffiyeh +3"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +3"}
	sets.buff.Enchainment = {body="Luhlaza Jubbah +3"}
	sets.buff.Efflux = {legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- come back to this set
	--sets.HPDown = {}

	-- Precast Sets

	-- Precast sets to enhance JAs -- DONE
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +3"}

	-- Fast cast sets for spells
	-- XX% FC + 15% if RDM SUB -- Tier III with Erratic Flutter and 1200JP is another 20%
	-- So 60 FC for non-RDM and 45FC for RDM Required
	-- Current: 58
	sets.precast.FC = {
		ammo="Sapience Orb", -- 2                   -- 0
		head="Carmine Mask +1", -- 14				-- 14
		neck="Voltsurge Torque", -- 4				-- 4
		ear1="Cryptic earring", -- 0			-- 0 (not given)
		ear2="Loquac. Earring", -- 2				-- 2
		body="Pinga Tunic", -- 13 Mintan +1 (14)		-- 9
		hands="Leyline Gloves", -- 8				-- 6
		ring1="Weatherspoon ring", -- 5 				-- 4
		ring2="Gelatinous ring +1",	-- 0			-- 0
		back="Fi follet Cape +1", -- 10     			-- 0
		waist="Austerity Belt +1", -- 0				-- 2 (witful)	
		legs="Aya. Cosciales +2", -- 6				-- 7 (psycloth lappas path D)
		feet="Carmine Greaves +1"} -- 8				-- 8

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"}) -- DONE

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +2"}) -- DONE


	-- WS Default Set
	sets.precast.WS = {
		ammo="Oshasha's Treatise", 
		head="Nyame Helm",
		neck ="Mirage Stole +2",
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets", 
		ring1="Ephramad's ring",
		ring2="Epaminondas's Ring",
		back=BLUCapeWSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"
	}

	sets.precast.WS.Proc = {ammo="Sapience Orb", -- 2                   -- 0
	head="Carmine Mask +1", -- 14				-- 14
	neck="Voltsurge Torque", -- 4				-- 4
	ear1="Cryptic earring", -- 0			-- 0 (not given)
	ear2="Loquac. Earring", -- 2				-- 2
	body="Pinga Tunic", -- 13 Mintan +1 (14)		-- 9
	hands="Leyline Gloves", -- 8				-- 6
	ring1="Weatherspoon ring", -- 5 				-- 4
	ring2="Gelatinous ring +1",	-- 0			-- 0
	back="Fi follet Cape +1", -- 10     			-- 0
	waist="Austerity Belt +1", -- 0				-- 2 (witful)	
	legs="Aya. Cosciales +2", -- 6				-- 7 (psycloth lappas path D)
	feet="Carmine Greaves +1"} -- 8				-- 8

	-- Specific WS Sets
	sets.precast.WS['Requiescat'] = {-- DONE
				ammo="Quartz Tathlum +1",
				head="Luh. Keffiyeh +3", 
				neck="Fotia Gorget",
				ear1="Regal Earring",
				ear2="Brutal Earring",
				body="Luhlaza Jubbah +3",
				hands="Adhemar Wrist. +1",  -- ATT
				ring1="Epona's Ring",
				ring2="Rufescent Ring",
				back=BLUCapeWSD,
				waist="Fotia Belt",
				legs="Luhlaza Shalwar +3",
				feet="Luhlaza Charuqs +3"}
	
	sets.precast.WS['Requiescat'].AttUnCap = {-- DONE
				ammo="Quartz Tathlum +1",
				head="Luh. Keffiyeh +3", 
				neck="Fotia Gorget",
				ear1="Regal Earring",
				ear2="Brutal Earring",
				body="Luhlaza Jubbah +3",
				hands="Adhemar Wrist. +1",  -- ATT
				ring1="Epona's Ring",
				ring2="Rufescent Ring",
				back=BLUCapeWSD,
				waist="Fotia Belt",
				legs="Luhlaza Shalwar +3",
				feet="Luhlaza Charuqs +3"}
				
	sets.precast.WS['Requiescat'].AttCap = set_combine(sets.precast.WS['Requiescat'].AttUnCap, {head="Carmine Mask +1"})
	
	sets.precast.WS['Requiescat'].Acc = {
        ammo = "Falcon Eye",
        head = "Carmine Mask +1",
        neck = "Fotia Gorget",
        ear1 = "Regal Earring",
        ear2 = "Brutal Earring",
        body = "Nyame Mail",
		hands = "Nyame Gauntlets",
        ring1 = "Epona's ring",
        ring2 = "Rufescent Ring",
        back = BLUCapeDA,
        waist = "Fotia Belt",
        legs = "Nyame Flanchard",
        feet = "Assim. Charuqs +2" -- +3
    }
	
	--sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS['Requiescat'].AttCap, {}) -- COMEBACK
	
--	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
--	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
--	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
--	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
--	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = {
		ammo="Crepuscular pebble", 
		head="Adhemar Bonnet +1", 
		neck ="Mirage Stole +2", 
		ear1="Odr Earring",
		ear2="Cessance Earring",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",  
		ring1="Begrudging Ring",
		ring2="Ilabrat Ring",
		back=BLUCapeCrit,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	}
	
	sets.precast.WS['Chant du Cygne'].AttUnCap = {
		ammo="Crepuscular pebble", 
		head="Adhemar Bonnet +1", 
		neck ="Mirage Stole +2", 
		ear1="Odr Earring",
		ear2="Cessance Earring",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",  
		ring1="Begrudging Ring",
		ring2="Ilabrat Ring",
		back=BLUCapeCrit,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	}
	
	sets.precast.WS['Chant du Cygne'].AttCap = set_combine(sets.precast.WS['Chant du Cygne'].AttUnCap, {feet = "Gleti's Boots"})
	
	sets.precast.WS['Chant du Cygne'].Acc = {
		ammo="Crepuscular pebble", 
		head="Adhemar Bonnet +1", 
		neck ="Mirage Stole +2", 
		ear1="Odr Earring",
		ear2="Cessance Earring",
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",  
		ring1="Begrudging Ring",
		ring2="Ilabrat Ring",
		back=BLUCapeCrit,
		waist="Fotia Belt",
		legs="Gleti's Breeches",
		feet="Gleti's Boots"
	}	
		
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS['Chant du Cygne'].AttCap, {})  -- COMEBACK
		
	sets.precast.WS['Savage Blade'] = {
		ammo="Oshasha's Treatise", 
		head="Nyame Helm", -- empy +3
		neck ="Mirage Stole +2", 
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets", 
		ring1="Ephramad's ring",
		ring2="Epaminondas's Ring",
		back=BLUCapeWSD,
		waist="Sailfi Belt +1",
		legs="Luhlaza Shalwar +3",
		feet="Nyame Sollerets"}
	
	sets.precast.WS['Savage Blade'].AttUnCap = {
		ammo="Oshasha's Treatise", 
		head="Nyame Helm", -- empy +3
		neck ="Rep. Plat. Medal", 
		ear1="Moonshade Earring",
		ear2="Ishvara Earring",
		body="Nyame Mail",
		hands="Nyame Gauntlets", 
		ring1="Ephramad's ring",
		ring2="Epaminondas's Ring",
		back=BLUCapeWSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard", 
		feet="Nyame Sollerets"}
	
	sets.precast.WS['Savage Blade'].AttCap = set_combine(sets.precast.WS['Savage Blade'].AttUnCap, {ammo = "Crepuscular Pebble", body="Gleti's Cuirass"})
	
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'].AttUnCap, {
		ear2 = "Regal Earring", 
		body = "Assim. Jubbah +3",
	})
			
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS['Savage Blade'].AttUnCap, {})
	
	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Expiacion'].AttUnCap = set_combine(sets.precast.WS['Savage Blade'].AttUnCap, {})
	sets.precast.WS['Expiacion'].AttCap = set_combine(sets.precast.WS['Savage Blade'].AttCap, {})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS['Savage Blade'].Acc, {})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS['Savage Blade'].DT, {})
	

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS['Savage Blade'], {})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS['Expiacion'], {})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS['Expiacion'].Acc, {})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Judgment'] = sets.precast.WS['Savage Blade']

    sets.precast.WS['Judgment'].AttackUncap = set_combine(sets.precast.WS['Savage Blade'].AttackUncap, {})
	
    sets.precast.WS['Judgment'].AttackCap = set_combine(sets.precast.WS['Savage Blade'].AttackCap, {})

    sets.precast.WS['Judgment'].Acc = set_combine(sets.precast.WS['Savage Blade'].Acc, {})
    
    sets.precast.WS['Black Halo'] = sets.precast.WS['Savage Blade']

    sets.precast.WS['Black Halo'].AttackUncap = {
        ammo = "Aurgelmir Orb +1",
        head = "Nyame Helm",
        neck = "Mirage Stole +2",
        ear1 = "Moonshade Earring",
        ear2 = "Regal Earring",
        body = "Nyame Mail",
        hands = "Nyame Gauntlets",
        ring1 = "Ephramad's ring",
		ring2 = "Epaminondas's Ring",
        back = BLUCapeWSD,
        waist = "Sailfi Belt +1",
        legs = "Nyame Flanchard",
        feet = "Nyame Sollerets"
    }
    
    sets.precast.WS['Black Halo'].AttackCap = set_combine(sets.precast.WS['Black Halo'].Attack, {})
	
    sets.precast.WS['Black Halo'].Acc = set_combine(sets.precast.WS['Black Halo'].Attack, {})
    
    sets.precast.WS['Realmrazer'] = sets.precast.WS['Requiescat']

    sets.precast.WS['Realmrazer'].AttackUncap = {
        ammo = "Quartz Tathlum +1",
        head = "Luhlaza Keffiyeh +3",
        neck = "Fotia Gorget",
        ear1 = "Regal Earring",
        ear2 = "Telos Earring",
        body = "Luhlaza Jubbah +3",
        hands = "Nyame Gauntlets",
        ring1 = "Stikini Ring +1",
        ring2 = "Rufescent Ring",
        back = BLUCapeWSD,
        waist = "Fotia Belt",
        legs = "Nyame Flanchard",
        feet = "Luhlaza Charuqs +3"
    }
	
	sets.precast.WS['Realmrazer'].AttackCap = set_combine(sets.precast.WS['Realmrazer'].Attack, {})

    sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS['Realmrazer'].Attack, {})

	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
			         head="Pixie Hairpin +1",neck="Sibyl Scarf",ear1="Regal Earring",ear2="Friomisi Earring",
		             body="Nyame Mail",hands="Nyame Gauntlets",ring1="Shiva ring +1",ring2="Archon Ring",
			         back=BLUCapeNuke,waist="Orpheus's Sash",legs="Luhlaza Shalwar +3",feet="Nyame Sollerets"}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=BLUCapeNuke})

	sets.precast.WS['Flash Nova'] = { 
		ammo = "Pemphredo Tathlum",
		head = "Nyame Helm",
		neck = "Sibyl Scarf",
		ear1 = "Regal Earring",
		ear2 = "Friomisi Earring",
		body = "Nyame Mail",
		hands = "Nyame Gauntlets",
		ring1 = "Weatherspoon ring",
		ring2 = "Metamorph Ring +1",
		back = BLUCapeNuke,
		waist = "Sacro Cord",
		legs = "Luhlaza Shalwar +3", 
		feet = "Nyame Sollerets"
	}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {back=BLUCapeNuke})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = set_combine(sets.precast.FC, {})

	sets.midcast['Blue Magic'] = set_combine(sets.midcast.FastRecast, {body="Hashishin Mintan +2"})

	-- Physical Spells -- THINK ALL DONE

	sets.midcast['Blue Magic'].Physical = {
		ammo="Aurgelmir Orb +1",
		head="Luh. Keffiyeh +3",
		neck="Mirage Stole +2",
		ear1 = "Mache Earring +1",
        ear2 = "Odnowa Earring +1",
        body = "Assim. Jubbah +3",
		hands="Adhemar Wrist. +1", -- ATT
		ring1="Ifrit Ring +1",
		ring2 = "Shukuyu Ring",
		back=BLUCapeWSD,
		waist="Sailfi Belt +1",
		legs = "Gleti's Breeches",
		feet="Luhlaza Charuqs +3",
		}

	sets.midcast['Blue Magic'].Physical.Resistant = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].Physical.Fodder = set_combine(sets.midcast['Blue Magic'].Physical, {})
	
	sets.midcast['Blue Magic'].PhysicalAcc = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {
        ear2="Mache Earring +1",
        ring2="Ilabrat Ring",
        back=gear.BLU_WS1_Cape,
        waist="Grunfeld Rope",
        })
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {ear2="Mache Earring +1",
        ring2="Ilabrat Ring",
        back=gear.BLU_WS1_Cape,
        waist="Grunfeld Rope",
        })
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {ear2="Mache Earring +1",
        ring2="Ilabrat Ring",
        back=gear.BLU_WS1_Cape,
        waist="Grunfeld Rope",
        })	
		
	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
		
	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {ring2="Ilabrat Ring"})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {ring2="Ilabrat Ring"})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {ring2="Ilabrat Ring"})
		
	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {
		ammo="Ghastly Tathlum +1",
        ear2="Regal Earring",
        ring1="Shiva Ring +1",
        ring2="Metamor. Ring +1",
        back="Aurist's Cape +1",
        waist="Acuity Belt +1",
        })
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalInt, {
		ammo="Ghastly Tathlum +1",
        ear2="Regal Earring",
        ring1="Shiva Ring +1",
        ring2="Metamor. Ring +1",
        back="Aurist's Cape +1",
        waist="Acuity Belt +1",
        })
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].PhysicalInt, {
		ammo="Ghastly Tathlum +1",
        ear2="Regal Earring",
        ring1="Shiva Ring +1",
        ring2="Metamor. Ring +1",
        back="Aurist's Cape +1",
        waist="Acuity Belt +1",
        })
		
	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {
        ear2="Regal Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        back="Aurist's Cape +1",
        })
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical, {
        ear2="Regal Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        back="Aurist's Cape +1",
        })
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical, {
        ear2="Regal Earring",
        ring1={name="Stikini Ring +1", bag="wardrobe3"},
        ring2={name="Stikini Ring +1", bag="wardrobe4"},
        back="Aurist's Cape +1",
        })

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {ear1="Regal Earring", ear2="Enchntr. Earring +1"})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical, {ear1="Regal Earring", ear2="Enchntr. Earring +1"})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical, {ear1="Regal Earring", ear2="Enchntr. Earring +1"})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {
		ammo="Ghastly Tathlum +1",
		head="Hashishin Kavuk +2",
		neck="Sibyl Scarf",
		ear1="Friomisi Earring",
		ear2="Regal Earring",
		body="Hashishin Mintan +2",
		hands="Hashishin Bazubands +2",
		ring1="Metamor. Ring +1",
		ring2="Shiva Ring +1",
		back=BLUCapeNuke,
		waist="Orpheus Sash", 
		legs = "Luhlaza Shalwar +3",
		feet="Hashishin basmak +2",}

	sets.midcast['Blue Magic']['Tenebral Crush'] = set_combine(sets.midcast['Blue Magic'].Magical, {
		head = "Pixie Hairpin +1",
		body = "Hashishin Mintan +2",
		ring2 = "Archon Ring"
	})

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{
		legs="Luhlaza Shalwar +3",
		neck="Incanter's Torque",
		})

	--done
	sets.midcast['Blue Magic'].Magical.Fodder = set_combine(sets.midcast['Blue Magic'].Magical, {})

	--done
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring2=SR2})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	--Fix back --DONE
	sets.midcast['Blue Magic'].MagicAccuracy = {
		ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",
		neck="Mirage Stole +2",
		ear1 = "Regal Earring",
        ear2 = "Digni. Earring",
        body = "Luhlaza Jubbah +3",
		hands = "Nyame Gauntlets",
		ring1="Metamor. Ring +1",
		ring2=SR2,
		back="Aurist's Cape +1",
		waist = "Luminary Sash",
        legs = "Ayanmo Cosciales +2",
        feet = "Carmine Greaves +1"
		}

	--DONE
	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {})

	--DONE
	sets.midcast['Dark Magic'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {})
	
	--DONE
	sets.midcast['Enhancing Magic'] = {
        ammo = "Pemphredo Tathlum",
        head = "Telchine Cap",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Magnetic Earring",
        body = "Telchine Chasuble",
        hands = "Shrieker's Cuffs",
        ring1 = "Kishar Ring",
		ring2 = SR2,
        back = "Fi Follet Cape",
        waist = "Hachirin-no-Obi",
        legs = "Carmine Cuisses +1",
        feet = "Carmine Greaves +1"
    }
		
	--Need Sapience Orb and duskdim stones to get +2 to +3 phalanx
	sets.midcast['Phalanx'] = {
        ammo = "Pemphredo Tathlum",
		head = Thead, -- herc DM Aug +5
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Enchntr. Earring +1",
		body = Tbody, -- herc DM Aug +5
        hands = Thands, -- herc DM Aug +5
		ring1 = "Kishar Ring",
		ring2 = SR2,
        back="Fi Follet Cape",
		waist= "Hachirin-no-Obi",
		legs = Tlegs, -- herc DM Aug +5
		feet = Tfeet, -- herc DM Aug +5
    }

	--DONE
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	--DONE
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",neck = "Loricate Torque +1", waist = "Emphatikos Rope",legs="Shedir Seraweels"})

	--DONE
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})

	--DONE
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {
		ammo = "Pemphredo Tathlum",
        head = "Carmine Mask +1",
        neck = "Incanter's Torque",
        ear1 = "Andoaa Earring",
        ear2 = "Magnetic Earring", -- NO
        body = "Telchine Chasuble",
        hands = "Shrieker's Cuffs",
        ring1 = "Kishar Ring",
		ring2 = SR2,
        back = "Fi Follet Cape",
        waist = "Hachirin-no-Obi",
        legs = "Shedir Seraweels",
        feet = "Carmine Greaves +1"
	})
	
	--DONE
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--DONE
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Blue Magic'].MagicAccuracy, {})

	--DONE
	sets.midcast['Elemental Magic'] = set_combine(sets.midcast['Blue Magic'].Magic, {})

	--DONE
	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Blue Magic'].Magical.Resistant, {})

	--DONE
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {} --ring2="Weatherspoon Ring"

	--fix gloves/feet -- DONE
	sets.midcast.Cure = {
		ammo = "Quartz Tathlum +1",
        head = "Carmine Mask +1",
        neck = "Phalaina Locket", --4
        ear1 = "Mendicant's Earring", --5
        ear2 = "Regal Earring",
        body = "Pinga Tunic", --13
        hands = "Telchine Gloves", --10
        ring1 = "Stikini Ring",
        ring2 = "Metamorph Ring +1",
        back = BLUCapeCure, --10
        waist = "Luminary Sash",
        legs = "Pinga Pants",
        feet = "Medium's Sabots"} --11


--	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
--		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt"})

	-- Breath Spells --

	--COMEBACK
	sets.midcast['Blue Magic'].Breath = {ammo="Mavi Tathlum",
		head="Luh. Keffiyeh +3",neck="Mirage Stole +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="assim. jubbah +3",hands="Luh. Bazubands +3",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Cornflower Cape",legs="Hashishin Tayt +1",feet="Luhlaza Charuqs +3"}

	-- Physical Added Effect Spells most notably "Stun" spells --

	--fix back --DONE
	sets.midcast['Blue Magic'].Stun = {
		ammo = "Pemphredo Tathlum",
        head = "Carmine Mask +1",
        neck = "Mirage Stole +2",
        ear1 = "Regal Earring",
        ear2 = "Dignitary's Earring",
        body = "Luhlaza Jubbah +3",
        hands = "Leyline Gloves",
        ring1 = "Stikini Ring +1",
        ring2 = "Metamorph Ring +1",
        back = "Aurist's Cape +1",
        waist = "Sacro Cord",
        legs = "Luhlaza Shalwar +3",
        feet = "Luhlaza Charuqs +3"}
		
	--fix back --DONE
	sets.midcast['Blue Magic'].Stun.Resistant = {ammo="Pemphredo Tathlum",
		head="Assim. Keffiyeh +2",
		body="Malignance Tabard",
		hands="Malignance Gloves", --need
		legs="Assim. Shalwar +2",
		feet="Malignance Boots",
		neck="Mirage Stole +2",
		waist="Eschan Stone",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring=SR1,
		left_ring=SR2,
		back="Cornflower Cape",}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	--DONE
	sets.midcast['Blue Magic']['White Wind'] = {
		ammo = "Falcon Eye",
        head = "Carmine Mask +1",
        neck = "Phalaina Locket",
        ear1 = "Odnowa Earring +1",
        ear2 = "Etiolation Earring",
        body = "Vrikodara Jupon",
        hands = "Telchine Gloves",
        ring1 = "Kunaji Ring",
        ring2 = "Gelatinous Ring +1",
        back = "Moonlight Cape",
        waist = "Kasiri Belt",
        legs = "Gyve Trousers",
        feet = "Medium's Sabots"}
					
	--DONE				
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic']['Occultation'] = {
		ammo="Sapience Orb", --2%
        head = "Carmine Mask +1", --14%
        neck = "Incanter's Torque", --10 skill
        ear1 = "Loquac. Earring", --2%
        ear2 = "Etiolation Earring", --1%
        body = "Assim. Jubbah +3", --24 skill
        hands = "Hashishin Bazubands +2",
        ring1 = "Kishar Ring", --4%
        ring2 = "Rahab Ring", --2%
        back = "Cornflower cape", --15 skill
        waist = "Witful Belt", --3%
        legs = "Hashishin Tayt +2", --23 skill
        feet = "Luhlaza Charuqs +3" -- 12 skill -- 84 skill, 560 total,  28% FC, if you pick up the +10 DI ear, another stink, and the +2 neck you can go for 600 skill 22% FC.
    }

	--COMEBACK
	sets.midcast['Blue Magic'].Healing = {ammo="Mavi Tathlum",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Etiolation Earring",ear2="Mendi. Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
		back=gear.ElementalCape,waist=gear.ElementalObi,legs="Carmine Cuisses +1",feet="Medium's Sabots"}

	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	--DONE
	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo = "Pemphredo Tathlum", 
        head = "Luhlaza Keffiyeh +3", --17
        neck = "Mirage Stole +2", --20
        ear1 = "Loquac. Earring",
        ear2 = "Etiolation Earring",
        body = "Assim. Jubbah +3", --24
        hands = "Rawhide Gloves", --10
        ring1 = "Kishar Ring",
        ring2 = {"Stikini Ring +1", priortiy = 2}, --8
        back = "Cornflower cape", --15
        waist = "Witful Belt",
        legs = "Hashishin Tayt +1", --23
        feet = "Luhlaza Charuqs +3"} --12 -- 605 total

	--DONE
	sets.midcast['Blue Magic'].Buff = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Gifted Earring",ear2="Loquac. Earring", -- ear1 Njordr (1000domain) but won't help with more shadows
		body="Hashishin Mintan +2",hands="Hashi. Bazu. +1",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Swith Cape +1",waist="Austerity Belt +1",legs="Aya. Cosciales +2",feet={ name="Medium's Sabots", augments={'MP+50','MND+10','"Conserve MP"+7','"Cure" potency +5%',}},}

	--DONE
	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",back="Grapevine Cape",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"} -- done
	--sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +2"}

	-- Resting sets (do later)
--	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Falcon Eye",
--			      head="Rawhide Mask",neck="Loricate Torque +1",ear1="Etiolation Earring", ear2="Ethereal Earring",
--			      body="Jhakri Robe +2",hands=gear.herculean_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
--			      back="Bleating Mantle",waist="Flume Belt +1",legs="Lengo Pants",feet=gear.herculean_refresh_feet}

	-- Idle sets (Review Done)
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Gleti's Mask",
		neck="Loricate Torque +1",
		ear1="Eabani Earring", 
		ear2="Telos Earring", 
		body="Hashishin Mintan +2",
		hands="Gleti's Gauntlets", 
		ring1="Defending ring",
		ring2="Chirich Ring +1",
 		back=BLUCapeSTP, 
		waist="Flume Belt +1", 
		legs="Gleti's Breeches", 
		feet="Gleti's Boots"}

	--[[sets.Idle.Standard = {
        ammo = "Staunch Tathlum +1",
        head = "Gleti's Mask",
        neck = "Loricate Torque +1",
		ear1 = "Brachyura Earring",
        ear2 = "Etiolation Earring",
        body = "Shamash Robe",
        hands = "Gleti's Gauntlets",
        ring1 = "Stikini Ring +1",
        ring2 = "Shneddick Ring +1",
        back =Rosmerta.Cure,
        waist = "Flume Belt",
        legs = "Gleti's Breeches",
        feet = HerculeanFeet.Idle
    }]]--
	
	sets.idle.DDT = {
        ammo = "Staunch Tathlum +1",	
        head = "Malignance Chapeau",
        neck = "Warder's Charm +1",
		ear1 = "Eabani Earring",
        ear2 = "Etiolation Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = {name="Defending ring", priority=2},
        ring2 = "Shadow Ring",
        back = BLUCapeCure,
        waist = "Flume Belt +1",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
    }
	
	sets.idle.Evasion = {
        ammo = "Staunch Tathlum +1",
        head = "Malignance Chapeau",
        neck = "Bathy Choker +1",
		ear1 = "Eabani Earring",
        ear2 = "Infused Earring",
        body = "Malignance Tabard",
        hands = "Malignance Gloves",
        ring1 = {name="Defending ring", priority=2},
        ring2 = "Shneddick Ring +1",
        back = BLUCapeCure,
        waist = "Kasiri Belt",
        legs = "Malignance Tights",
        feet = "Malignance Boots",
    }

	-- Defense sets [ don't use these as locks gear ]
	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt +1",ear1="Eabani earring", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Eabani earring", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {waist="Chaac Belt", legs={ name="Herculean Trousers", augments={'AGI+6','INT+9','"Treasure Hunter"+2','Accuracy+7 Attack+7','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}})
	
	-- Weapons sets
	sets.weapons.Tizalmace = {main="Tizona",sub="Almace"}
	sets.weapons.Tizbron = {main="Tizona",sub="Machaera +2"}
	sets.weapons.TizSak = {main="Tizona", sub="Sakpata's Sword"}
	sets.weapons.Magic = {main="Maxentius",sub="Bunzi's rod"}
	sets.weapons.CJ_SET = {main="Sakpata's Sword",sub="Tizona"}
	sets.weapons.Savage = {main="Naegling",sub="Machaera +2"}
	sets.weapons.SavageAcc = {main="Naegling",sub="Sakpata's Sword"}
    sets.weapons.Learning = {main="Nihility", sub="Wind knife"}
	sets.weapons.Maxentius = {main="Maxentius",sub="Machaera +2"}
--	sets.weapons.Almace = {main="Almace",sub="Sequence"}
--	sets.weapons.Sequence = {main="Sequence",sub="Almace"}
--	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets

----------------------------------------------------------------------------------------------------

	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		ear1="Eabani earring",
		ear2="Brutal Earring",
		body="Adhemar Jacket +1", 
		hands="Adhemar Wrist. +1",  
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back=BLUCapeDA,
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights", 
		feet="Malignance Boots"} 

	sets.engaged.DW = {
		ammo="Coiste Bodhar",
		head="Adhemar Bonnet +1",
		neck="Mirage Stole +2",
		ear1="Telos earring",
		ear2="Brutal Earring",
		body="Adhemar Jacket +1", 
		hands="Adhemar Wrist. +1",  
		ring1="Epona's Ring",
		ring2="Hetairoi Ring",
		back=BLUCapeDA,
		waist="Sailfi belt +1",
		legs="Samnuha Tights", 
		feet="Malignance Boots"} 

	--DONE (fix rest of DW sets)
	sets.engaged.Acc = set_combine(sets.engaged, {
		ammo = "Falcon Eye",
        head = "Dampening Tam",
		body="Adhemar Jacket +1", -- ACC Path one
		hands="Adhemar Wrist. +1",  -- ACC Path one
		ring2 = "Ilabrat Ring",
		waist = "Kentarch Belt +1",
	})

	-- hybrid sets here CONTROL F9
	sets.engaged.DT = set_combine(sets.engaged, {
		head="Malignance Chapeau", 
		body="Malignance Tabard", 
		hands="Malignance Gloves",
		ring2="Defending Ring",
		legs="Malignance Tights", 
		feet="Malignance Boots"})

	sets.engaged.DW.DT = set_combine(sets.engaged.DW, {
		head="Malignance Chapeau", 
		body="Malignance Tabard", 
		hands="Malignance Gloves",
		ring2="Defending Ring",
		legs="Malignance Tights", 
		feet="Malignance Boots"})
				
	sets.engaged.Acc.DT = set_combine(sets.engaged.Acc, {
		head="Malignance Chapeau", 
		body="Malignance Tabard", 
		hands="Malignance Gloves",
		ring2="Defending Ring",
		legs="Malignance Tights", 
		feet="Malignance Boots"})
		
	sets.engaged.MEVA = set_combine(sets.engaged, {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", 
		neck="Warder's Charm +1",
        ear1="Eabani Earring",
        ear2="Regal Earring",
		body="Malignance Tabard", 
		hands="Malignance Gloves",
		ring2="Purity Ring",
        ring1="Shadow Ring",
		back=BLUCapeMEVA,
		waist="Flume Belt +1",
		legs="Malignance Tights", 
		feet="Malignance Boots"})
				
	sets.engaged.Acc.MEVA = set_combine(sets.engaged.Acc, {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau", 
		neck="Warder's Charm +1",
        ear1="Eabani Earring",
        ear2="Regal Earring",
		body="Malignance Tabard", 
		hands="Malignance Gloves",
		ring2="Purity Ring",
        ring1="Shadow Ring",
		back=BLUCapeMEVA,
		waist="Flume Belt +1",
		legs="Malignance Tights", 
		feet="Malignance Boots"})

	sets.engaged.SubBlow = set_combine(sets.engaged, { -- boots in all 4 sets Herc Feet SB piece
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau", 
		neck="Warder's Charm +1",
        ear1="Eabani Earring",
        ear2="Dignitary's Earring",
		body="Malignance Tabard", 
		hands="Malignance Gloves",
		ring2="Defending ring",
        ring1="Chirich Ring +1",
		back=BLUCapeDA,
		waist="Reiki Yotai",
		legs="Malignance Tights", 
		feet="Malignance Boots"})
				
	sets.engaged.Acc.SubBlow = set_combine(sets.engaged.Acc, {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau", 
		neck="Warder's Charm +1",
        ear1="Eabani Earring",
        ear2="Dignitary's Earring",
		body="Malignance Tabard", 
		hands="Malignance Gloves",
		ring2="Defending ring",
        ring1="Chirich Ring +1",
		back=BLUCapeDA,
		waist="Reiki Yotai",
		legs="Malignance Tights", 
		feet="Malignance Boots"})

	sets.Self_Healing = {neck="Sacro Gorget",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}
	--sets.Phalanx_Received = {hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	-- if player.sub_job == 'DNC' then
	-- 	set_macro_page(4, 2)
	-- elseif player.sub_job == 'NIN' then
	-- 	set_macro_page(5, 2)
	-- elseif player.sub_job == 'WAR' then
	-- 	set_macro_page(7, 2)
	-- elseif player.sub_job == 'RUN' then
	-- 	set_macro_page(3, 2)
	-- elseif player.sub_job == 'THF' then
	-- 	set_macro_page(2, 2)
	-- elseif player.sub_job == 'RDM' then
	-- 	set_macro_page(1, 2)
	-- else
		set_macro_page(1, 11)
	--end
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 013')
end

--Job Specific Trust Override
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
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
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
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