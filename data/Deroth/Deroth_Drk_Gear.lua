function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','SubtleBlow')
    state.WeaponskillMode:options('Match', 'UncappedAtt','PDL','Normal') --,'SomeAcc','Acc','FullAcc'
    state.HybridMode:options('Normal', 'DT')
	state.CastingMode:options('Normal', 'Enmity', "OccultAcumen")
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Liberator', 'Caladbolg', 'Foenaria', 'Anguta', 'Apocalypse', 'Ragnarok', 'Lycurgos', 'Mace', 'Naegling', 'None')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None'} -- ,'MP','Twilight'
	state.DrainSwapWeaponMode = M{'Always','Never','1000'}
	state.DreadSpikesSwapWeaponMode = M{'Always','Never','1000'}
	state.WSEnmityDown = M{['description'] = 'Schere WS','None','Schere'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ~` gs c cycle SkillchainMode')
	send_command('bind ^E gs c cycle WSEnmityDown')
	send_command('bind ^f7 gs c weapons Liberator;gs c update')

	autofood = "Grape Daifuku"
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	Ankou={}
    Ankou.WSDSTR=   { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    Ankou.STRDA=       { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    Ankou.WSDVIT=   { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    Ankou.DA=		{ name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
    Ankou.FC=       { name="Ankou's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}}
    Ankou.STP=      { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	
	OdysseanHeadWSD = { name="Odyssean Helm", augments={'STR+12','"Mag.Atk.Bns."+11','Weapon skill damage +6%',}}
	OdysseanHeadTH = { name="Odyssean Helm", augments={'Accuracy+27','DEX+14','"Treasure Hunter"+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
	ValorousBodyDA = { name="Valorous Mail", augments={'"Dbl.Atk."+5','Accuracy+3',}}
	ValorousBodySTP = { name="Valorous Mail", augments={'Accuracy+30','"Store TP"+3','STR+3','Attack+9',}}
	OdysseanLegsSTP = { name="Odyssean Cuisses", augments={'Accuracy+14 Attack+14','"Store TP"+6','STR+7','Accuracy+12',}}
	OdysseanLegsTH = { name="Odyssean Cuisses", augments={'DEX+6','Mag. Acc.+3','"Treasure Hunter"+1','Accuracy+7 Attack+7','Mag. Acc.+15 "Mag.Atk.Bns."+15',}}
    ValorousBootsSTP = { name="Valorous Greaves", augments={'Accuracy+6 Attack+6','"Store TP"+6','AGI+8','Accuracy+15','Attack+14',}}
	ValorousBootsRefresh = { name="Valorous Greaves", augments={'Pet: DEX+2','VIT+9','"Refresh"+2','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
    OdysseanBootsFC = { name="Odyssean Greaves", augments={'"Fast Cast"+5','CHR+6',}}
	
	ValorousMaskTH = { name="Valorous Mask", augments={'"Fast Cast"+4','Pet: DEX+10','"Treasure Hunter"+2','Accuracy+18 Attack+18','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}
    ValorousBodyPhalanx = { name="Valorous Mail", augments={'Attack+13','DEX+1','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	ValorousMaskPetMAB ={ name="Valorous Mask", augments={'Accuracy+19','Pet: "Mag.Atk.Bns."+30','Accuracy+2 Attack+2','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
    ValorousBodyQuad ={ name="Valorous Mail", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Attack+10','Quadruple Attack +2','Accuracy+18 Attack+18','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}

	AcroGauntletsSTP = { name="Acro Gauntlets", augments={'Accuracy+20','"Store TP"+6','DEX+10',}}
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {hands="Fallen's finger gauntlets +3"}
    sets.precast.JA['Arcane Circle'] = {body="Founder's Breastplate", feet="Ignominy Sollerets +3"}
    sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +3"}
    sets.precast.JA['Souleater'] = {main="Dacnomania", head="Ignominy Burgeonet +3"}
    sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +3"}
    sets.precast.JA['Last Resort'] = {back="Ankou's Mantle",feet="Fallen's Sollerets"}
    sets.precast.JA['Dark Seal'] = {head="Fallen's Burgeonet +3"}
    sets.precast.JA['Blood Weapon'] = {body="Fallen's Cuirass +3"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Fallen's Cuirass +3",hands="Leyline Gloves",ring1="Weatherspoon ring",ring2="Kishar Ring",
		back=Ankou.FC,waist="Flume belt +1",legs="Eschite Cuisses",feet=OdysseanBootsFC}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Fallen's Cuirass +3",hands="Leyline Gloves",ring1="Prolix ring",ring2="Kishar Ring",
		back=Ankou.FC,waist="Tempus fugit +1",legs="Enif Cosciales",feet="Odyssean Greaves"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Fallen's burgeonet +3",neck="Erra Pendant",ear1="Crep. Earring",ear2="Mani Earring",
		body="Carmine scale mail +1",hands="Fallen's finger gauntlets +3",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Niht mantle",waist="Casso Sash",legs="Heathen's flanchard +3",feet="Ratri sollerets +1",}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Null loop",ear1="Crep. Earring",ear2="Malignance Earring",
		body="Heathen's Cuirass +2",hands="Fallen's finger gauntlets +3",ring1="Metamorph Ring +1",ring2="Kishar Ring",
		back="Null Shawl",waist="Null Belt",legs="Heathen's flanchard +3",feet="Heathen's sollerets +3"}
		
	sets.midcast['Elemental Magic'] = {
        ammo="Ghastly Tathlum +1",
        head="Nyame helm",
        body="Fallen's Cuirass +3",
        hands="Fallen's finger gauntlets +3",
        legs="Nyame Flanchard",
        feet="Heathen's Sollerets +3",
        neck="Sibyl Scarf",
        waist="Null Belt",
        left_ear="Friomisi Earring",
        right_ear="Malignance Earring",
        left_ring="Metamorph Ring +1",
        right_ring="Shiva ring +1",
        back="Null Shawl",}

	sets.midcast['Elemental Magic'].OccultAcumen = {
		ammo="Coiste Bodhar",
		head="Flamma zucchetto +2",
		body="Hjarrandi Breastplate",
		hands=AcroGauntletsSTP,
		legs=OdysseanLegsSTP,
		feet="Heathen's Sollerets +3",
		neck="Vim torque +1",
		waist="Oneiros Rope",
		left_ear="Telos Earring",
		right_ear="Dedition Earring",
		left_ring="Chirich Ring +1",
		right_ring="Crepuscular ring",
		back=Ankou.STP,}
		   
	sets.midcast['Dread Spikes'] = {
		main="Crepuscular Scythe",
        ammo="Egoist's Tathlum",
        head="Ratri sallet +1",
		body="Heathen's cuirass +2",
		hands="Ratri gadlings +1",
		legs="Ratri cuisses +1",
		feet="Ratri sollerets +1",
        neck="Unmoving Collar +1",
        waist="Plat. Mog. Belt",
        left_ear="Tuisto Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Gelatinous Ring +1",
        right_ring="Moonlight Ring",
        back=Ankou.FC}
		
	sets.midcast.Absorb = {
		ammo="Pemphredo Tathlum",
		head="Ignominy Burgeonet +3",
		body="Carmine scale mail +1",
		hands="Pavor gauntlets",
		legs="Fallen's flanchard +4",
		feet="Ratri sollerets +1",
		ring1="Evanescence ring",
		ring2="Kishar ring",
		neck="Erra pendant",
		waist="Casso sash",
		left_ear="Mani Earring",
		right_ear="Dark earring",
		back="Chuparrosa mantle"}
           
		   
	sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb, {
		ammo="Pemphredo Tathlum",
        head="Ignominy Burgeonet +3",
        body="Carmine scale mail +1",
        hands="Heathen's Gauntlets +2",
        legs="Heath. Flanchard +3",
        feet="Ratri sollerets +1",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        neck="Null loop",
        waist="Null belt",
        left_ear="Mani Earring",
        right_ear="Malignance earring",
        back="Null Shawl"})

	-- sets.midcast['Absorb-TP'].OccultAcumen = {
	-- 	ammo="Sapience Orb",
	-- 	head="Carmine Mask +1",
	-- 	body="Fallen's Cuirass +3",
	-- 	hands="Heathen's Gauntlets +2",
	-- 	legs="Eschite Cuisses",
	-- 	feet=OdysseanBootsFC,
	-- 	ring1="Weatherspoon ring",
	-- 	ring2="Kishar Ring",
	-- 	neck="Voltsurge Torque",
	-- 	waist="Tempus Fugit +1",
	-- 	ear1="Loquac. Earring",
	-- 	ear2="Malignance Earring",
	-- 	back=Ankou.FC
	-- }

	sets.midcast['Absorb-TP'].OccultAcumen = {
		ammo="Pemphredo Tathlum",
        head="Ignominy Burgeonet +3",
        body="Carmine scale mail +1",
        hands="Heathen's Gauntlets +2",
        legs="Heath. Flanchard +3",
        feet="Ratri sollerets +1",
        ring1="Stikini ring +1",
        ring2="Stikini ring +1",
        neck="Null loop",
        waist="Null belt",
        left_ear="Mani Earring",
        right_ear="Malignance earring",
        back="Null Shawl"
	}
	
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Crep. Earring",ear2="Mani Earring",
		body="Carmine Scale Mail +1",hands="Fallen's finger gauntlets +3",ring1="Stikini ring",ring2="Stikini ring",
		back=Ankou.FC,waist="Null belt",legs="Heathen's flanchard +3",feet="Ignominy sollerets +3"}
                   
	sets.midcast.Drain = {
		ammo="Pemphredo Tathlum",
		head="Fallen's burgeonet +3",
		body="Carmine scale mail +1",
		hands="Fallen's finger gauntlets +3",
		legs="Heathen's flanchard +3",
		feet="Ratri sollerets +1",
		ring1="Evanescence ring",
		ring2="Archon ring",
		neck="Erra pendant",
		waist="Austerity belt +1",
		left_ear="Hirudinea Earring",
		right_ear="Mani earring",
		back="Niht mantle"}
	
	sets.DrainWeapon = {main="Misanthropy"}
	sets.DreadWeapon = {main="Crepuscular Scythe"}
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Enfeebling Magic'], {head=empty,body="Crepuscular Cloak"})

	sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Crepuscular Cloak"})
	
	sets.Enmity = {
        ammo="Sapience Orb",
        head="Loess Barbuta +1", 
        body="Emet Harness +1", 
        hands="Macabre Gauntlets +1", 
        legs="Odyssean cuisses", 
        feet="Eschite Greaves", 
        neck="Unmoving collar +1", 
        waist="Kasiri Belt", 
        left_ear="Trux Earring", 
        right_ear="Cryptic earring",
        left_ring="Eihwaz Ring", 
        right_ring="Petrov Ring", 
        back="Enuma mantle"} 
	
	sets.midcast.Stun.Enmity = sets.Enmity
	sets.midcast['Elemental Magic'].Enmity = sets.Enmity
	sets.midcast['Enfeebling Magic'].Enmity = sets.Enmity
	sets.midcast.Absorb.Enmity = sets.Enmity
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's Earring +1",
		body="Ignominy Cuirass +4",hands="Sakpata's gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}
		
	sets.precast.WS.UncappedAtt = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Heathen's Earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS.UncappedAtt, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS.UncappedAtt, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS.UncappedAtt, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS.UncappedAtt, {})
	
	sets.Schere = {ear2="Schere Earring"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Ignominy Cuirass +4",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}

	sets.precast.WS['Catastrophe'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Ratri Sallet +1",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Ignominy Cuirass +4",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}

	sets.precast.WS['Catastrophe'].PDL = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Sroda Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Sakpata's Cuisses", feet="Heath. Sollerets +3"}

    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Cross Reaper'] = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Ratri gadlings +1",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}
	
	sets.precast.WS['Cross Reaper'].UncappedAtt = {
        ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Thrud earring",
		body="Ignominy Cuirass +4",hands="Ratri gadlings +1",ring1="Ephramad's ring",ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}

	sets.precast.WS['Cross Reaper'].PDL = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Sroda Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS['Cross Reaper'], {})
	
	sets.precast.WS['Quietus'] = {
        ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}

	sets.precast.WS['Quietus'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Ratri gadlings +1",ring1="Ephramad's ring",ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}

    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS['Quietus'], {})
	
	sets.precast.WS['Entropy'] = {ammo="Crepuscular Pebble",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Ephramad's ring",ring2="Niqmaddu ring",
		back=Ankou.STRDA,waist="Fotia belt", legs="Sakpata's Cuisses", feet="Heath. Sollerets +3"}

	sets.precast.WS['Entropy'].UncappedAtt = {ammo="Coiste Bodhar",
		head="Heath. Bur. +3",neck="Fotia gorget",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Ignominy Cuirass +4",hands="Nyame Gauntlets",ring1="Metamorph Ring +1",ring2="Niqmaddu ring",
		back=Ankou.STRDA,waist="Fotia belt", legs="Ignominy flanchard +3", feet="Heath. Sollerets +3"}
    
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Insurgency'] = {
        ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Nyame Flanchard", feet="Heath. Sollerets +3"}

	sets.precast.WS['Insurgency'].PDL = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Ephramad's ring",ring2="Niqmaddu Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Sakpata's Cuisses", feet="Heath. Sollerets +3"}
	
	sets.precast.WS['Insurgency'].UncappedAtt = {
        ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Thrud earring",
		body="Ignominy Cuirass +4",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"}

	sets.precast.WS['Insurgency'].UncappedAtt.DT = {
		ammo="Knobkierrie",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Thrud earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1", legs="Nyame flanchard", feet="Nyame sollerets"}

    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS['Insurgency'], {})
	
	sets.precast.WS['Spinning Scythe'] = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Ignominy Cuirass +4",hands="Ratri gadlings +1",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Fallen's Flanchard +4", feet="Heath. Sollerets +3"}

	sets.precast.WS['Spinning Scythe'].DT = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Nyame mail",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Nyame Flanchard", feet="Heath. Sollerets +3"}

	sets.precast.WS['Spinning Scythe'].PDL = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Sakpata's Cuisses", feet="Heath. Sollerets +3"}
		
	sets.precast.WS['Guillotine'] = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Brutal earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=Ankou.STRDA,waist="Sailfi belt +1", legs="Ignominy Flanchard +3", feet="Heath. Sollerets +3"}

	sets.precast.WS['Guillotine'].PDL = {
		ammo="Crepuscular Pebble",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Brutal earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Sroda Ring",
		back=Ankou.STRDA,waist="Sailfi belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"}
	
	sets.precast.WS['Full Break'] = {
		ammo="Seething bomblet +1",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Thrud Earring",ear2="Heathen's Earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Fallen's flanchard +4", feet="Heath. Sollerets +3"
	}

	sets.precast.WS['Armor Break'] = sets.precast.WS['Full Break']
 
	sets.precast.WS['Infernal Scythe'] = {   
		ammo="Knobkierrie",
        head="Pixie Hairpin +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +3",				
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Friomisi Earring",
        ear2="Malignance Earring",
        left_ring="Archon Ring",
        right_ring="Epaminondas's Ring",
        back=Ankou.WSDSTR}
 
	sets.precast.WS['Shadow of Death'] = {   
        ammo="Knobkierrie",
        head="Pixie Hairpin +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +3",				
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Friomisi Earring",
        ear2="Malignance Earring",
        left_ring="Archon Ring",
        right_ring="Epaminondas's Ring",
        back=Ankou.WSDSTR}

	sets.precast.WS['Origin'] = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi Belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}

	sets.precast.WS['Origin'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Ratri Sallet +1",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi Belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}
	
	sets.precast.WS['Torcleaver'] = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Sakpata's Gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDVIT,waist="Fotia belt",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}
	
    sets.precast.WS['Torcleaver'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Thrud earring",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDVIT,waist="Fotia belt",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}

    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS['Torcleaver'].UncappedAtt, {})
     
    sets.precast.WS['Resolution'] = {
		ammo="Seeth. Bomblet +1",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.STRDA,waist="Fotia belt",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.precast.WS['Resolution'].UncappedAtt = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Schere Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.STRDA,waist="Fotia belt",legs="Ignominy Flanchard +3",feet="Heath. Sollerets +3"}
	
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'], {})

	sets.precast.WS['Fimbulvetr'] = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Sakpata's Gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDVIT,waist="Fotia belt",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}
	
    sets.precast.WS['Fimbulvetr'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Thrud earring",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDVIT,waist="Fotia belt",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}

    sets.precast.WS['Fimbulvetr'].Acc = set_combine(sets.precast.WS['Fimbulvetr'].UncappedAtt, {})

	sets.precast.WS['Scourge'] = {
        ammo="Knobkierrie",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Thrud Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi Belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}

	sets.precast.WS['Scourge'].PDL = {
		ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Sroda Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Sakpata's Cuisses", feet="Heath. Sollerets +3"}

    sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS['Scourge'], {})
	
	sets.precast.WS['Sanguine Blade'] = {   
		ammo="Knobkierrie",
        head="Pixie Hairpin +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Heath. Sollerets +3",				
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Friomisi Earring",
        ear2="Malignance Earring",
        left_ring="Archon Ring",
        right_ring="Epaminondas's Ring",
        back=Ankou.WSDSTR}
 
    sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Sakpata's Breastplate",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Sroda Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}

	sets.precast.WS['Savage Blade'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}
		
    sets.precast.WS['Requiescat'] = {
	ammo="Crepuscular Pebble",
		head="Heath. Bur. +3",neck="Fotia gorget",ear1="Brutal Earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Metamorph ring +1",
		back=Ankou.STRDA,waist="Fotia belt",legs="Sakpata's Cuisses",feet="Heath. Sollerets +3"}
 
    sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Resolution']
	sets.precast.WS['Vorpal Blade'].PDL = sets.precast.WS['Resolution'].PDL
		
	sets.precast.WS['Decimation'] = sets.precast.WS['Resolution']
	sets.precast.WS['Decimation'].PDL = sets.precast.WS['Resolution'].PDL
 
	sets.precast.WS['Fell Cleave'] = {ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Thrud earring",ear2="Heathen's Earring +1",
		body="Sakpata's Breastplate",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Ephramad's ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Sakpata's Cuisses", feet="Heath. Sollerets +3"}

	sets.precast.WS['Fell Cleave'].UncappedAtt = {ammo="Knobkierrie",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}
	
	sets.precast.WS['Judgment'] = {
        ammo="Knobkierrie",
		head="Heath. Bur. +3",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Sakpata's Breastplate",hands="Nyame Gauntlets",ring1="Ephramad's ring",ring2="Sroda Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}

	sets.precast.WS['Judgment'].UncappedAtt = {
		ammo="Knobkierrie",
		head="Nyame helm",neck="Abyssal bead necklace +2",ear1="Moonshade Earring",ear2="Heathen's earring +1",
		body="Ignominy Cuirass +4",hands="Nyame gauntlets",ring1="Ephramad's ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1",legs="Fallen's flanchard +4",feet="Heath. Sollerets +3"}
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Thrud Earring",ear2="Heathen's earring +1",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Thrud Earring",ear2="Heathen's earring +1",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
     
            -- Idle sets
           
    sets.idle = {
		ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Abyssal Bead Necklace +2",ear1="Telos Earring", ear2="Odnowa Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's gauntlets",ring1="Moonlight ring",ring2="Chirich Ring +1",
		back=Ankou.DA,waist="Carrier's sash",legs="Sakpata's Cuisses",feet="Sakpata's leggings"}
		
    sets.idle.PDT = {
		ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Abyssal Bead Necklace +2",ear1="Telos Earring", ear2="Odnowa Earring +1",
		body="Sakpata's Breastplate",hands="Sakpata's gauntlets",ring1="Moonlight ring",ring2="Chirich Ring +1",
		back=Ankou.DA,waist="Carrier's sash",legs="Sakpata's Cuisses",feet="Sakpata's leggings"}

	sets.idle.Weak = set_combine(sets.idle, {})
		
	sets.idle.Reraise = set_combine(sets.idle, {})
		
	sets.defense.MEVA = {
		ammo="Coiste Bodhar",
        head="Sakpata's Helm",neck="Abyssal Bead Necklace +2",ear1="Telos Earring", ear2="Cessance Earring",
		body="Sakpata's Breastplate",hands="Sakpata's gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring +1",
		back=Ankou.DA,waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's leggings"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {}
	sets.buff['Dark Seal'] = {head="Fallen's Burgeonet +3"}
     
	-- Engaged sets
	sets.engaged = {
		ammo="Coiste Bodhar",
		head="Flamma zucchetto +2", neck="Vim Torque +1", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Niqmaddu Ring",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	
	sets.engaged.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Dignitary's Earring", ear2="Telos Earring",
		body="Dagon Breastplate", hands="Sakpata's Gauntlets", ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	
	sets.engaged.DT = {
		ammo="Staunch tathlum +1",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
    sets.engaged.SomeAcc = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Flamma Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Acc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3", neck="Null loop", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Regal Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
    sets.engaged.FullAcc = {
		ammo="Coiste Bodhar",
        head="Heath. Bur. +3",neck="Null loop",ear1="Telos Earring", ear2="Crep. Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	
	-- Apocalypse melee sets
    sets.engaged.Apocalypse = {
		ammo="Coiste Bodhar",
		head="Flamma zucchetto +2", neck="Vim Torque +1", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Niqmaddu Ring",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Apocalypse.DT = {
		ammo="Staunch tathlum +1",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	sets.engaged.Apocalypse.SomeAcc = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Flamma Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Apocalypse.Acc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3", neck="Null loop", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Regal Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Apocalypse.FullAcc = {
		ammo="Seething Bomblet +1",
        head="Heath. Bur. +3",neck="Null loop",ear1="Telos Earring", ear2="Crep. Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	
	sets.engaged.Apocalypse.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Dignitary's Earring", ear2="Telos Earring",
		body="Dagon Breastplate", hands="Sakpata's Gauntlets", ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}

	-- Foenaria melee sets
    sets.engaged.Foenaria = {
		ammo="Coiste Bodhar",
		head="Flamma zucchetto +2", neck="Vim Torque +1", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Niqmaddu Ring",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Foenaria.DT = {
		ammo="Staunch tathlum +1",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	sets.engaged.Foenaria.SomeAcc = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Flamma Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Foenaria.Acc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3", neck="Null loop", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Regal Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Foenaria.FullAcc = {
		ammo="Seething Bomblet +1",
        head="Heath. Bur. +3",neck="Null loop",ear1="Telos Earring", ear2="Crep. Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	
	sets.engaged.Foenaria.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Dignitary's Earring", ear2="Telos Earring",
		body="Dagon Breastplate", hands="Sakpata's Gauntlets", ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	
	-- Caladbolg melee sets
    sets.engaged.Caladbolg = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Brutal Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Petrov Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Sakpata's Leggings"
	}
	sets.engaged.Caladbolg.DT = {
		ammo="Staunch tathlum +1",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	sets.engaged.Caladbolg.SomeAcc = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Flamma Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Caladbolg.Acc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3", neck="Null loop", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Regal Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Caladbolg.FullAcc = {
		ammo="Seething Bomblet +1",
        head="Heath. Bur. +3",neck="Null loop",ear1="Telos Earring", ear2="Crep. Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	
	sets.engaged.Caladbolg.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Dignitary's Earring", ear2="Telos Earring",
		body="Dagon Breastplate", hands="Sakpata's Gauntlets", ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	
	--[[sets.engaged.Caladbolg.AM = {}
	sets.engaged.Caladbolg.SomeAcc.AM = {}
	sets.engaged.Caladbolg.Acc.AM = {}
	sets.engaged.Caladbolg.FullAcc.AM = {}
	sets.engaged.Caladbolg.Fodder.AM = {}]]--
	
	-- Caladbolg melee sets
    sets.engaged.Ragnarok = {
		ammo="Coiste Bodhar",
		head="Sakpata's Helm", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Cessance Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Petrov Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Sakpata's Leggings"
	}
	sets.engaged.Ragnarok.DT = {
		ammo="Staunch tathlum +1",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	sets.engaged.Ragnarok.SomeAcc = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Flamma Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Ragnarok.Acc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3", neck="Null loop", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Regal Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Ragnarok.FullAcc = {
		ammo="Seething Bomblet +1",
        head="Heath. Bur. +3",neck="Null loop",ear1="Telos Earring", ear2="Crep. Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	sets.engaged.Ragnarok.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Dignitary's Earring", ear2="Telos Earring",
		body="Dagon Breastplate", hands="Sakpata's Gauntlets", ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	
	--[[sets.engaged.Ragnarok.AM = {}
	sets.engaged.Ragnarok.SomeAcc.AM = {}
	sets.engaged.Ragnarok.Acc.AM = {}
	sets.engaged.Ragnarok.FullAcc.AM = {}
	sets.engaged.Ragnarok.Fodder.AM = {}]]--
	
	-- Liberator melee sets
    sets.engaged.Liberator = {ammo="Coiste Bodhar",
		head="Sakpata's Helm", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Petrov Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Sakpata's Leggings"
	}
	sets.engaged.Liberator.DT = {
        ammo="Staunch tathlum +1",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	sets.engaged.Liberator.SomeAcc = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Flamma Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Liberator.Acc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3", neck="Null loop", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Regal Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Liberator.FullAcc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3",neck="Null loop",ear1="Telos Earring", ear2="Crep. Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	
	sets.engaged.Liberator.AM = {
		ammo="Coiste Bodhar",
        head="Flamma zucchetto +2",neck="Vim torque +1",ear1="Telos Earring", ear2="Crep. Earring",
		body="Hjarrandi Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Moonlight Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP
	}
	sets.engaged.Liberator.DT.AM = {
		ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Vim torque +1",ear1="Telos Earring",ear2="Crep. Earring",
		body="Hjarrandi Breastplate",hands="Emicho gauntlets +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=Ankou.STP,waist="Tempus fugit +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP
	}
	sets.engaged.Liberator.SomeAcc.AM = {
		ammo="Coiste Bodhar",
        head="Flamma zucchetto +2",neck="Vim torque +1",ear1="Telos Earring", ear2="Crep. Earring",
		body="Hjarrandi Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Flamma Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP
	}
	sets.engaged.Liberator.Acc.AM = {
		ammo="Coiste Bodhar",
        head="Flamma zucchetto +2",neck="Vim torque +1",ear1="Telos Earring", ear2="Crep. Earring",
		body="Hjarrandi Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Flamma Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP
	}
	sets.engaged.Liberator.FullAcc.AM = {
		ammo="Coiste Bodhar",
        head="Flamma zucchetto +2",neck="Vim torque +1",ear1="Telos Earring", ear2="Crep. Earring",
		body="Hjarrandi Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Flamma Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP
	}
	sets.engaged.Liberator.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Dignitary's Earring", ear2="Telos Earring",
		body="Dagon Breastplate", hands="Sakpata's Gauntlets", ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	
	-- Anguta melee sets
    sets.engaged.Anguta = {ammo="Coiste Bodhar",
		head="Sakpata's Helm", neck="Abyssal Beads +2", ear1="Brutal Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Petrov Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Sakpata's Leggings"
	}
	sets.engaged.Anguta.DT ={
		ammo="Staunch tathlum +1",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Dedition Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Moonlight Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	sets.engaged.Anguta.SomeAcc = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Flamma Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Anguta.Acc = {
		ammo="Seething Bomblet +1",
		head="Heath. Bur. +3", neck="Null loop", ear1="Telos Earring", ear2="Crep. Earring",
		body="Sakpata's Breastplate", hands="Sakpata's Gauntlets", ring1="Regal Ring", ring2="Chirich Ring +1",
		back="Null Shawl", waist="Ioskeha Belt +1", legs="Ig. Flanchard +3", feet="Flamma gambieras +2"
	}
	sets.engaged.Anguta.FullAcc = {
		ammo="Seething Bomblet +1",
        head="Heath. Bur. +3",neck="Null loop",ear1="Telos Earring", ear2="Crep. Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Ioskeha Belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	sets.engaged.Anguta.SubtleBlow = {
		ammo="Coiste Bodhar",
		head="Heath. Bur. +3", neck="Abyssal Beads +2", ear1="Dignitary's Earring", ear2="Telos Earring",
		body="Dagon Breastplate", hands="Sakpata's Gauntlets", ring1="Niqmaddu Ring", ring2="Chirich Ring +1",
		back=Ankou.DA, waist="Ioskeha Belt +1", legs="Sakpata's Cuisses", feet="Sakpata's Leggings"
	}
	
--Example sets:
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Liberator melee sets
    sets.engaged.Liberator = {}
	sets.engaged.Liberator.SomeAcc = {}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    sets.engaged.Liberator.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.Adoulin = {}
	sets.engaged.Liberator.Acc.Adoulin = {}
	sets.engaged.Liberator.FullAcc.Adoulin = {}
	sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {}
	sets.engaged.Liberator.SomeAcc.AM = {}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    sets.engaged.Liberator.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {}
	sets.engaged.Liberator.SomeAcc.PDT = {}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	sets.engaged.Liberator.PDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	sets.engaged.Liberator.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	sets.engaged.Liberator.MDT.Adoulin = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	sets.engaged.Liberator.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}
]]--
	--Extra Special Sets
	
	sets.buff.Souleater = {head="Ignominy Burgeonet +3"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {legs="Shabti Cuisses +1", ring1="Blenmont Ring", ring2="Blenmont Ring", waist="Gishdubar Sash"})
	sets.buff.Sleep = {head="Vim torque +1"}
	
	sets.Obi = {waist="Hachirin-no-Obi"}
	
	-- Weapons sets
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Ragnarok = {main="Ragnarok",sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Liberator = {main="Liberator",sub="Utu Grip"}
	sets.weapons.Anguta = {main="Anguta",sub="Utu Grip"}
	sets.weapons.FatherTime = {main="Father Time",sub="Utu Grip"}
	sets.weapons.Mace = {main="Loxotic Mace +1",sub="Blurred Shield +1"}
	sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Utu Grip"}
	sets.weapons.Foenaria = {main="Foenaria",sub="Utu Grip"}
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
	set_macro_page(1, 8)
   --[[ if player.sub_job == 'WAR' then
        set_macro_page(2, 15)
    elseif player.sub_job == 'SAM' then
        set_macro_page(3, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(4, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 15)
    else
        set_macro_page(5, 15)
    end]]--
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 018')
end

-- Run after the general precast() is done.
function job_post_precast(spell, spellMap, eventArgs)
	
	if (world.weather_element == spell.element or world.day_element == spell.element) and spell.element ~= "Light" then
		equip(sets.Obi)
	end
	
	if spell.type == 'WeaponSkill' then

		local WSset = standardize_set(get_precast_set(spell, spellMap))
		local wsacc = check_ws_acc()
		
		if (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			-- Replace Moonshade Earring if we're at cap TP
			if get_effective_player_tp(spell, WSset) > 3200 then
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccMaxTP then
					local AccMaxTPset = standardize_set(sets.AccMaxTP)

					if (AccMaxTPset.ear1:startswith("Lugra Earring") or AccMaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayMaxTPWSEars then
						equip(sets.AccDayMaxTPWSEars[spell.english] or sets.AccDayMaxTPWSEars)
					else
						equip(sets.AccMaxTP[spell.english] or sets.AccMaxTP)
					end
				elseif sets.MaxTP then
					local MaxTPset = standardize_set(sets.MaxTP)
					if (MaxTPset.ear1:startswith("Lugra Earring") or MaxTPset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayMaxTPWSEars then
						equip(sets.DayMaxTPWSEars[spell.english] or sets.DayMaxTPWSEars)
					else
						equip(sets.MaxTP[spell.english] or sets.MaxTP)
					end
				else
				end
			else
				if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayWSEars then
					equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
				elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayWSEars then
					equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
				end
			end
		elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn then
			if wsacc:contains('Acc') and not buffactive['Sneak Attack'] and sets.AccDayWSEars then
				equip(sets.AccDayWSEars[spell.english] or sets.AccDayWSEars)
			elseif sets.DayWSEars then
				equip(sets.DayWSEars[spell.english] or sets.DayWSEars)
			end
		end
		
		if state.WSEnmityDown.value == 'Schere' then
			equip(sets.Schere)
		end
		
		if state.Buff.Souleater then   
			equip(sets.buff.Souleater)
		end
	end
end