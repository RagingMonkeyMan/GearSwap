function user_job_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DD','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('Epeolatry','Lionheart','DualWeapons','None')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	OgmaEnmity = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	-- Additional local binds
	send_command('bind !q gs c SubJobEnmity')
	send_command('bind ~q gs c cycle RuneElement')
	send_command('bind ^q gs c RuneElement')
	send_command('bind ~pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind ~delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Lionheart;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

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
	
	OgmaDEXWSD = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
	OgmaSTRDA = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}}
	OgmaEnmity = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}}
	OgmaSTP = { name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
	

    sets.Enmity = {ammo="Sapience Orb",
		head="Halitus helm", neck="Moonlight Necklace", ear1="Trux earring", ear2="Cryptic earring",
		body="Emet Harness +1", hands="Kurys gloves", ring1="Petrov ring", ring2="Eihwaz ring",
		back=OgmaEnmity, waist="Kasiri Belt", legs="Erilaz leg guards +1", feet="Ahosi leggings"}
		 
	sets.Enmity.SIRD = {ammo="Sapience Orb",
		head="Halitus helm", neck="Moonlight Necklace", ear1="Trux earring", ear2="Cryptic earring",
		body="Emet Harness +1", hands="Kurys gloves", ring1="Petrov ring", ring2="Eihwaz ring",
		back=OgmaEnmity, waist="Kasiri Belt", legs="Erilaz leg guards +1", feet="Ahosi leggings"}
		
    sets.Enmity.SIRDT = {ammo="Sapience Orb",
		head="Halitus helm", neck="Moonlight Necklace", ear1="Trux earring", ear2="Cryptic earring",
		body="Emet Harness +1", hands="Kurys gloves", ring1="Petrov ring", ring2="Eihwaz ring",
		back=OgmaEnmity, waist="Kasiri Belt", legs="Erilaz leg guards +1", feet="Ahosi leggings"}

    sets.Enmity.DT = {ammo="Sapience Orb",
		head="Halitus helm", neck="Moonlight Necklace", ear1="Trux earring", ear2="Cryptic earring",
		body="Emet Harness +1", hands="Kurys gloves", ring1="Petrov ring", ring2="Eihwaz ring",
		back=OgmaEnmity, waist="Kasiri Belt", legs="Erilaz leg guards +1", feet="Ahosi leggings"}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Fu. Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +3"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Fu. Bandeau +3"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +3"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head=HercHelmMABWSD,neck="Sanctity Necklace",ear1="Friomisi earring",ear2="Hecate's Earring",
        body="Carmine scale mail +1",hands="Carmine Finger Gauntlets +1",ring1="Stikini ring",ring2="Arvina ringlet +1",
        back="",waist="Eschan stone",legs=HercPantsMAB,feet=HercBootsMABWSD}
		
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Stikini Ring",ring2="Stikini Ring",legs="Rune. Trousers +3"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonlight Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Audumbla Sash",legs="Ayanmo Cosciales +2",feet="Carmine Greaves +1"}
			
	sets.precast.FC.DT = {ammo="Sapience Orb",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Futhark coat +3",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Audumbla Sash",legs="Ayanmo Cosciales +2",feet="Carmine Greaves +1"}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {ammo="Knobkierrie",
            head="Lustratio cap +1", neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands="Meghanada gloves +2", ring1="Ilabrat ring", ring2="Epaminondas's Ring",
            back=OgmaDEXWSD, waist="Fotia belt", legs="Lustratio subligar +1", feet="Lustratio leggings +1"}
	sets.precast.WS.SomeAcc = {ammo="Knobkierrie",
            head="Lustratio cap +1", neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands="Meghanada gloves +2", ring1="Ilabrat ring", ring2="Epaminondas's Ring",
            back=OgmaDEXWSD, waist="Fotia belt", legs="Lustratio subligar +1", feet="Lustratio leggings +1"}
	sets.precast.WS.Acc = {ammo="Knobkierrie",
            head="Lustratio cap +1", neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands="Meghanada gloves +2", ring1="Ilabrat ring", ring2="Epaminondas's Ring",
            back=OgmaDEXWSD, waist="Fotia belt", legs="Lustratio subligar +1", feet="Lustratio leggings +1"}
	sets.precast.WS.HighAcc = {ammo="Knobkierrie",
            head="Lustratio cap +1", neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands="Meghanada gloves +2", ring1="Ilabrat ring", ring2="Epaminondas's Ring",
            back=OgmaDEXWSD, waist="Fotia belt", legs="Lustratio subligar +1", feet="Lustratio leggings +1"}
	sets.precast.WS.FullAcc = {ammo="Knobkierrie",
            head="Lustratio cap +1", neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands="Meghanada gloves +2", ring1="Ilabrat ring", ring2="Epaminondas's Ring",
            back=OgmaDEXWSD, waist="Fotia belt", legs="Lustratio subligar +1", feet="Lustratio leggings +1"}

    sets.precast.WS['Resolution'] = {ammo="Seething bomblet +1",
            head="Lustratio cap +1", neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands=HercGlovesSTRTA, ring1="Epona's Ring", ring2="Niqmaddu ring",
            back=OgmaSTRDA, waist="Fotia belt", legs="Meghanada chausses +2", feet="Lustratio leggings +1"}
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'],{head="Meghanada visor +2"})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS['Resolution'],{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS['Resolution'],{})

    sets.precast.WS['Dimidiation'] = {ammo="Knobkierrie",
            head="Lustratio cap +1", neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands="Meghanada gloves +2", ring1="Ilabrat ring", ring2="Epaminondas's Ring",
            back=OgmaDEXWSD, waist="Fotia belt", legs="Lustratio subligar +1", feet="Lustratio leggings +1"}
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS['Dimidiation'],{ammo="Cath Palug stone"})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS['Dimidiation'],{})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS['Dimidiation'],{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS['Ground Strike'],{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS['Ground Strike'],{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS['Ground Strike'],{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	
	sets.precast.WS['Shockwave'] = {ammo="",
        head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Dignitary's Earring",
        body="Futhark Coat +3",hands="Carmine Finger Gauntlets +1",ring1="Stikini ring",ring2="Stikini ring",
        back=OgmaDEXWSD,waist="Eschan stone",legs="Ayanmo Cosciales +2",feet="Carmine Greaves +1"}
	
	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
            head="Lustratio cap +1",neck="Fotia gorget", ear1="Moonshade Earring", ear2="Sherida Earring",
            body="Adhemar jacket +1", hands="Meghanada gloves +2", ring1="Ilabrat ring", ring2="Epaminondas's Ring",
            back=OgmaDEXWSD, waist="Fotia belt", legs="Lustratio subligar +1", feet="Lustratio leggings +1"}

	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Sapience Orb",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Audumbla Sash",legs="Ayanmo Cosciales +2",feet="Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {ammo="Sapience Orb",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Audumbla Sash",legs="Ayanmo Cosciales +2",feet="Carmine Greaves +1"}
		
	sets.midcast.FastRecast.SIRD = {ammo="Sapience Orb",
            head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
            body="Dread Jupon",hands="Regal Gauntlets",ring1="Prolix Ring",ring2="Kishar Ring",
            back="Moonlight Cape",waist="Audumbla Sash",legs="Ayanmo Cosciales +2",feet="Carmine Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		head="Erilaz galea +1", neck="Colossus's torque", ear1="Andoaa Earring",
		hands="Regal Gauntlets", ring1="Stikini ring",
		back="Merciful cape", waist="Olympus Sash", legs="Futhark trousers +1"
	})
	
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{head="Fu. Bandeau +3",legs="Carmine Cuisses +1"})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +3",neck="Sacro Gorget"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum +1",
        head="Carmine Mask +1",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Phalanx_Received = {main="Deacon Sword",hands=gear.herculean_phalanx_hands,feet=gear.herculean_nuke_feet}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",neck="Loricate torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's coat +3",hands="Regal Gauntlets",ring1="Moonlight ring",ring2="Defending Ring",
		back=OgmaSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Turms leggings +1"}
			
	sets.idle.Tank = {ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",neck="Loricate torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's coat +3",hands="Turms mittens +1",ring1="Moonlight ring",ring2="Defending Ring",
		back=OgmaSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Turms leggings +1"}

	sets.idle.KiteTank = {ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",neck="Loricate torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's coat +3",hands="Regal Gauntlets",ring1="Moonlight ring",ring2="Defending Ring",
		back=OgmaSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Turms leggings +1"}

	sets.idle.Weak = {ammo="Staunch Tathlum +1",
		head="Futhark Bandeau +3",neck="Loricate torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's coat +3",hands="Regal Gauntlets",ring1="Moonlight ring",ring2="Defending Ring",
		back=OgmaSTP,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Turms leggings +1"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +1",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back=OgmaSTP, waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
	sets.defense.PDT_HP = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back="Moonbeam cape", waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
	sets.defense.MDT = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back=OgmaSTP, waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
	sets.defense.MDT_HP = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back=OgmaSTP, waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
	
	sets.defense.BDT = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back=OgmaSTP, waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
	sets.defense.BDT_HP = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back=OgmaSTP, waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
	
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=OgmaEnmity,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
	sets.defense.MEVA_HP = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Warden's Ring",ring2="Eihwaz Ring",
        back=OgmaEnmity,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
        back=OgmaEnmity,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=OgmaEnmity,waist="Engraved Belt",legs="Rune. Trousers +3",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Anu torque", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Samnuha tights", feet="Turms leggings +1"}
    sets.engaged.SomeAcc = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Sanctity Necklace", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Meghanada Chausses +2", feet="Turms leggings +1"}
	sets.engaged.Acc = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Sanctity Necklace", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Meghanada Chausses +2", feet="Turms leggings +1"}
	sets.engaged.HighAcc = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Sanctity Necklace", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Meghanada Chausses +2", feet="Turms leggings +1"}
	sets.engaged.FullAcc = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Sanctity Necklace", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Meghanada Chausses +2", feet="Turms leggings +1"}
	
	sets.engaged.DD = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Anu torque", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Samnuha tights", feet="Turms leggings +1"}
    sets.engaged.SomeAcc.DD = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Anu torque", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Samnuha tights", feet="Turms leggings +1"}
	sets.engaged.Acc.DD = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Anu torque", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Samnuha tights", feet="Turms leggings +1"}
	sets.engaged.HighAcc.DD = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Anu torque", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Samnuha tights", feet="Turms leggings +1"}
	sets.engaged.FullAcc.DD = {ammo="Yamarang",
            head="Futhark Bandeau +3", neck="Anu torque", ear1="Telos Earring",ear2="Sherida Earring",
            body="Runeist's coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Epona's Ring",
            back=OgmaSTP, waist="Windbuffet Belt +1", legs="Samnuha tights", feet="Turms leggings +1"}
			
    sets.engaged.Tank = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back=OgmaSTP, waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
	sets.engaged.Tank_HP = {ammo="Staunch tathlum +1",
            head="Futhark Bandeau +3", neck="Loricate torque +1", ear1="Telos Earring",ear2="Sherida Earring",
            body="Futhark coat +3", hands="Turms mittens +1", ring1="Moonlight ring", ring2="Defending Ring",
            back="Moonbem cape", waist="Flume Belt", legs="Erilaz leg guards +1", feet="Turms leggings +1"}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	set_macro_page(1, 20)
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
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

function user_job_lockstyle()
	if state.Weapons.value == 'Lionheart' then
		windower.chat.input('/lockstyleset 034')
	else
		windower.chat.input('/lockstyleset 033')
	end
end