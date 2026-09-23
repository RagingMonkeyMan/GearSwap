function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal', 'DT')
	state.CastingMode:options('Normal', 'Enmity')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Liberator', 'Caladbolg', 'Apocalypse', 'FatherTime', 'Lycurgos', 'None')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ~` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	Ankou={}
    Ankou.WSDSTR=   { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Damage taken-5%',}}
    Ankou.DA=       { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}}
    Ankou.WSDVIT=   { name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','VIT+10','Weapon skill damage +10%'}}
    Ankou.ACC=		{ name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%'}}
    Ankou.FC=       { name="Ankou's Mantle", augments={'Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','Damage taken-5%'}}
    Ankou.STP=      { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%'}}
	
	ValorousBodyDA = { name="Valorous Mail", augments={'Accuracy+13','"Dbl.Atk."+5',}}
	OdysseanLegsSTP = { name="Odyssean Cuisses", augments={'Accuracy+25 Attack+25','"Store TP"+7','VIT+4','Attack+14',}}
    ValorousBootsSTP = { name="Valorous Greaves", augments={'Accuracy+29','"Store TP"+7','VIT+4',}}
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {hands="Fallen's finger gauntlets +3"}
    sets.precast.JA['Arcane Circle'] = {body="Founder's Breastplate", feet="Ignominy Sollerets +1"}
    sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +1"}
    sets.precast.JA['Souleater'] = {main="Dacnomania", head="Ignominy Burgonet +3"}
    sets.precast.JA['Weapon Bash'] = {hands="Ignominy Gauntlets +2"}
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

	sets.precast.FC = {
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Fallen's Cuirass +3",hands="Leyline Gloves",ring1="Prolix ring",ring2="Kishar Ring",
		back=Ankou.FC,waist="Flume Belt +1",legs="Enif Cosciales",feet="Odyssean Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Malignance Earring",
		body="Fallen's Cuirass +3",hands="Leyline Gloves",ring1="Prolix ring",ring2="Kishar Ring",
		back=Ankou.FC,waist="Tempus Fugit +1",legs="Enif Cosciales",feet="Odyssean Greaves"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Fallen's burgeonet +3",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Carmine scale mail +1",hands="Fallen's finger gauntlets +3",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Niht mantle",waist="Casso Sash",legs="Eschite Cuisses",feet="Ratri sollerets +1",}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Carmine scale mail +1",hands="Fallen's finger gauntlets +3",ring1="Stikini Ring",ring2="Kishar Ring",
		back=Ankou.FC,waist="Casso Sash",legs="Flamma Dirs +2",feet="Ratri sollerets +1"}
		
	sets.midcast['Elemental Magic'] = {
        ammo="Pemphredo Tathlum",
        head="Jumalik helm",
        body="Fallen's Cuirass +3",
        hands="Fallen's finger gauntlets +3",
        legs="Eschite Cuisses",
        feet="Ignominy Sollerets +1",
        neck="Sanctity necklace",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Friomisi Earring",
        left_ring="Stikini Ring",
        right_ring="Shiva Ring",
        back=Ankou.FC,}
		   
	sets.midcast['Dread Spikes'] = {
        ammo="Egoist's Tathlum",
        head="Ratri sallet +1",
		body="Heathen's cuirass +1",
		hands="Ratri gadlings +1",
		legs="Ratri cuisses +1",
		feet="Ratri sollerets +1",
        neck="Sanctity necklace",
        waist="Eschan Stone",
        left_ear="Odnowa Earring",
        right_ear="Odnowa Earring +1",
        left_ring="Moonlight ring",
        right_ring="Moonbeam Ring",
        back=Ankou.FC,}
		
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {ring2="Kishar Ring",back="Ankou's Mantle"})
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Flamma Korazin +2",hands="Flam. Manopolas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Eschan Stone",legs="Eschite Cuisses",feet="Flam. Gambieras +2"}
                   
	sets.midcast.Drain = {
		ammo="Hydrocera",
		head="Fallen's burgeonet +3",
		body="Carmine scale mail +1",
		hands="Fallen's finger gauntlets +3",
		legs="Eschite cuisses",
		feet="Ratri sollerets +1",
		ring1="Evanescence ring",
		ring2="Archon ring",
		neck="Erra pendant",
		waist="Austerity belt +1",
		left_ear="Hirudinea Earring",
		right_ear="Malignance earring",
		back="Niht mantle"}
	
	sets.DrainWeapon = {main="Father Time"}
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.Enmity = {
        ammo="Sapience Orb",
        head="Halitus helm", 
        body="Emet Harness +1", 
        hands="Macabre Gauntlets +1", 
        legs="Odyssean cuisses", 
        feet="Eschite Greaves", 
        neck="Unmoving collar", 
        waist="Kasiri Belt", 
        left_ear="Trux Earring", 
        right_ear="Cryptic earring",
        left_ring="Eihwaz Ring", 
        right_ring="Petrov Ring", 
        back="Enuma mantle"} 
	
	sets.midcast.Stun.Enmity = sets.Enmity
	sets.midcast['Elemental Magic'].Enmity = sets.Enmity
	sets.midcast['Enfeebling Magic'].Enmity = sets.Enmity
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Odyssean helm",neck="Abyssal bead necklace +2",left_ear="Thrud Earring",right_ear="Moonshade Earring",
		body="Ignominy Cuirass +3",hands="Odyssean gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt",legs="Fallen's flanchard +3",feet="Sulevia's leggings +2"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",left_ear="Thrud earring",right_ear="Brutal Earring",
		body="Ignominy Cuirass +3",hands="Ratri gadlings +1",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Ratri cuisses +1", feet="Ratri sollerets +1"})
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Cross Reaper'] = {
        ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Thrud earring",
		body="Ignominy Cuirass +3",hands="Ratri gadlings +1",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Ratri cuisses +1", feet="Ratri sollerets +1"}
    sets.precast.WS['Cross Reaper'].Acc = set_combine(sets.precast.WS['Cross Reaper'], {})
	
	sets.precast.WS['Quietus'] = {
        ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Thrud earring",
		body="Ignominy Cuirass +3",hands="Ratri gadlings +1",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Ratri cuisses +1", feet="Ratri sollerets +1"}
    sets.precast.WS['Quietus'].Acc = set_combine(sets.precast.WS['Quietus'], {})
	
	sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {ammo="Seething bomblet +1",
		head="Ratri sallet +1",neck="Fotia gorget",left_ear="Moonshade Earring",right_ear="Thrud earring",
		body="Ignominy Cuirass +3",hands="Ratri gadlings +1",ring1="Shiva ring",ring2="Shiva ring",
		back=Ankou.ACC,waist="Fotia belt", legs="Fallen's flanchard +3", feet="Ratri sollerets +1"})
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
	sets.precast.WS['Insurgency'] = {
        ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Thrud earring",
		body="Ignominy Cuirass +3",hands="Ratri gadlings +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Ratri cuisses +1", feet="Ratri sollerets +1"}
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS['Insurgency'], {
        back=Ankou.ACC})
	
	sets.precast.WS['Spinning Scythe'] = {
        ammo="Knobkierrie",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",left_ear="Brutal earring",right_ear="Thrud earring",
		body="Ignominy Cuirass +3",hands="Ratri gadlings +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=Ankou.WSDSTR,waist="Fotia belt", legs="Fallen's flanchard +3", feet="Ratri sollerets +1"}
		
	sets.precast.WS['Guillotine'] = {
		ammo="Seething bomblet +1",
		head="Ratri sallet +1",neck="Abyssal bead necklace +2",left_ear="Brutal Earring",right_ear="Thrud earring",
		body="Ignominy Cuirass +3",hands="Ratri gadlings +1",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=Ankou.DA,waist="Fotia belt", legs="Fallen's flanchard +3", feet="Ratri sollerets +1"
	}
 
	sets.precast.WS['Infernal Scythe'] = {   
        ammo="Knobkierrie",
        head="Pixie Hairpin +1",
        body="Fallen's Cuirass +3",
        hands="Fallen's finger gauntlets +3",
        legs="Augury Cuisses +1",
        feet="Founder's greaves",				
        neck="Sanctity necklace",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Fromisi Earring",
        left_ring="Archon Ring",
        right_ring="Epaminondas's Ring",
        back=Ankou.WSDSTR}
 
 
	sets.precast.WS['Shadow of Death'] = {   
        ammo="Knobkierrie",
        head="Pixie Hairpin +1",
        body="Fallen's Cuirass +3",
        hands="Fallen's finger gauntlets +3",
        legs="Augury Cuisses +1",
        feet="Founder's greaves",				
        neck="Sanctity necklace",
        waist="Eschan Stone",
        left_ear="Moonshade Earring",
        right_ear="Malignance Earring",
        left_ring="Archon Ring",
        right_ring="Epaminondas's Ring",
        back=Ankou.WSDSTR}
	
    sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {
		ammo="Knobkierrie",
		head="Odyssean helm",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Thrud Earring",
		body="Ignominy Cuirass +3",hands="Odyssean gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDVIT,waist="Fotia belt",legs="Fallen's flanchard +3",feet="Sulevia's leggings +2"})
    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {
		ammo="Seething bomblet +1",
		head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Brutal Earring",
		body="Argosy hauberk +1",hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Regal ring",
		back=Ankou.DA,waist="Sailfi belt +1",legs="Fallen's flanchard +3",feet="Flamma gambieras +2"})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Scourge'] = {
        ammo="Knobkierrie",
		head="Sulevia's mask +2",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Brutal Earring",
		body="Ignominy Cuirass +3",hands="Sulevia's gauntlets +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Fotia belt",legs="Fallen's flanchard +3",feet="Sulevia's leggings +2"}
    sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS['Scourge'], {})
	
	sets.precast.WS['Sanguine Blade'] = {   
        ammo="Knobkierrie",
        head="Pixie Hairpin +1",
        body="Fallen's Cuirass +3",
        hands="Fallen's finger gauntlets +3",
        legs="Fallen's flanchard +3",
        feet="Ratri Sollerets +1",				
        neck="Fotia gorget",
        waist="Eschan Stone",
        left_ear="Malignance Earring",
        right_ear="Fromisi Earring",
        left_ring="Archon Ring",
        right_ring="Epaminondas's Ring",
        back=Ankou.WSDSTR}
 
    sets.precast.WS['Savage Blade'] = {
        ammo="Knobkierrie",
		head="Odyssean helm",neck="Abyssal bead necklace +2",left_ear="Moonshade Earring",right_ear="Brutal Earring",
		body="Ignominy Cuirass +3",hands="Odyssean gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=Ankou.WSDSTR,waist="Sailfi belt +1",legs="Fallen's flanchard +3",feet="Sulevia's leggings +2"}
         
    sets.precast.WS['Requiescat'] = {
        ammo="Seething bomblet +1",
        head="Carmine Mask +1",
        body="Ignominy Cuirass +3",
        hands="Argosy Mufflers +1",
        legs="Ignominy Flanchard +3",
        feet="Argosy Sollerets +1",
        neck="Abyssal bead necklace +2",
        waist="Sailfi Belt +1",									--WIP
        left_ear="Cessance earring",
        right_ear="Telos earring",
        left_ring="Niqmaddu Ring",
        right_ring="Regal Ring",
        back=Ankou.DA}
 
    sets.precast.WS['Vorpal Blade'] = {
        ammo="Seething bomblet +1",
        head="Argosy Celata +1",
        body="Ignominy Cuirass +3",
        hands="Argosy Mufflers +1",
        legs="Ignominy Flanchard +3",
        feet="Thereoid greaves",						-- WIP
        neck="Abyssal bead necklace +2",
        waist="Sailfi Belt +1",
        left_ear="Cessance earring",
        right_ear="Telos earring",
        left_ring="Niqmaddu Ring",
        right_ring="Begrudging Ring",
        back=Ankou.DA}
		
	sets.precast.WS['Decimation'] = sets.precast.WS['Resolution']
 
	sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS, {waist="Sailfi belt +1"})
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Thrud earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Thrud earring",}
	sets.AccDayWSEars = {ear1="Mache Earring +1",ear2="Telos Earring"}
     
            -- Idle sets
           
    sets.idle = {
		ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Sacro Breastplate",hands="Sulevia's gauntlets +2",ring1="Defending ring",ring2="Chirich Ring +1",
		back=Ankou.DA,waist="Flume belt",legs="Carmine cuisses +1",feet="Sulevia's leggings +2"}
		
    sets.idle.PDT = {
		ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Defending ring",ring2="Chirich Ring +1",
		back=Ankou.DA,waist="Flume belt",legs="Carmine cuisses +1",feet="Sulevia's leggings +2"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
           
    -- Defense sets
	sets.defense.PDT = {
		ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {
		ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {head="Fallen's Burgeonet +3"}
     
	-- Engaged sets
	sets.engaged = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.DT = {ammo="Aurgelmir orb +1",
        ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Acc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
    sets.engaged.FullAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
    sets.engaged.Fodder = {}
	
	-- Apocalypse melee sets
    sets.engaged.Apocalypse = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Apocalypse.DT = {ammo="Aurgelmir orb +1",
        ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Apocalypse.SomeAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Apocalypse.Acc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Apocalypse.FullAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Apocalypse.Fodder = {}
	
	-- Caladblog melee sets
    sets.engaged.Caladbolg = {
		ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	sets.engaged.Caladbolg.DT = {ammo="Aurgelmir orb +1",
        ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Caladbolg.SomeAcc = {
		ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	sets.engaged.Caladbolg.Acc = {
		ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	sets.engaged.Caladbolg.FullAcc = {
		ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"
	}
	sets.engaged.Caladbolg.Fodder = {}
	
	--[[sets.engaged.Caladbolg.AM = {}
	sets.engaged.Caladbolg.SomeAcc.AM = {}
	sets.engaged.Caladbolg.Acc.AM = {}
	sets.engaged.Caladbolg.FullAcc.AM = {}
	sets.engaged.Caladbolg.Fodder.AM = {}]]--
	
	-- Liberator melee sets
    sets.engaged.Liberator = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Liberator.DT = {ammo="Aurgelmir orb +1",
        ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Liberator.SomeAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Liberator.Acc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.Liberator.FullAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	
	sets.engaged.Liberator.AM = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Digni. Earring",right_ear="Telos Earring",
		body="Dagon Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Flamma Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP}
	sets.engaged.Liberator.DT.AM = {ammo="Staunch tathlum +1",
        head="Hjarrandi helm",neck="Abyssal bead necklace +2",left_ear="Mache Earring +1",right_ear="Telos Earring",
		body="Hjarrandi Breastplate",hands="Emicho gauntlets +1",ring1="Defending Ring",ring2="Chirich Ring",
		back=Ankou.STP,waist="Tempus Fugit +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP}
	sets.engaged.Liberator.SomeAcc.AM = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Digni. Earring",right_ear="Telos Earring",
		body="Dagon Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Flamma Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP}
	sets.engaged.Liberator.Acc.AM = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Digni. Earring",right_ear="Telos Earring",
		body="Dagon Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Flamma Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP}
	sets.engaged.Liberator.FullAcc.AM = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Digni. Earring",right_ear="Telos Earring",
		body="Dagon Breastplate",hands="Emicho gauntlets +1",ring1="Niqmaddu Ring",ring2="Flamma Ring",
		back=Ankou.STP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP}
	
	
	-- FatherTime melee sets
    sets.engaged.FatherTime = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.FatherTime.DT = {ammo="Aurgelmir orb +1",
        ammo="Staunch Tathlum +1",
        head="Hjarrandi helm",neck="Loricate torque +1",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body="Hjarrandi breastplate",hands="Sulevia's gauntlets +2",ring1="Moonlight ring",ring2="Defending ring",
		back=Ankou.DA,waist="Tempus fugit +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.FatherTime.SomeAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Brutal Earring",
		body=ValorousBodyDA,hands="Sulevia's gauntlets +2",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.FatherTime.Acc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.FatherTime.FullAcc = {ammo="Aurgelmir orb +1",
        head="Flamma zucchetto +2",neck="Abyssal bead necklace +2",left_ear="Cessance Earring",right_ear="Telos Earring",
		body="Emicho haubert +1",hands="Emicho gauntlets +1",ring1="Regal Ring",ring2="Chirich Ring +1",
		back=Ankou.ACC,waist="Ioskeha belt +1",legs="Ignominy flanchard +3",feet="Flamma gambieras +2"}
	sets.engaged.FatherTime.Fodder = {}
	
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
	
	sets.buff.Souleater = {head="Ignominy Burgonet +3"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {legs="Shabti Cuisses +1", ring1="Blenmont Ring", ring2="Blenmont Ring", waist="Gishdubar Sash"})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	sets.Obi = {waist="Hachirin-no-Obi"}
	
	-- Weapons sets
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Liberator = {main="Liberator",sub="Utu Grip"}
	sets.weapons.FatherTime = {main="Father Time",sub="Utu Grip"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Utu Grip"}
	
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
		
		if state.Buff.Souleater then   
			equip(sets.buff.Souleater)
		end
	end
end

function job_post_midcast(spell, spellMap, eventArgs)

	if (world.weather_element == spell.element or world.day_element == spell.element) and spell.element ~= "Light" then
		equip(sets.Obi)
	end

    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' and spell.english ~= 'Impact' then
        if state.MagicBurstMode.value ~= 'Off' then equip(sets.MagicBurst) end
		if spell.element == world.weather_element or spell.element == world.day_element then
			if state.CastingMode.value == 'Fodder' then
				if spell.element == world.day_element then
					if item_available('Zodiac Ring') then
						sets.ZodiacRing = {ring2="Zodiac Ring"}
						equip(sets.ZodiacRing)
					end
				end
			end
		end
		
		if spell.element and sets.element[spell.element] then
			equip(sets.element[spell.element])
		end
	elseif spell.skill == 'Dark Magic' then
		if state.Buff['Nether Void'] and sets.buff['Nether Void'] and spell.english:startswith('Absorb') then
			equip(sets.buff['Nether Void'])
		end
		if state.Buff['Dark Seal'] and sets.buff['Dark Seal'] and (spell.english:startswith('Absorb') or spell.english == 'Dread Spikes' or spell.english == 'Drain II' or spell.english == 'Drain III') then
			equip(sets.buff['Dark Seal'])
		end
		if (spell.english == 'Drain II' or spell.english == 'Drain III') and state.DrainSwapWeaponMode.value ~= 'Never' then
			if sets.DrainWeapon and (state.DrainSwapWeaponMode.value == 'Always' or tonumber(state.DrainSwapWeaponMode.value) > player.tp) then
				enable('main','sub','range','ammo')
				equip(sets.DrainWeapon)
			end
		end
    end
end