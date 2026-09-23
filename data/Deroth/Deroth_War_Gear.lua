 function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc') 
    state.WeaponskillMode:options('Normal','PDL','Uncapped Att', 'Proc') 
    state.HybridMode:options('Normal','DT')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    --state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Savage','ShOne','Club','Lycurgos','AgwuGS','Chango','None') -- ,'ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcClub','ProcStaff') -- 'ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcClub','ProcStaff')

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>') -- control `
	send_command('bind !` input /ja "Seigan" <me>') -- alt `
	send_command('bind @` gs c cycle SkillchainMode') -- win `
	send_command('bind !r gs c weapons Greatsword;gs c update') -- alt r
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	CicholSTRWSD = {name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}} 
	CicholWSD = {name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}} 
	CicholDA = {name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}} 
	CicholCrit = {name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}} 
	
	BodyTP = {name="Valorous Mail", augments={'Attack+25','"Dbl.Atk."+3','Accuracy+13',}} -- DA5 (room to improve)
	
	gear.odyssean_fc_legs = {nname="Odyssean Cuisses", augments={'Attack+4','"Fast Cast"+3',}}	
	gear.odyssean_fc_feet = {name="Odyssean Greaves", augments={'Accuracy+3','"Fast Cast"+4','VIT+1','Attack+13',}}
	
	-- Hands / Legs / Feet Priority
	WAR_EMPY_Head       = "Boii Mask +2"
	WAR_EMPY_Body       = "Boii Lorica +2"
	WAR_EMPY_Hand       = "Nyame Gauntlets" --"Boii Mufflers +2"
	WAR_EMPY_Legs       = "Nyame Flanchard" -- "Boii Cuisses +2"
	WAR_EMPY_Feet       = "Boii Calligae +2"
	
	-- Precast Sets
	
    sets.Enmity = {ammo="Sapience Orb",
        head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Cryptic Earring",ear2="Trux Earring",
        body="Souv. Cuirass +1",hands="Yorium Gauntlets",ring1="Eihwaz Ring",ring2="Supershear Ring",
        back=RudianosTurtle,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Eschite Greaves"}  
		
	sets.Knockback = {}
	sets.passive.Twilight = {head="Twilight Helm",body="Twilight Mail"} 
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Berserk'] = {back="Cichol's Mantle"} -- done
	sets.precast.JA['Warcry'] = {head="Nyame helm"}
	sets.precast.JA['Defender'] = {}
	sets.precast.JA['Aggressor'] = {}
	sets.precast.JA['Mighty Strikes'] = {}
	sets.precast.JA["Warrior's Charge"] = {}
	sets.precast.JA['Tomahawk'] = {ammo="Thr. Tomahawk"} -- done
	sets.precast.JA['Retaliation'] = {}
	sets.precast.JA['Restraint'] = {}
	sets.precast.JA['Blood Rage'] = {}
	sets.precast.JA['Brazen Rush'] = {}
	sets.precast.JA['Provoke'] = set_combine(sets.Enmity,{})
                   
	-- Fast cast sets for spells

	-- Set Check Date 12/2/24
	sets.precast.FC = {
		ammo="Sapience Orb",
		head="Sakpata's Helm",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Odyss. Chestplate",
		hands="Leyline Gloves",
		ring1="Weatherspoon Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Flume Belt +1",
		legs=gear.odyssean_fc_legs,
		feet=gear.odyssean_fc_feet}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	-- Midcast Sets
	-- Set Check Date 12/2/24
	sets.midcast.FastRecast = {
		ammo="Sapience Orb",
		head="Sakpata's Helm",
		neck="Voltsurge Torque",
		ear1="Enchntr. Earring +1",
		ear2="Loquac. Earring",
		body="Odyss. Chestplate", 
		hands="Leyline Gloves",
		ring1="Weatherspoon Ring",
		ring2="Prolix Ring",
		back="Moonlight Cape",
		waist="Flume Belt +1",
		legs=gear.odyssean_fc_legs,
		feet=gear.odyssean_fc_feet}
	
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {}) 
                   
	--sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"} -- need all but waist
	--sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"} -- need all but waist
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined  Hetairoi
    sets.precast.WS = {
		ammo="Knobkierrie",
		head="Nyame helm",
		neck="Rep. Plat. Medal",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		body="Pummeler's Lorica +3",
		hands=HandsWSD,
		ring1="Karieyh Ring +1",
		ring2="Niqmaddu Ring",
	 	back=CicholWSD,
		waist="Ioskeha Belt +1",
		legs=LegsWSD,
		feet="Sulevia's Leggings +2"}

	sets.precast.WS.Proc = {
		ammo={name="Staunch Tathlum +1", priority=1},
		head=empty,
		body=empty,
		hands=empty,
		legs=empty,
		feet=empty,
		neck={name="Unmoving Collar +1", priority=1},
		waist={name="Plat. Mog. Belt", priority=1},
		left_ear={name="Odnowa Earring +1", priority=1},
		right_ear={name="Tuisto Earring", priority=1},
		left_ring={name="Gelatinous Ring +1", priority=1},
		right_ring=empty,
		back=empty
	}

	sets.precast.WS.PDL = set_combine(sets.precast.WS, {})
	
	-- Set Check Date 12/3/24
	sets.precast.WS["Ukko's Fury"] = { -- Ukon / Utu
		ammo="Yetshila +1",
		head=WAR_EMPY_Head,
		neck="Rep. Plat. Medal",
		ear1="Schere Earring",
		ear2="Moonshade Earring", -- Boii +1/+2
		body="Sakpata's Breastplate",
		hands=WAR_EMPY_Hand,
		ring1="Begrudging Ring",
		ring2="Niqmaddu Ring",
		back=CicholCrit, -- NEED
		waist="Ioskeha Belt +1",
		legs=WAR_EMPY_Legs,
		feet=WAR_EMPY_Feet}

	-- Set Check Date 12/3/24
	sets.precast.WS["Ukko's Fury"].PDL = { -- Ukon / Utu
		ammo="Yetshila +1",
		head=WAR_EMPY_Head,
		neck="Rep. Plat. Medal",
		ear1="Schere Earring",
		ear2="Moonshade Earring", -- Boii +1/+2
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		back=CicholCrit, -- NEED
		waist="Ioskeha Belt +1",
		legs=WAR_EMPY_Legs,
		feet=WAR_EMPY_Feet}
	
	-- Set Check Date 12/2/24
    sets.precast.WS['Upheaval'] = { -- Chango / Utu
		ammo="Knobkierrie",
		head="Nyame helm",
		neck="Rep. Plat. Medal",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands=WAR_EMPY_Hand,
		ring1="Regal Ring",
		ring2="Niqmaddu Ring",
		back=CicholWSD,
		waist="Sailfi Belt +1",
		legs=WAR_EMPY_Legs,
		feet="Nyame Sollerets"}
	
	-- Set Check Date 12/2/24	
	sets.precast.WS['Upheaval'].PDL = { -- Chango / Utu
		ammo="Knobkierrie",
		head="Sakpata's Helm",
		neck="Rep. Plat. Medal",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		body="Sakpata's Breastplate",
		hands="Sakpata's Gauntlets",
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		back=CicholWSD,
		waist="Sailfi Belt +1",
		legs=WAR_EMPY_Legs,
		feet="Nyame Sollerets"}	

	sets.precast.WS['Resolution'] = {
		ammo="Seeth. Bomblet +1",
		head="Sakpata's helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=CicholDA,waist="Fotia belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.precast.WS['Resolution'].UncappedAtt = {
		ammo="Coiste Bodhar",
		head="Sakpata's helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=CicholDA,waist="Fotia belt",legs="Ignominy Flanchard +3",feet="Heath. Sollerets +3"}

	sets.precast.WS['Resolution'].PDL = {
		ammo="Seeth. Bomblet +1",
		head="Sakpata's helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=CicholDA,waist="Fotia belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.precast.WS['Fimbulvetr'] = {
		ammo="Knobkierrie",
		head="Sakpata's helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +3",hands="Sakpata's Gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=CicholWSD,waist="Fotia belt",legs="Fallen's flanchard +3",feet="Heath. Sollerets +3"}
	
	sets.precast.WS['Fimbulvetr'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Nyame helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Thrud earring",
		body="Ignominy Cuirass +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=CicholWSD,waist="Fotia belt",legs="Fallen's flanchard +3",feet="Heath. Sollerets +3"}

	sets.precast.WS['Scourge'] = {
		ammo="Knobkierrie",
		head="Nyame helm",neck="Rep. Plat. Medal",ear1="Thrud Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +3",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=CicholWSD,waist="Sailfi Belt +1",legs="Fallen's flanchard +3",feet="Heath. Sollerets +3"}

	sets.precast.WS['Scourge'].PDL = {
		ammo="Knobkierrie",
		head="Sakpata's helm",neck="Rep. Plat. Medal",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Sroda Ring",
		back=CicholWSD,waist="Fotia belt", legs="Sakpata's Cuisses", feet="Heath. Sollerets +3"}
	
	-- Set Check Date 12/2/24
	sets.precast.WS['Savage Blade'] = { -- ~NOT ATT CAP
		ammo="Knobkierrie",
		head="Nyame helm",
		neck="Rep. Plat. Medal",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		body="Nyame Mail",
		hands=WAR_EMPY_Hand,
		ring1="Ephramad's Ring",
		ring2="Epaminondas's Ring",
		back=CicholSTRWSD,
		waist="Sailfi Belt +1",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets"}

    -- Set Check Date 12/2/24
	sets.precast.WS['Savage Blade'].PDL = { -- ~ATT CAP
		ammo="Crepuscular Pebble", 
		head="Nyame helm",
		neck="Rep. Plat. Medal",
		ear1="Thrud Earring",
		ear2="Moonshade Earring",
		body="Sakpata's Breastplate",
		hands=WAR_EMPY_Hand,
		ring1="Ephramad's Ring",
		ring2="Epaminondas's Ring",
		back=CicholSTRWSD,
		waist="Sailfi Belt +1",
		legs=WAR_EMPY_Legs,
		feet="Nyame Sollerets"}
	
	-- Decimation -- Dolichenus / Ikenga
	
	-- Set Check Date 12/3/24
	sets.precast.WS['Impulse Drive'] = {
		ammo="Yetshila +1",
		head="Nyame helm",
		neck="Rep. Plat. Medal",
		ear1="Thrud Earring", -- Boii +1/+2
		ear2="Moonshade Earring",
		body="Hjarrandi Breastplate",
		hands=WAR_EMPY_Hand,
		ring1="Begrudging Ring",
		ring2="Niqmaddu Ring",
		back=CicholCrit,
		waist="Ioskeha Belt +1",
		legs=WAR_EMPY_Legs,
		feet=WAR_EMPY_Feet}

	-- Set Check Date 12/3/24
	sets.precast.WS['Impulse Drive'].PDL = {
		ammo="Yetshila +1",
		head="Blistering Sallet +1",
		neck="Rep. Plat. Medal",
		ear1="Thrud Earring", -- Boii +1/+2
		ear2="Moonshade Earring",
		body="Sakpata's Breastplate",
		hands=WAR_EMPY_Hand,
		ring1="Sroda Ring",
		ring2="Niqmaddu Ring",
		back=CicholSTRWSD,
		waist="Ioskeha Belt +1",
		legs=WAR_EMPY_Legs,
		feet=WAR_EMPY_Feet}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1"}
	
	--Specialty WS set overwrites.
	sets.AccWSMightyCharge = {}
	sets.AccWSCharge = {}
	sets.AccWSMightyCharge = {}
	sets.WSMightyCharge = {}
	sets.WSCharge = {}
	sets.WSMighty = {}

    -- Sets to return to when not performing an action.
           
    -- Resting sets
    sets.resting = {}
           
	-- Idle sets
	sets.idle = {
		ammo = "Staunch Tathlum +1",
		head = "Sakpata's Helm",
		neck = "Bathy choker +1", 
		ear1 = "Odnowa Earring +1",
		ear2 = "Tuisto earring", 
		body = "Sakpata's Breastplate", 
		hands= "Sakpata's Gauntlets", 
		ring1 = "Defending Ring",
		ring2 = "Chirich Ring +1",
		back = CicholDA, 
		waist = "Carrier's Sash",
		legs = "Sakpata's Cuisses",
		feet = "Sakpata's Leggings"}
		
	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
--	sets.defense.PDT = {ammo="Staunch Tathlum +1",
	--	head="Sulevia's Mask +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
	--	body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Sulevia's Ring",
	--	back="Moonlight cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Sulevia's leggings +2"}
		
	--sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	--sets.defense.MDT = {ammo="Staunch Tathlum +1",
	--	head="Genmei Kabuto",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
	--	body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonlight Ring",
	--	back="Moonlight Cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Sulevia's leggings +2"}
		
	--sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	--sets.defense.MEVA = {ammo="Staunch Tathlum +1",
	--	head="Genmei Kabuto",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Ethereal Earring",
	--	body="Tartarus Platemail",hands="Sulev. Gauntlets +2",ring1="Moonbeam Ring",ring2="Moonlight Ring",
	--	back="Moonlight Cape",waist="Flume Belt +1",legs="Sulev. Cuisses +2",feet="Sulevia's leggings +2"}

	sets.Kiting = {feet="Hermes' Sandals"}
	--sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	--sets.buff.Sleep = {head="Frenzy Sallet"}
     
    -- Engaged sets
    sets.engaged = {
		ammo = "Coiste Bodhar",
		head = "Flam. Zucchetto +2",
		neck = "Vim torque +1",
		ear1 = "Schere Earring",
		ear2 = "Dedition Earring",
		body = "Sakpata's Breastplate",
		hands= "Sakpata's Gauntlets",
		ring1 = "Chirich Ring +1",
		ring2 = "Niqmaddu Ring",
		back = CicholDA,
		waist = "Sailfi Belt +1",
		legs = "Sakpata's Cuisses",
		feet = "Sakpata's Leggings"}
	
	sets.engaged.Acc = set_combine(sets.engaged.SomeAcc, {})

	sets.engaged.DT = set_combine(sets.engaged, {
		ammo = "Coiste Bodhar",
		head = "Sakpata's Helm", 
		neck = "Vim torque +1", 
		ear1 = "Schere Earring", 
		ear2 = "Dedition Earring", 
		body = "Sakpata's Breastplate", 
		hands= "Sakpata's Gauntlets",
		ring1 = "Chirich Ring +1",
		ring2 = "Niqmaddu Ring",
		back = CicholDA,
		waist = "Sailfi Belt +1",
		legs = "Sakpata's Cuisses",
		feet = "Sakpata's Leggings"})

	sets.engaged.Acc.DT = set_combine(sets.engaged, {})
	
	--Extra Special Sets
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Retaliation = {}
	sets.buff.Restraint = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Chango = {main="Chango",sub="Utu Grip"}
	sets.weapons.Savage = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.ShOne = {main="Shining one", sub="Utu Grip"}
	sets.weapons.Club = {main="Loxotic Mace +1", sub="Utu Grip"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Utu Grip"}
	sets.weapons.AgwuGS = {main="Agwu's Claymore",sub="Utu Grip"}
--	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
--	sets.weapons.Greatsword = {main="Montante +1",sub="Utu Grip"}
--	sets.weapons.ProcDagger = {main="Bronze Dagger",sub=empty}
--	sets.weapons.ProcSword = {main="Wax Sword",sub=empty}
--	sets.weapons.ProcGreatSword = {main="Claymore",sub=empty}
--	sets.weapons.ProcScythe = {main="Bronze Zaghnal",sub=empty}
--	sets.weapons.ProcPolearm = {main="Harpoon",sub=empty}
--  sets.weapons.ProcGreatKatana = {main="Hardwood Katana",sub=empty}
--	sets.weapons.ProcClub = {main="Ash Club",sub=empty}
--	sets.weapons.ProcStaff = {main="Ash Staff",sub=empty}

end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'SAM' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'DRG' then
        set_macro_page(3, 3)
    else
        set_macro_page(1, 3)
    end
end