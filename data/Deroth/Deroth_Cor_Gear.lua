-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'LowHaste', 'Acc', 'Crit')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Uncapped Attack','Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('DT','Normal')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('DualSavage', 'DualSavageAcc','DualLeadenMelee','DualLeadenRanged','DualRanged','DualArma','Ranged','DualAeolian', 'None')
	state.CompensatorMode:options('Always','1000','300','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Devastating Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15

	CamulusSTRWS = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	CamulusMABWS = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	CamulusRATTWS = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	CamulusDW ={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	CamulusRattSTP = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	CamulusSnapshot = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}
	
    -- Additional local binds
	send_command('bind ^q gs c cycle ElementalMode')
	send_command('bind !q gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind ^~backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^~!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^~!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind ^w gs c weapons DualSavage;gs c update')
	send_command('bind !w gs c weapons DualLeadenRanged;gs c update')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +3"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +4"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +4"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}

    sets.precast.CorsairRoll = {main="Rostam", ranged="Compensator", 
								head="Lanun tricorne +1",
								neck="Regal necklace",
								hands="Chasseur's gants +3",
								back=CamulusDW}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +2"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +3"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +3"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +4",hands="Carmine Finger Gauntlets +1",ring1="Ephramad's ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs="Nyame Flanchard",feet="Chass. Bottes +2"}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +4",hands="Carmine Finger Gauntlets +1",ring1="Ephramad's ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs="Nyame Flanchard",feet="Chass. Bottes +2"} 
	
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        head="Wh. Rarab Cap +1",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Sanare Earring",
        body="Volte Jupon",hands="Malignance Gloves",ring1="Murky Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Chaac belt",legs="Carmine Cuisses +1",feet="Chass. Bottes +2"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Malignance chapeau",neck="Sibyl Scarf",ear1="Friomisi Earring",ear2="Gwati earring",
        body="Lanun Frac +4",hands="Carmine Finger Gauntlets +1",ring1="Arvina ringlet +1",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Kwahu kachina belt +1",legs="Nyame Flanchard",feet="Malignance boots"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +2"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weatherspoon Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

        
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo=gear.WSbullet,
        head="Nyame helm",neck="Rep. Plat. Medal",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Nyame mail",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Nyame sollerets"
    }
		
    sets.precast.WS.Acc = {
        head="Nyame helm",neck="Rep. Plat. Medal",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Nyame mail",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Nyame sollerets"
    }
		
    sets.precast.WS.Proc = sets.precast.FC
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = {
		head="Nyame helm",neck="Rep. Plat. Medal",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Nyame mail",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Nyame sollerets"
	}

	sets.precast.WS['Savage Blade'] = {
		head="Nyame helm",neck="Rep. Plat. Medal",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Ikenga's Vest",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Lanun Bottes +4"
	}

    sets.precast.WS['Savage Blade'].UncappedAttack = {
		head="Nyame helm",neck="Rep. Plat. Medal",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Nyame mail",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Nyame sollerets"
	}

    sets.precast.WS['Savage Blade'].Acc = {
		head="Nyame helm",neck="Rep. Plat. Medal",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Ikenga's Vest",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Lanun Bottes +4"
	}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Nyame helm",neck="Fotia gorget",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Ikenga's Vest",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusRATTWS,waist="Fotia belt",legs="Nyame flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'].UncappedAttack = {ammo=gear.WSbullet,
        head="Nyame helm",neck="Fotia gorget",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Ikenga's Vest",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Dingir Ring",
        back=CamulusRATTWS,waist="Fotia belt",legs="Nyame flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Nyame helm",neck="Fotia gorget",ear1="Hoxne Earring",ear2="Moonshade Earring",
        body="Ikenga's Vest",hands="Chasseur's gants +3",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
        back=CamulusRATTWS,waist="Fotia belt",legs="Nyame flanchard",feet="Lanun Bottes +4"}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Sibyl Scarf",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Aeolian Edge'] = {ammo=gear.QDbullet, 
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Moonshade earring",ear2="Friomisi Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Friomisi earring",ear2="Hoxne Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Sibyl Scarf",ear1="Friomisi earring",ear2="Hoxne Earring",
        body="Lanun Frac +4",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs="Nyame Flanchard",feet="Lanun Bottes +4"}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Murky Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Meg. Chausses +2",feet="Meg. Jam. +2"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}
        
    -- Specific spells

	sets.midcast.Cure = {
        head="Carmine Mask +1",neck="Phalaina Locket",ear1="Enchntr. Earring +1",ear2="Mendi. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Janniston Ring",ring2="Lebeche Ring",
        back="Solemnity Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chasseur's tricorne +1", neck="Commodore charm +2",
        body="Oshosi Vest +1",hands="Carmine Finger Gauntlets +1",
        back=CamulusSnapshot,waist="Impulse Belt",legs="Adhemar kecks +1",feet="Meghanada jambeaux +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Ikenga's hat",neck="Iskur gorget",ear1="Telos Earring",ear2="Dedition earring",
        body="Ikenga's Vest",hands="Malignance gloves",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=CamulusRattSTP,waist="Yemaya belt",legs="Chasseur's Culottes +3",feet="Malignance boots"}  

    sets.midcast.RA["Armageddon"] = {ammo=gear.RAbullet,
        head="Ikenga's hat",neck="Iskur gorget",ear1="Telos Earring",ear2="Dedition earring",
        body="Ikenga's Vest",hands="Malignance gloves",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=CamulusRattSTP,waist="Yemaya belt",legs="Chasseur's Culottes +3",feet="Malignance boots"}  

    sets.midcast.RA["Armageddon"].AM = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Iskur gorget",ear1="Odr Earring",ear2="Chas. earring +1",
        body="Nisroch Jerkin",hands="Chasseur's gants +3",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=CamulusRattSTP,waist="K. Kachina Belt +1",legs="Chasseur's Culottes +3",feet="Oshosi Leggings +1"}  

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
       head="Ikenga's hat",neck="Iskur gorget",ear1="Telos Earring",ear2="Crepuscular earring",
        body="Ikenga's Vest",hands="Malignance gloves",ring1="Crepuscular Ring",ring2="Dingir Ring",
        back=CamulusRattSTP,waist="Yemaya belt",legs="Chasseur's Culottes +3",feet="Malignance boots"}
		
	sets.buff['Triple Shot'] = {head="Oshosi Mask +1", body="Chasseur's frac +3", hands="Lanun Gants +3", legs="Oshosi trousers +1", feet="Oshosi leggings +1"}
    sets.TrueShot = {body="Nisroch Jerkin",waist="Tellen belt",legs="Oshosi trousers +1",feet="Ikenga's Clogs"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Nyame helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Alabaster Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Murky Ring",
        back=CamulusDW,waist="Flume belt +1",legs="Chasseur's Culottes +3",feet="Nyame sollerets"}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Nyame helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Alabaster Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Murky Ring",
        back=CamulusDW,waist="Flume belt",legs="Chasseur's Culottes +3",feet="Nyame sollerets"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Nyame helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Alabaster Earring",
        body="Nyame mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Murky Ring",
        back=CamulusDW,waist="Flume belt",legs="Chasseur's Culottes +3",feet="Nyame sollerets"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Murky Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Murky Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Iskur gorget",ear1="Etiolation Earring",ear2="Suppanomimi",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DWMax = {ear1="Eabani earring",ear2="Suppanomimi",body="Adhemar Jacket +1",hands="Adhemar wristbands +1",waist="Reiki Yotai"}

	-- Weapons sets
	sets.weapons.Ranged = {main="Kustawi +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Savage1Hand = {main="Naegling",sub="Nusku Shield",range="Anarchy +2"}
	sets.weapons.RangedSavage = {main="Naegling",sub="Nusku Shield",range="Molybdosis"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Molybdosis"}
	sets.weapons.DualSavage = {main="Naegling",sub="Blurred Knife +1",range="Anarchy +2"}
    sets.weapons.DualSavageAcc = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.DualLeadenRanged = {main="Rostam",sub="Telopanos Saber",range="Molybdosis"}
	sets.weapons.DualLeadenMelee = {main="Naegling",sub="Telopanos Saber",range="Armageddon"}
    sets.weapons.DualArma = {main="Naegling",sub="Telopanos Saber",range="Armageddon"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Telopanos Saber",range="Anarchy +2"}
	sets.weapons.DualRanged = {main="Rostam",sub="Kustawi +1",range="Fomalhaut"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar bonnet +1",neck="Iskur gorget",ear1="Telos earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back="Null Cape",waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}
		
	sets.engaged.LowHaste = {
        head="Adhemar bonnet +1",neck="Iskur gorget",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back="Null Cape",waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}
    
    sets.engaged.Acc = {
		head="Malignance chapeau",neck="Null loop",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Epona's Ring",
        back="Null Cape",waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}
		
	sets.engaged.Crit = {ammo=gear.RAbullet,
		head="Adhemar Bonnet +1",
		body="Nisroch Jerkin",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck="Iskur gorget",
		waist="Sailfi Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Chirich Ring +1",
		right_ring="Epona's Ring",
		back="Null Cape",
	}
		
    sets.engaged.DT = {
        head="Malignance chapeau",neck="Null loop",ear1="Cessance earring",ear2="Telos earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Chirich Ring +1",ring2="Murky Ring",
        back="Null Cape",waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}
    
    sets.engaged.Acc.DT = {
        head="Malignance chapeau",neck="Null loop",ear1="Cessance earring",ear2="Telos earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Chirich Ring +1",ring2="Murky Ring",
        back="Null Cape",waist="Sailfi Belt +1",legs="Chasseur's Culottes +3",feet="Malignance boots"}

    sets.engaged.DW = {
		head="Adhemar bonnet +1",neck="Iskur gorget",ear1="Eabani earring",ear2="Telos earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Chirich Ring +1",ring2="Petrov Ring",
        back=CamulusDW,waist="Reiki Yotai",legs="Chasseur's Culottes +3",feet="Malignance boots"}
    
    sets.engaged.DW.Acc = {
		head="Malignance chapeau",neck="Sanctity necklace",ear1="Dignitary's earring",ear2="Telos earring",
        body="Adhemar jacket +1",hands="Adhemar Wrist. +1",ring1="Chirich Ring +1",ring2="Petrov Ring",
        back=CamulusDW,waist="Reiki Yotai",legs="Chasseur's Culottes +3",feet="Malignance boots"}
		
    sets.engaged.DW.DT = {
        head="Malignance chapeau",neck="Null loop",ear1="Eabani earring",ear2="Telos earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Chirich Ring +1",ring2="Murky Ring",
        back=CamulusDW,waist="Reiki Yotai",legs="Chasseur's Culottes +3",feet="Malignance boots"}
    
    sets.engaged.DW.Acc.DT = {
         head="Malignance chapeau",neck="Null loop",ear1="Eabani earring",ear2="Telos earring",
        body="Malignance tabard",hands="Malignance gloves",ring1="Chirich Ring +1",ring2="Murky Ring",
        back=CamulusDW,waist="Reiki Yotai",legs="Chasseur's Culottes +3",feet="Malignance boots"}

    sets.engaged.DW.Crit = {ammo=gear.RAbullet,
		head="Adhemar Bonnet +1",
		body="Nisroch Jerkin",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck="Iskur gorget",
		waist="Sailfi Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Chirich Ring +1",
		right_ring="Epona's Ring",
		back=CamulusDW,
	}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 10)
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 021')
	end
end

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'fast' then
		send_command('input /ja "Bolter\'s Roll" <me>;autocor off')
                add_to_chat(158,'MAXIMUM SPEED')
	elseif commandArgs[1]:lower() == 'aeolian' then
		equip({main=empty,sub=empty})
		send_command('gs c weapons DualAeolian;gs c update;aws off')
				add_to_chat(158,'Aeolian weapon set equiped')
	elseif commandArgs[1]:lower() == 'ddweapons' then
		send_command('gs c weapons None;gs c update')
		equip({main=empty,sub=empty})
		send_command('gs c weapons DualSavageWeapons;gs c update;aws use savage blade')
				add_to_chat(158,'Savage weapon set equiped')
	elseif commandArgs[1]:lower() == 'magicweapons' then
		equip({main=empty,sub=empty})
		send_command('gs c weapons DualLeadenMelee;gs c update;aws use leaden salute')
				add_to_chat(158,'Magic weapon sets equiped')
	elseif commandArgs[1]:lower() == 'rangedweapons' then
		send_command('gs c weapons Ranged;gs c update;aws use last stand')
				add_to_chat(158,'Ranged weapon sets equiped')
	elseif commandArgs[1]:lower() == 'du' then
		send_command('input /ja "Double Up" <me>')
                add_to_chat(158,'Double Up')
	end
end