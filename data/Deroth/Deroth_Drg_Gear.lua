-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc')
    state.WeaponskillMode:options('Match','UncappedAtt','PDL','Normal','SomeAcc','Acc')
    state.HybridMode:options('Normal','DT', 'MEVA')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('ShiningOne', "Trishula", 'DualNaegling', 'Naegling', 'Quint', 'Staff','None')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^= input /ja "Hasso" <me>')
	send_command('bind != input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @= gs c cycle SkillchainMode')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

	CarmineMask = {}
	CarmineMask.FC = { name = "Carmine Mask +1", augments = { 'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4', } }

	ValorousMask = {}
	ValorousMask.SCD = { name="Valorous Mask", augments={'Accuracy+19','Sklchn.dmg.+5%','STR+5','Attack+4',}}
	ValorousMask.WSD = { name="Valorous Mask", augments={'Attack+25','Weapon skill damage +4%','STR+14','Accuracy+10',}}
	ValorousMask.DA = { name="Valorous Mask", augments={'Mag. Acc.+11','"Dbl.Atk."+4','STR+15','Accuracy+5',}}
	
	ValorousMitts = {}
	ValorousMitts.SCDAcc = { name="Valorous Mitts", augments={'Accuracy+20','Sklchn.dmg.+4%','STR+13',}}
	ValorousMitts.WSD = { name="Valorous Mitts", augments={'Weapon skill damage +3%','STR+8','Attack+14',}}
	
	AcroGauntlets = {}
	AcroGauntlets.STP = { name="Acro Gauntlets", augments={'Accuracy+20','"Store TP"+6','DEX+10',}}
	AcroGauntlets.Breath = { name="Acro Gauntlets", augments={'Pet: Breath+7',}}
	
	ValorousBody = {}
	ValorousBody.STP = { name="Valorous Mail", augments={'"Store TP"+7','Accuracy+14',}}
	ValorousBody.WSD = { name="Valorous Mail", augments={'Attack+26','Weapon skill damage +4%','STR+8',}}
	ValorousBody.STRDA = { name="Valorous Mail", augments={'"Dbl.Atk."+5','Accuracy+3',}}
	ValorousBody.DA = { name="Valorous Mail", augments={'"Dbl.Atk."+5','Accuracy+3',}}
	
	ValorousHose = {}
	ValorousHose.DA = { name="Valor. Hose", augments={'Accuracy+16','"Dbl.Atk."+5','STR+3','Attack+5',}}
	ValorousHose.STP = { name="Valorous Hose", augments={'Mag. Acc.+10','"Store TP"+6','VIT+6','Accuracy+6',}}
	ValorousHose.SCD = { name="Valor. Hose", augments={'Attack+22','Sklchn.dmg.+3%','STR+9','Accuracy+12',}}
	
	ValorousFeet = {}
	
	ValorousMask.TH = { name="Valorous Mask", augments={'"Fast Cast"+4','Pet: DEX+10','"Treasure Hunter"+2','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}
    ValorousBody.Phalanx = { name="Valorous Mail", augments={'Attack+13','DEX+1','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	ValorousMask.PetMAB ={ name="Valorous Mask", augments={'Accuracy+19','Pet: "Mag.Atk.Bns."+30','Accuracy+2 Attack+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
    ValorousBody.Quad ={ name="Valorous Mail", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Attack+10','Quadruple Attack +2','Accuracy+18 Attack+18','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}
	
	LustFeet = {}
	LustFeet.STRDA = { name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}}

	Brig = {}
	Brig.STP = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}
	Brig.DATP = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}
	Brig.STRDA = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}
	Brig.WSD = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	Brig.FCMeva = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}
	
	-------------------------------	
	--   End of Augmented Gear   --
	-------------------------------


	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon", hands = "Pteroslaver Finger Gauntlets +3"}
	sets.precast.JA.Jump = {
		ammo = "Coiste Bodhar",
		head = "Flamma Zucchetto +2",
		neck = "Anu Torque",
		ear2 = "Sherida Earring",
		ear1 = "Dedition Earring",
		body = "Pteroslaver Mail +3",
		hands = "Vis. Fng. Gaunt. +3", 
		ring1 = "Niqmaddu Ring",
		ring2 = "Dreki Ring",
		back = Brig.STP,
		waist = "Sailfi Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Ostro Greaves"
	}
	
	sets.precast.JA['High Jump'] = {
		ammo = "Coiste Bodhar",
		head = "Flamma Zucchetto +2",
		neck = "Anu Torque",
		ear2 = "Sherida Earring",
		ear1 = "Dedition Earring",
		body = "Pteroslaver Mail +3",
		hands = "Vis. Fng. Gaunt. +3", 
		ring1 = "Niqmaddu Ring",
		ring2 = "Dreki Ring",
		back = Brig.STP,
		waist = "Sailfi Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Ostro Greaves"
	}
	
	sets.precast.JA['Soul Jump'] = {
		ammo = "Coiste Bodhar",
		head = "Flamma Zucchetto +2",
		neck = "Anu Torque",
		ear2 = "Sherida Earring",
		ear1 = "Dedition Earring",
		body = "Hjarrandi Breastplate", 
		hands = "Vis. Fng. Gaunt. +3", 
		ring1 = "Niqmaddu Ring",
		ring2 = "Dreki Ring",
		back = Brig.STP,
		waist = "Sailfi Belt +1",
		legs = ValorousHose.STP,
		feet = "Ostro Greaves"
	}
	
	sets.precast.JA['Spirit Jump'] = {
		ammo = "Coiste Bodhar",
		head = "Flamma Zucchetto +2",
		neck = "Anu Torque",
		ear2 = "Sherida Earring",
		ear1 = "Dedition Earring",
		body = "Pteroslaver Mail +3",
		hands = "Vis. Fng. Gaunt. +3", 
		ring1 = "Niqmaddu Ring",
		ring2 = "Dreki Ring",
		back = Brig.STP,
		waist = "Sailfi Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Ostro Greaves"
	}
	
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {
		head = "Vishap armet +1",
		ear1 = "Pratik Earring",
		hands = "Peltast's Vambraces",
		feet = "Ptero. Greaves +3"
	}
	sets.precast.JA['Call Wyvern'] = {
		neck="Dragoon's collar +2",
		hands="Pteroslaver Mail +3",
		feet="Gleti's Boots",
		ring1="Dreki ring",
		right_ear="Peltast's Earring +1" 
	} 
	sets.precast.JA['Deep Breathing'] = {hands="Ptero. Armet +3"}
	sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +3"}
	sets.precast.JA['Steady Wing'] = {legs = "Vishap brais +3",hands = "Despair finger gauntlets",feet = "Ptero. Greaves +3"}
	sets.precast.JA['Ancient Circle'] = {legs = "Vishap brais +3"}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {
		head = "Pteroslaver Armet +3",
		ear2 = "Anastasi Earring",
		body = "Acro Surcoat",
		hands = "Despair Finger Gauntlets",
		legs = "Vishap brais +3",
		feet = "Ptero. Greaves +3",
		back = "Updraft Mantle"
	}
	sets.precast.JA['Smiting Breath'] = {
		head = "Pteroslaver Armet +3",
		body = "Acro Surcoat",
		hands = AcroGauntlets.Breath,
		legs = "Acro Breeches",
		feet = "Acro Leggings",
		back = "Updraft Mantle"
	}
	sets.HealingBreath = {
		head = "Pteroslaver Armet +3",
		ear2 = "Anastasi Earring",
		body = "Acro Surcoat",
		hands = "Despair Finger Gauntlets",
		legs = "Vishap brais +3",
		feet = "Ptero. Greaves +3",
		back = "Updraft Mantle"
	}
	sets.SmitingBreath = {
		head = "Pteroslaver Armet +3",
		body = "Acro Surcoat",
		hands = AcroGauntlets.Breath,
		legs = "Acro Breeches",
		feet = "Acro Leggings",
		back = "Updraft Mantle"
	}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Founder's Greaves",feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Founder's Greaves",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +3"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {
		ammo = "Coiste Bodhar",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Ephramad's ring",
		back = Brig.STRDA,
		waist = "Fotia Belt",
		legs = "Gleti's Breeches",
		feet = "Flamma Gambieras +2"
	}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = {
		ammo = "Coiste Bodhar",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Pteroslaver Earring +1",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Ephramad's Ring",
		ring2 = "Niqmaddu Ring",
		back = Brig.STRDA,
		waist = "Fotia Belt",
		legs = "Gleti's Breeches",
		feet = "Flamma Gambieras +2"
	}

	sets.precast.WS['Stardiver'].PDL = {
		ammo = "Coiste Bodhar",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Pteroslaver Earring +1",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Ephramad's Ring",
		ring2 = "Niqmaddu Ring",
		back = Brig.STRDA,
		waist = "Fotia Belt",
		legs = "Gleti's Breeches",
		feet = "Gleti's boots"
	}

	sets.precast.WS['Stardiver'].UncappedAtt = {
		ammo = "Coiste Bodhar",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Pteroslaver Mail +3",
		hands = "Sulevia's Gauntlets +2",
		ring1 = "Ephramad's Ring",
		ring2 = "Niqmaddu Ring",
		back = Brig.STRDA,
		waist = "Fotia Belt",
		legs = "Sulevia's Cuisses +2",
		feet = "Pteroslaver greaves +3"  
	}
	
	sets.precast.WS['Stardiver'].SomeAcc = {
		ammo = "Coiste Bodhar",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = ValorousBody.Quad,
		hands = "Sulevia's Gauntlets +2",
		ring1 = "Ephramad's Ring",
		ring2 = "Niqmaddu Ring",
		back = Brig.STRDA,
		waist = "Fotia Belt",
		legs = "Sulevia's Cuisses +2",
		feet = "Flamma Gambieras +2"  --"Vishap Greaves +3"
	}
	
	sets.precast.WS['Stardiver'].Acc = {
		ammo = "Coiste Bodhar",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = ValorousBody.Quad,
		hands = "Sulevia's Gauntlets +2",
		ring1 = "Ephramad's Ring",
		ring2 = "Niqmaddu Ring",
		back = Brig.STRDA,
		waist = "Fotia Belt",
		legs = "Vishap Brias +3",
		feet = "Flamma Gambieras +2"  --"Vishap Greaves +3"
	}

	sets.precast.WS['Drakesbane'] = {
		ammo = "Knobkierrie",
		head = "Gleti's Mask", 
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Pteroslaver Earring +1",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Niqmaddu Ring",
		ring2 = "Ephramad's Ring",
		back = Brig.STRDA,
		waist = "Ioskeha Belt +1",
		legs = "Gleti's Breeches",
		feet = "Gleti's Boots"
	}
	sets.precast.WS['Drakesbane'].UncappedAtt = {
		ammo = "Knobkierrie",
		head = "Gleti's Mask",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Thrud Earring",
		body = "Hjarrandi Breastplate",
		hands = "Gleti's Gauntlets",
		ring1 = "Niqmaddu Ring",
		ring2 = "Ephramad's Ring",
		back = Brig.STRDA,
		waist = "Ioskeha Belt +1",
		legs = "Gleti's Breeches",
		feet = "Gleti's Boots"
	}
	sets.precast.WS['Drakesbane'].SomeAcc = {
		ammo = "Knobkierrie",
		head = "Gleti's Mask",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Thrud Earring",
		body = "Hjarrandi Breastplate",
		hands = "Gleti's Gauntlets",
		ring1 = "Niqmaddu Ring",
		ring2 = "Ephramad's Ring",
		back = Brig.STRDA,
		waist = "Ioskeha Belt +1",
		legs = "Gleti's Breeches",
		feet = "Gleti's Boots"
	}
	sets.precast.WS['Drakesbane'].Acc = {
		ammo = "Knobkierrie",
		head = "Gleti's Mask",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Thrud Earring",
		body = "Hjarrandi Breastplate",
		hands = "Gleti's Gauntlets",
		ring1 = "Niqmaddu Ring",
		ring2 = "Ephramad's Ring",
		back = Brig.STRDA,
		waist = "Ioskeha Belt +1",
		legs = "Gleti's Breeches",
		feet = "Gleti's Boots"
	}

	sets.precast.WS["Camlann's Torment"] = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Pteroslaver Earring +1",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	sets.precast.WS["Camlann's Torment"].UncappedAtt = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Ishvara Earring",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	sets.precast.WS["Camlann's Torment"].SomeAcc = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Ishvara Earring",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	sets.precast.WS["Camlann's Torment"].Acc = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Ishvara Earring",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}

	sets.precast.WS["Sonic Thrust"] = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Pteroslaver Earring +1",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	sets.precast.WS["Sonic Thrust"].UncappedAtt = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Ishvara Earring",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	sets.precast.WS["Sonic Thrust"].SomeAcc = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Ishvara Earring",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	sets.precast.WS["Sonic Thrust"].Acc = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Thrud Earring",
		ear2 = "Ishvara Earring",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Fotia Belt",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	
	sets.precast.WS["Leg Sweep"] = {
		ammo = "Pemphredo Tathlum",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Crep. Earring",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Regal Ring",
		ring2 = "Flamma Ring",
		back = Brig.STRDA,
		waist = "Fotia Belt",
		legs = "Pteroslaver Brais +3",
		feet = "Gleti's Boots"
	}
	
	sets.precast.WS["Impulse Drive"] = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Pteroslaver Earring +1",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Sailfi Belt +1",
		legs = "Gleti's Breeches",
		feet = "Gleti's Boots"
	}
	sets.precast.WS["Impulse Drive"].UncappedAtt = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3", 
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Thrud Earring",
		body = "Hjarrandi Breast.",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Sailfi Belt +1",
		legs = "Vishap brais +3",
		feet = "Sulevia's Leggings +2"
	}
	sets.precast.WS["Impulse Drive"].SomeAcc = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3", 
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Thrud Earring",
		body = "Hjarrandi Breast.",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Sailfi Belt +1",
		legs = "Vishap brais +3",
		feet = "Sulevia's Leggings +2"
	}
	sets.precast.WS["Impulse Drive"].Acc = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3", 
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Thrud Earring",
		body = "Hjarrandi Breast.",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Sailfi Belt +1",
		legs = "Vishap brais +3",
		feet = "Sulevia's Leggings +2"
	}
	
	sets.precast.WS["Savage Blade"] = {
		ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Pteroslaver Earring +1",
		body = "Peltast's Plackart +3",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Sailfi Belt +1",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}
	sets.precast.WS["Savage Blade"].UncappedAtt = {
		 ammo = "Knobkierrie",
		head = "Peltast's Mezail +3",
		neck = "Dragoon's Collar +2",
		ear1 = "Moonshade Earring",
		ear2 = "Thrud Earring",
		body = "Nyame mail",
		hands = "Pteroslaver Finger Gauntlets +3",
		ring1 = "Epaminondas's Ring",
		ring2 = "Ephramad's ring",
		back = Brig.WSD,
		waist = "Sailfi Belt +1",
		legs = "Vishap brais +3",
		feet = "Nyame sollerets"
	}

	sets.precast.WS['Aeolian Edge'] = {ammo="Ghastly Tathlum +1",
        head="Nyame helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Nyame mail",hands="Nyame gauntlets",ring1="Epaminondas's Ring",ring2="Shiva Ring +1",
        back=Brig.WSD,waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo = "Staunch Tathlum +1",
		head = "Gleti's Mask",
		neck = "Dgn. Collar +2",
		ear2 = "Sherida Earring",
		ear1 = "Telos Earring",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Defending ring",
		ring2 = "Regal Ring",
		back = Brig.STP,
		waist = "Flume Belt +1",
		legs = "Gleti's Breeches",
		feet="Gleti's Boots"}
		
	sets.idle.Refresh = {ammo = "Staunch Tathlum +1",
		head = "Gleti's Mask",
		neck = "Dgn. Collar +2",
		ear2 = "Sherida Earring",
		ear1 = "Telos Earring",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Defending ring",
		ring2 = "Regal Ring",
		back = Brig.STP,
		waist = "Flume Belt +1",
		legs = "Carmine Cuisses +1",
		feet="Gleti's Boots"}

	sets.idle.Weak = set_combine(sets.idle, {})
		
	sets.idle.Reraise = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {ammo = "Staunch Tathlum +1",
		head = "Hjarrandi Helm",
		neck = "Dgn. Collar +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Hjarrandi Breastplate",
		hands = "Gleti's Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Brig.DATP,
		waist = "Ioskeha Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Flamma Gambieras +2"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {})

	sets.defense.MDT = {ammo = "Staunch Tathlum +1",
		head = "Hjarrandi Helm",
		neck = "Dgn. Collar +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Hjarrandi Breastplate",
		hands = "Gleti's Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Niqmaddu Ring",
		back = Brig.DATP,
		waist = "Ioskeha Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Flamma Gambieras +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {})
		
	sets.defense.MEVA = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame helm",
		neck = "Warder's Charm +1",
		ear1 = "Eabani Earring",
		ear2 = "Odnowa Earring +1",
		body = "Gleti's Cuirass",
		hands = "Gleti's Gauntlets",
		ring1 = "Defending Ring",
		ring2 = "Purity Ring",
		back = Brig.FCMeva,
		waist = "Carrier's Sash",
		legs = "Nyame flanchard",
		feet = "Nyame sollerets"
	}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Ethereal Earring",waist="Flume Belt +1"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {head=ValorousMask.TH,waist="Chaac Belt"})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Ternion Dagger +1"}
	sets.weapons.Naegling = {main="Naegling",sub=empty}
	sets.weapons.Quint = {main="Quint Spear",sub="Utu Grip"}
	sets.weapons.Staff = {main="Malignance Pole",sub="Utu Grip"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayWSEars = {ear1="Moonshade Earring",ear2="Sherida Earring",}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {ammo = "Coiste Bodhar",
		head = "Flamma Zucchetto +2",
		neck = "Anu Torque",
		ear2 = "Sherida Earring",
		ear1 = "Dedition Earring",
		body = "Peltast's Plackart +3",
		hands = AcroGauntlets.STP,
		ring1 = "Niqmaddu Ring",
		ring2 = "Dreki Ring",
		back = Brig.DATP,
		waist = "Sailfi Belt +1",
		legs = ValorousHose.STP,
		feet = "Flamma Gambieras +2"}

    sets.engaged.SomeAcc = {ammo = "Coiste Bodhar",
		head = "Flamma Zucchetto +2",
		neck = "Dgn. Collar +2",
		ear2 = "Sherida Earring",
		ear1 = "Telos Earring",
		body = "Peltast's Plackart +3",
		hands = AcroGauntlets.STP,
		ring1 = "Niqmaddu Ring",
		ring2 = "Chirich Ring +1",
		back = Brig.DATP,
		waist = "Ioskeha Belt +1",
		legs = ValorousHose.STP,
		feet = "Flamma Gambieras +2"}
	sets.engaged.Acc = {ammo = "Coiste Bodhar",
		head = "Flamma Zucchetto +2",
		neck = "Dgn. Collar +2",
		ear2 = "Sherida Earring",
		ear1 = "Telos Earring",
		body = "Peltast's Plackart +3",
		hands = "Emicho Gauntlets +1",
		ring1 = "Niqmaddu Ring",
		ring2 = "Chirich Ring +1",
		back = Brig.DATP,
		waist = "Ioskeha Belt +1",
		legs = ValorousHose.STP,
		feet = "Flamma Gambieras +2"}

--[[
    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
]]	
    sets.engaged.DT = {ammo = "Staunch Tathlum +1",
		head = "Hjarrandi Helm",
		neck = "Dgn. Collar +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Gleti's Cuirass", 
		hands = "Peltast's vambraces +3",
		ring1 = "Defending Ring",
		ring2 = "Dreki Ring",
		back = Brig.DATP,
		waist = "Ioskeha Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Flamma Gambieras +2"
	}
		
	sets.engaged.MEVA = {
		ammo = "Staunch Tathlum +1",
		head = "Nyame helm",
		neck = "Dgn. Collar +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Peltast's plackart +3", 
		hands = "Peltast's vambraces +3",
		ring1 = "Defending Ring",
		ring2 = "Dreki Ring",
		back = Brig.DATP,
		waist = "Ioskeha Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Nyame sollerets"
	}
		
	sets.engaged.Acc.DT = {ammo = "Staunch Tathlum +1",
		head = "Nyame helm",
		neck = "Dgn. Collar +2",
		ear1 = "Telos Earring",
		ear2 = "Sherida Earring",
		body = "Peltast's plackart +3", 
		hands = "Peltast's vambraces +3",
		ring1 = "Defending Ring",
		ring2 = "Dreki Ring",
		back = Brig.DATP,
		waist = "Ioskeha Belt +1",
		legs = "Pteroslaver Brais +3",
		feet = "Flamma Gambieras +2"}
--[[	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
]]
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 16)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 003')
end