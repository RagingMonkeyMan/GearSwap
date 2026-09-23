-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal', 'LowHaste', 'Acc', 'Crit')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('DualLeadenMelee','DualSavageWeapons','DualLeadenRanged','DualWeapons','DualAeolian','DualLeadenMeleeAcc','DualRanged','Ranged', 'Savage1Hand', 'SavageRanged', 'None')
	state.CompensatorMode:options('1000','Always','300','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Animikii Bullet"
    options.ammo_warning_limit = 15

	CamulusSTRWS = { name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	CamulusMABWS = { name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Damage taken-5%',}}
	CamulusRATTWS = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	CamulusDW ={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}}
	CamulusRattSTP = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Atk.+10','"Store TP"+10',}}
	CamulusSnapshot = { name="Camulus's Mantle", augments={'"Snapshot"+10',}}
	
	AdhemarDEX = { name="Adhemar Wrist. +1", bag="Wardrobe 2", augments={'DEX+12','AGI+12','Accuracy+20',}}
	AdhemarAGI = { name="Adhemar Wrist. +1", bag="Wardrobe"}
	
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
	
    -- Additional local binds
	send_command('bind ^q gs c cycle ElementalMode')
	send_command('bind !q gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind ^~backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^~!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^~!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind ^w gs c weapons DualSavageWeapons;gs c update')
	send_command('bind !w gs c weapons DualLeadenRanged;gs c update')
	send_command('bind ~pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +1"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}

    sets.precast.CorsairRoll = {main="Rostam", ranged="Compensator", 
								head="Lanun tricorne +3", 
								neck="Regal necklace",
								hands="Chasseur's gants +1", 
								back="Gunslinger's cape"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Navarch's Culottes +2"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head=HercHelmMABWSD,neck="Commodore charm +2",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Arvina ringlet +1",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs=HercPantsMAB,feet="Chass. Bottes +1"}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head=HercHelmMABWSD,neck="Commodore charm +2",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Lanun Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Arvina ringlet +1",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs=HercPantsMAB,feet="Lanun Bottes +3"}
	
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
        head="Wh. Rarab Cap +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Emet Harness +1",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Chass. Bottes +1"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Malignance chapeau",neck="Commodore charm +2",ear1="Friomisi Earring",ear2="Gwati earring",
        body="Lanun Frac +3",hands="Carmine Finger Gauntlets +1",ring1="Arvina ringlet +1",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Kwahu kachina belt +1",legs=HercPantsMAB,feet="Malignance boots"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chasseur's tricorne +1", neck="Commodore charm +2",
        body="Oshosi Vest +1",hands="Carmine Finger Gauntlets +1",
        back=CamulusSnapshot,waist="Impulse Belt",legs="Adhemar kecks +1",feet="Meghanada jambeaux +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        ammo=gear.WSbullet,
        head="Lanun tricorne +3",neck="Fotia gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksamana's Frac +3",hands="Meghanada gloves +2",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusRATTWS,waist="Fotia belt",legs=HercPantsRAWS,feet="Lanun Bottes +3"}
		
    sets.precast.WS.Acc = {
        head="Meghanada visor +2",neck="Commodore charm +2",ear1="Brutal Earring",ear2="Ishvara Earring",
        body="Laksamana's Frac +3",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Epaminondas's Ring",
        back=CamulusRATTWS,waist=gear.ElementalBelt,legs="Meghanada chausses +2",feet="Lanun Bottes +3"}		
		
    sets.precast.WS.Proc = {
        head="Meghanada visor +2",neck="Commodore charm +2",ear1="Brutal Earring",ear2="Ishvara Earring",
        body="Laksamana's Frac +3",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Epaminondas's Ring",
        back=CamulusRATTWS,waist=gear.ElementalBelt,legs="Meghanada chausses +2",feet="Lanun Bottes +3"}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = {
		head=HercHelmSTRWSD,
		neck="Commodore charm +2",
		ear1="Ishvara earring",
		ear2="Moonshade earring",
		body="Laksamana's Frac +3", 
		hands="Meghanada gloves +2", 
		ring1="Regal ring",
		ring2="Epaminondas's Ring",
		back=CamulusSTRWS,
		waist="Sailfi belt +1",
		legs=HercPantsSTRWSD,
		feet="Lanun Bottes +3"
	}

	sets.precast.WS['Savage Blade'] = {
		head=HercHelmSTRWSD,
		neck="Commodore charm +2",
		ear1="Ishvara earring",
		ear2="Moonshade earring",
		body="Laksamana's Frac +3", 
		hands="Meghanada gloves +2", 
		ring1="Regal ring",
		ring2="Epaminondas's Ring",
		back=CamulusSTRWS,
		waist="Sailfi belt +1",
		legs=HercPantsSTRWSD,
		feet="Lanun Bottes +3"
	}

    sets.precast.WS['Savage Blade'].Acc = {
		head=HercHelmSTRWSD,
		neck="Commodore charm +2",
		ear1="Ishvara earring",
		ear2="Moonshade earring",
		body="Laksamana's Frac +3", 
		hands="Meghanada gloves +2", 
		ring1="Regal ring",
		ring2="Epaminondas's Ring",
		back=CamulusSTRWS,
		waist="Sailfi belt +1",
		legs=HercPantsSTRWSD,
		feet="Lanun Bottes +3"
	}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
        head="Lanun tricorne +3",neck="Fotia gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksamana's Frac +3",hands="Meghanada gloves +2",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusRATTWS,waist="Fotia belt",legs=HercPantsRAWS,feet="Lanun Bottes +3"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Meghanada visor +2",neck="Iskur gorget",ear1="Enervating earring",ear2="Telos Earring",
        body="Laksamana's Frac +3",hands="Meghanada gloves +2",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=CamulusRATTWS,waist="Kwahu kachina belt +1",legs="Meghanada chausses +2",feet="Lanun Bottes +3"}
		
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
        head="Pixie Hairpin +1",neck="Commodore charm +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Archon Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan Stone",legs=HercPantsMAB,feet="Lanun Bottes +3"}

    sets.precast.WS['Aeolian Edge'] = {ammo="Animikii Bullet",
        head=HercHelmMABWSD,neck="Commodore charm +2",ear1="Friomisi earring",ear2="Hecate's Earring",
        body="Lanun Frac +3",hands="Carmine finger gauntlets +1",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs=HercPantsMAB,feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head=HercHelmMABWSD,neck="Commodore charm +2",ear1="Friomisi earring",ear2="Hecate's Earring",
        body="Lanun Frac +3",hands="Carmine finger gauntlets +1",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs=HercPantsMAB,feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head=HercHelmMABWSD,neck="Commodore charm +2",ear1="Friomisi earring",ear2="Hecate's Earring",
        body="Lanun Frac +3",hands="Carmine finger gauntlets +1",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=CamulusMABWS,waist="Eschan stone",legs=HercPantsMAB,feet="Lanun Bottes +3"}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {ammo=gear.RAbullet,
        head="Meghanada Visor +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Sanare Earring",
        body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dark Ring",
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
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Iskur gorget",ear1="Telos Earring",ear2="Dedition earring",
        body="Malignance Tabard",hands="Malignance gloves",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=CamulusRattSTP,waist="Yemaya belt",legs="Adhemar kecks +1",feet="Malignance boots"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Iskur gorget",ear1="Telos Earring",ear2="Enervating earring",
        body="Malignance Tabard",hands="Malignance gloves",ring1="Hajduk Ring",ring2="Hajduk Ring",
        back=CamulusRattSTP,waist="Kwahu kachina belt +1",legs="Adhemar kecks +1",feet="Malignance boots"}
		
	sets.buff['Triple Shot'] = {head="Oshosi Mask +1", body="Chasseur's frac +1", hands="Oshosi gloves +1", legs="Oshosi trousers +1", feet="Oshosi leggings +1"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dingir Ring",
        back="Moonbeam Cape",waist="Flume belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dingir Ring",
        back="Moonbeam Cape",waist="Flume belt",legs="Samnuha tights",feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Odnowa Earring +1",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Dingir Ring",
        back="Moonbeam Cape",waist="Flume belt",legs="Samnuha tights",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Samnuha tights",feet="Malignance boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Samnuha tights",feet="Malignance boots"}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Malignance chapeau",neck="Iskur gorget",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Samnuha tights",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DWMax = {ear1="Eabani earring",ear2="Suppanomimi",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}

	-- Weapons sets
	sets.weapons.Ranged = {main="Kustawi +1",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Savage1Hand = {main="Naegling",sub="Nusku Shield",range="Anarchy +2"}
	sets.weapons.RangedSavage = {main="Naegling",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Blurred Knife +1",range="Fomalhaut"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Blurred Knife +1",range="Anarchy +2"}
	sets.weapons.DualLeadenRanged = {main="Rostam",sub="Tauret",range="Death Penalty"}
	sets.weapons.DualLeadenMelee = {main="Naegling",sub="Tauret",range="Death Penalty"}
	sets.weapons.DualAeolian = {main="Rostam",sub="Tauret",range="Anarchy +2"}
	sets.weapons.DualLeadenMeleeAcc = {main="Naegling",sub="Rostam",range="Death Penalty"}
	sets.weapons.DualRanged = {main="Rostam",sub="Kustawi +1",range="Fomalhaut"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar bonnet +1",neck="Iskur gorget",ear1="Telos earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=CamulusDW,waist="Windbuffet belt +1",legs="Samnuha tights",feet=HercBootsSTRTA}
		
	sets.engaged.LowHaste = {
        head="Adhemar bonnet +1",neck="Iskur gorget",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands="Floral gauntlets",ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=CamulusDW,waist="Windbuffet belt +1",legs="Samnuha tights",feet=HercBootsSTRTA}
    
    sets.engaged.Acc = {
		head="Malignance chapeau",neck="Iskur gorget",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=CamulusDW,waist="Windbuffet belt +1",legs="Carmine cuisses +1",feet="Malignance boots"}
		
	sets.engaged.Crit = {ammo=gear.RAbullet,
		head="Adhemar Bonnet +1",
		body="Meg. Cuirie +2",
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +2",
		feet="Mummu Gamash. +2",
		neck="Iskur gorget",
		waist="Windbuffet Belt +1",
		left_ear="Eabani Earring",
		right_ear="Suppanomimi",
		left_ring="Ilabrat Ring",
		right_ring="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}},
	}
		
    sets.engaged.DT = {
        head="Adhemar bonnet +1",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Samnuha tights",feet="Malignance boots"}
    
    sets.engaged.Acc.DT = {
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Samnuha tights",feet="Malignance boots"}

    sets.engaged.DW = {
		head="Adhemar bonnet +1",neck="Iskur gorget",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands="Floral gauntlets",ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=CamulusDW,waist="Windbuffet belt +1",legs="Samnuha tights",feet=HercBootsSTRTA}
    
    sets.engaged.DW.Acc = {
		head="Malignance chapeau",neck="Iskur gorget",ear1="Eabani earring",ear2="Suppanomimi",
        body="Adhemar jacket +1",hands={ name="Adhemar Wrist. +1", bag="Wardrobe 2"},ring1="Ilabrat Ring",ring2="Epona's Ring",
        back=CamulusDW,waist="Windbuffet belt +1",legs="Carmine cuisses +1",feet="Malignance boots"}
		
    sets.engaged.DW.DT = {
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Samnuha tights",feet="Malignance boots"}
    
    sets.engaged.DW.Acc.DT = {
        head="Malignance chapeau",neck="Loricate torque +1",ear1="Eabani earring",ear2="Suppanomimi",
        body="Malignance tabard",hands="Malignance gloves",ring1="Defending Ring",ring2="Epona's ring",
        back=CamulusDW,waist="Sailfi Belt +1",legs="Samnuha tights",feet="Malignance boots"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 5)
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 002')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 002')
		else
			windower.chat.input('/lockstyleset 002') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 002')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 002')
		else
			windower.chat.input('/lockstyleset 002') --Catchall just in case something's weird.
		end
	end
end