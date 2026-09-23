function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Turtle','MEVA','ShieldTank', 'Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal','SIRD')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT','ShieldTank')
    state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA','Death','Charm')
	state.IdleMode:options('Normal','ShieldTank','KiteTank','Refresh','Reraise')
	state.Weapons:options('Ochain','NaeglingOchain','Aegis','NaeglingAegis','Duban','NaeglingDuban','NaeglingBlurred',"Caladbolg","MaceOchain","MaceAegis","Aeolian","DualWeapons","DualAeolian","None")
	state.AutoEmblem = M(false, 'Auto Emblem')
	state.UnlockWeapons = M(true, 'Unlock Weapons')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}

	-- Additional local binds

	-- send_command('bind ^a gs c weapons Aegis')
	-- send_command('bind ^o gs c weapons Ochain')
	-- send_command('bind ^d gs c weapons Duban')
	-- send_command('bind ^m gs c weapons MaceOchain')
	-- send_command('bind ^c gs c weapons Caladbolg')

	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^f7 gs c weapons Ochain;gs c update')
	
    select_default_macro_book()
    update_defense_mode()
end

function init_gear_sets()

	RudianosFastcast = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	RudianosSIRD = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Spell interruption rate down-10%',}}
	RudianosTurtle = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}}
	RudianosTP = { name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	RudianosSTRWS = { name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

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
    ValorousBodyPhalanx = { name="Valorous Mail", augments={'Attack+13','DEX+1','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {ammo="Sapience Orb",
        head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Cryptic Earring",ear2="Trux Earring",
        body="Souv. Cuirass +1",hands="Yorium Gauntlets",ring1="Eihwaz Ring",ring2="Supershear Ring",
        back=RudianosTurtle,waist="Creed Baudrier",legs="Souv. Diechlings +1",feet="Chev. Sabatons +3"}  
		
    sets.Enmity.SIRD = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Moonlight Necklace",ear1="Cryptic Earring",ear2="Trux Earring",
		body="Souv. Cuirass +1",hands="Yorium Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
		back=RudianosTurtle,waist="Audumbla sash",legs="Founder's Hose",feet=OdysseanBootsFC}
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +3"}) 
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +3"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +3"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{head="Cab. Coronet +3"})
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +3"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
		head="Chev. Armet +3",neck="Phalaina Locket",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +2",ring1="Stikini Ring",ring2="Rufescent Ring",
		back=RudianosTurtle,waist="Luminary Sash",legs="Chev. Cuisses +3",feet="Chev. Sabatons +3"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {hands="Cab. Gauntlets +2"})		
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {hands="Cab. Gauntlets +2"})		
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
		head="Carmine Mask +1",
		body="Rev. Surcoat +3",ring1="Asklepian Ring",ring2="Valseur's Ring",
		waist="Chaac Belt"}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
		
    sets.precast.FC = {ammo="Sapience Orb",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Leyline gloves",ring1="Gelatinous Ring +1",ring2="Weatherspoon Ring",
        back=RudianosFastcast,waist="Plat. Mog. Belt",legs="Sakpata's Cuisses",feet=OdysseanBootsFC}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Coiste Bodhar",
        head="Sakpata's Helm",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
        back=RudianosSTRWS,waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.precast.WS.DT = {ammo="Coiste Bodhar",
        head="Sakpata's Helm",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
        back=RudianosSTRWS,waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

    sets.precast.WS.Acc = {ammo="Coiste Bodhar",
        head="Sakpata's Helm",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
        back=RudianosSTRWS,waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = {ammo="Coiste Bodhar",
        head="Sakpata's Helm",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
        back=RudianosSTRWS,waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Chant du Cygne'] = {}
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = {ammo="Crepuscular Pebble",
        head="Nyame helm",neck="Unmoving Collar +1",ear1="Moonshade Earring",ear2="Thrud Earring",
        body="Nyame mail",hands="Nyame gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
        back=RudianosSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Judgment'] = {ammo="Coiste Bodhar",
        head="Nyame helm",neck="Unmoving Collar +1",ear1="Moonshade Earring",ear2="Thrud Earring",
        body="Nyame mail",hands="Nyame gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
        back=RudianosSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Hexa Strike'] = {ammo="Coiste Bodhar",
        head="Sakpata's Helm",neck="Fotia Gorget",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Ephramad's Ring",
        back=RudianosSTRWS,waist="Sailfi belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
	
	sets.precast.WS['Flat Blade'] = {ammo="Coiste Bodhar",
        head="Founder's Corona",neck="Fotia Gorget",ear1="Gwati Earring",ear2="Crep. Earring",
        body="Rev. Surcoat +3",hands="Leyline Gloves",ring1="Defending Ring",ring2="Stikini Ring +1",
        back="Ground. Mantle +1",waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Founder's Greaves"}

	sets.precast.WS['Flat Blade'].Acc = {ammo="Coiste Bodhar",
        head="Chev. Armet +3",neck="Sanctity Necklace",ear1="Gwati Earring",ear2="Crep. Earring",
        body="Rev. Surcoat +3",hands="Sakpata's Gauntlets",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
        back="Ground. Mantle +1",waist="Eschan Stone",legs="Chev. Cuisses +3",feet="Chev. Sabatons +3"}

    sets.precast.WS['Sanguine Blade'] = {ammo="Ghastly Tathlum",
        head=empty,neck="Unmoving Collar +1",ear1="Moonshade Earring",ear2="Tuisto Earring",
        body="Cohort Cloak +1",hands="Carmine Fin. Ga. +1",ring1="Epaminondas's ring",ring2="Archon Ring",
        back="Moonbeam Cape",waist="Plat. Mog. Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.WS['Sanguine Blade'].Acc = sets.precast.WS['Sanguine Blade']

    sets.precast.WS['Atonement'] = {ammo="Sapience Orb",
		head="Loess Barbuta +1",neck="Moonlight Necklace",ear1="Moonshade Earring",ear2="Trux Earring",
		body="Souv. Cuirass +1",hands="Souv. Handsch. +1",ring1="Eihwaz Ring",ring2="Supershear Ring",
		back=RudianosTurtle,waist="Fotia Belt",legs="Souv. Diechlings +1",feet="Eschite Greaves"}

	sets.precast.WS['Atonement'].Proc = {ammo="Coiste Bodhar",
		head="Nyame helm",neck="Unmoving Collar +1",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
		back=RudianosSTRWS,waist="Fotia belt",legs="Nyame flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Atonement'].Acc = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'] = sets.precast.WS['Atonement']
    sets.precast.WS['Spirits Within'].Acc = sets.precast.WS['Atonement']
	
	sets.precast.WS['Torcleaver'] = {ammo="Crepuscular Pebble",
		head="Nyame helm",neck="Rep. Plat. Medal",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame mail",hands="Nyame gauntlets",ring1="Epaminondas's Ring",ring2="Ephramad's ring",
		back=RudianosSTRWS,waist="Sailfi belt +1",legs="Nyame flanchard",feet="Nyame Sollerets"}
		

	 sets.precast.WS['Aeolian Edge'] = {ammo="Ghastly Tathlum +1",
        head="Nyame helm",neck="Sybil Scarf",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Nyame mail",hands="Nyame gauntlets",ring1="Epaminondas's Ring",ring2="Shiva ring +1",
        back=RudianosSTRWS,waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Thrud Earring",ear2="Brutal Earring",}
	sets.AccMaxTP = {ear1="Thrud Earring",ear2="Telos Earring"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {ammo="Sapience orb",
		head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Kishar Ring",
		back=RudianosFastcast,waist="Plat. Mog. Belt",legs="Eschite Cuisses",feet=OdysseanBootsFC}
		
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Rev. Surcoat +3",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back=RudianosFastcast,waist="Plat. Mog. Belt",legs="Souv. Diechlings +1",feet="Souveran Schuhs +1"}

    sets.midcast.Flash = set_combine(sets.Enmity, {body="Rev. Surcoat +3"})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {body="Rev. Surcoat +3"})
    sets.midcast.Stun = set_combine(sets.Enmity, {body="Rev. Surcoat +3"})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {body="Rev. Surcoat +3"})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'].TH = set_combine(sets.Enmity, sets.TreasureHunter)
	sets.midcast['Banishga'] = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Banishga'].TH = set_combine(sets.Enmity.SIRD, sets.TreasureHunter)
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Sacro Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Solemnity Cape",waist="Plat. Mog. Belt",legs="Carmine Cuisses +1",feet=OdysseanBootsFC}
		
    sets.midcast.Cure.SIRD = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Moonlight necklace",ear1="Odnowa Earring +1",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=RudianosTurtle,waist="Audumbla sash",legs="Founder's Hose",feet=OdysseanBootsFC}
		
	sets.midcast.Reprisal = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Moonlight necklace",ear1="Odnowa Earring +1",ear2="Cryptic Earring",
        body="Shab. Cuirass +1",hands="Regal gauntlets",ring1="Supershear Ring",ring2="Eihwaz Ring",
        back=RudianosFastcast,waist="Creed Baudrier",legs="Souveran Diechlings +1",feet="Eschite Greaves"}
		
	sets.midcast.Reprisal.SIRD = {main="Sakpata's Sword",ammo="Staunch tathlum +1",
		head="Souveran Schaller +1",neck="Loricate torque +1",ear1="Odnowa Earring +1",ear2="Cryptic Earring",
        body="Shab. Cuirass +1",hands="Regal gauntlets",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back=RudianosFastcast,waist="Audumbla sash",legs="Founder's Hose",feet=OdysseanBootsFC}

	sets.Self_Healing = {ammo="Staunch Tathlum +1",
		head="Loess Barbuta +1",neck="Sacro Gorget",ear1="Nourish. Earring",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Solemnity Cape",waist="Plat. Mog. Belt",legs="Carmine Cuisses +1",feet=OdysseanBootsFC}
		
	sets.Self_Healing.SIRD = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Moonlight necklace",ear1="Odnowa Earring +1",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=RudianosTurtle,waist="Audumbla sash",legs="Founder's Hose",feet=OdysseanBootsFC}

	sets.midcast.Raise = {ammo="Staunch Tathlum +1",
		head="Souveran Schaller +1",neck="Moonlight necklace",ear1="Odnowa Earring +1",ear2="Nourish. Earring +1",
		body="Souv. Cuirass +1",hands="Macabre Gaunt. +1",ring1="Defending Ring",ring2="Moonlight Ring",
		back=RudianosTurtle,waist="Audumbla sash",legs="Founder's Hose",feet=OdysseanBootsFC}

	sets.Cure_Received = {}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Shab. Cuirass +1",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Kishar Ring",
		back=RudianosFastcast,waist="Olympus Sash",legs="Carmine Cuisses +1",feet=OdysseanBootsFC}
		
    sets.midcast['Enhancing Magic'].SIRD = {ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",neck="Loricate torque +1",ear1="Mimir Earring",ear2="Tuisto Earring",
		body="Shab. Cuirass +1",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
		back=RudianosTurtle,waist="Olympus Sash",legs="Founder's Hose",feet=OdysseanBootsFC}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {sub="Duban",ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.Phalanx = {
		main="Sakpata's Sword", -- 5
		sub="Priwen", --2
		ammo="Staunch Tathlum +1",
		head="Yorium barbuta", --3
		body=ValorousBodyPhalanx, --5
		hands="Souv. Handsch. +1", --5
		legs="Sakpata's Cuisses", --5
		feet="Souveran Schuhs +1", --5
		neck="Unmoving Collar +1",
		waist="Olympus Sash", 
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring",
		right_ring="Stikini Ring",
		back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+4','Phalanx +5',}} -- 5
	}
	
	-- sets.midcast.Phalanx.SIRD = {
	-- 	main="Sakpata's Sword",
	-- 	sub="Priwen",
	-- 	ammo="Staunch Tathlum +1",
	-- 	head="Yorium barbuta", --3
	-- 	body=ValorousBodyPhalanx,
	-- 	hands="Souv. Handsch. +1,
	-- 	legs="Sakpata's Cuisses",
	-- 	feet="Souveran Schuhs +1,
	-- 	neck="Unmoving Collar +1",
	-- 	waist="Olympus Sash",
	-- 	left_ear="Andoaa Earring",
	-- 	right_ear="Mimir Earring",
	-- 	left_ring="Stikini Ring",
	-- 	right_ring="Stikini Ring",
	-- 	back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+4','Phalanx +5',}}
	-- }
	
	sets.midcast.Phalanx.DT = set_combine(sets.midcast.Phalanx, {})	
	sets.Phalanx_Received = {
		main="Sakpata's Sword", -- 5
		sub="Priwen", --2
		ammo="Staunch Tathlum +1",
		head="Yorium barbuta", --3
		body=ValorousBodyPhalanx, --5
		hands="Souv. Handsch. +1", --5
		legs="Sakpata's Cuisses", --5
		feet="Souveran Schuhs +1", --5
		neck="Unmoving Collar +1",
		waist="Flume belt +1", 
		ear1="Odnowa Earring +1",
		ear2="Tuisto Earring",
		left_ring="Defending Ring",
		right_ring="Moonlight Ring",
		back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+4','Phalanx +5',}} -- 5
	}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

    sets.resting = {ammo="Homiliary",
		head="Jumalik Helm",neck="Coatl Gorget +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Crepuscular Mail",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Moonlight Cape",waist="Fucho-no-obi",legs="Chev. Cuisses +3",feet="Cab. Leggings +1"}

    -- Idle sets
    sets.idle = {ammo="Eluder's Sachet",
        head="Chev. Armet +3",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
        back=RudianosTurtle,waist="Flume Belt +1",legs="Chev. Cuisses +3",feet="Sakpata's Leggings"}
		
		
	sets.idle.Refresh = {ammo="Homiliary",
		head="Jumalik Helm",neck="Coatl Gorget +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Crepuscular Mail",hands="Regal Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Souv. Diechlings +1",feet="Cab. Leggings +1"}

	sets.idle.ShieldTank = {ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",neck="Loricate Torque +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Sakpata's Breastplate",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight ring",
		back=RudianosTurtle,waist="Flume Belt +1",legs="Chev. Cuisses +3",feet="Souveran Schuhs +1"}
		
	sets.idle.KiteTank = {ammo="Eluder's Sachet",
        head="Chev. Armet +3",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
        back=RudianosTurtle,waist="Flume Belt +1",legs="Chev. Cuisses +3",feet="Sakpata's Leggings"}
		
    -- sets.idle.Reraise = {ammo="Staunch Tathlum +1",
	-- 	head="Twilight Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
	-- 	body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight ring",
	-- 	back="Moonlight Cape",waist="Flume Belt +1",legs="Chev. Cuisses +3",feet="Cab. Leggings +1"}
		
    -- sets.idle.Weak = {ammo="Staunch Tathlum +1",
	-- 	head="Twilight Helm",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
	-- 	body="Twilight Mail",hands="Souv. Handsch. +1",ring1="Gelatinous Ring +1",ring2="Moonlight ring",
	-- 	back="Moonlight Cape",waist="Flume Belt +1",legs="Chev. Cuisses +3",feet="Cab. Leggings +1"}
		
	sets.Kiting = {legs="Carmine Cuisses +1"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.latent_regen = {ring1="Apeile Ring +1",ring2="Apeile Ring"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +3",waist="Flume Belt +1"} -- feet="Rev. Leggings +3"
	sets.passive.AbsorbMP = {head="Chev. Armet +3",waist="Flume Belt +1"} -- feet="Rev. Leggings +3"
    sets.MP_Knockback = {}
    sets.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Ochain = {main="Burtgang",sub="Ochain"}
	sets.weapons.Aegis = {main="Burtgang",sub="Aegis"}
	sets.weapons.NaeglingOchain = {main="Naegling",sub="Ochain"}
	sets.weapons.NaeglingAegis = {main="Naegling",sub="Aegis"}
	sets.weapons.Duban = {main="Burtgang",sub="Duban"}
	sets.weapons.NaeglingDuban = {main="Naegling",sub="Duban"}
	sets.weapons.NaeglingBlurred = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.DualWeapons = {main="Burtgang",sub="Ternion Dagger +1"} --Demersal Degen +1
	sets.weapons.MaceOchain = {main="Beryllium mace",sub="Ochain"}
	sets.weapons.MaceAegis = {main="Beryllium mace",sub="Aegis"}
	sets.weapons.Caladbolg = {main="Caladbolg",sub="Bloodrain Strap"}
	sets.weapons.Aeolian = {main={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},sub="Ochain"}
	sets.weapons.DualAeolian = {main="Malevolence",sub="Malevolence"}
    
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight ring",
		back=RudianosTurtle,waist="Carrier's sash",legs="Chev. Cuisses +3",feet="Sakpata's Leggings"}
   
	sets.defense.ShieldTank = {ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight ring",
		back=RudianosTurtle,waist="Carrier's sash",legs="Chev. Cuisses +3",feet="Sakpata's Leggings"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Sakpata's helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight ring",
		back=RudianosTurtle,waist="Carrier's sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.defense.Death = set_combine(sets.defense.MEVA, {ring1="Warden's Ring",ring2="Shadow Ring"})
		
	sets.defense.Charm = set_combine(sets.defense.MEVA, {neck="Unmoving Collar +1",back="Solemnity Cape"})
		
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Petrov Ring",
		back=RudianosTP,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

    sets.engaged.Acc = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Petrov Ring",
		back=RudianosTP,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.engaged.Turtle = {ammo="Eluder's Sachet",
        head="Chev. Armet +3",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Warden's Ring",
        back=RudianosTurtle,waist="Carrier's sash",legs="Chev. Cuisses +3",feet="Sakpata's Leggings"}
		
	sets.engaged.MEVA = {ammo="Staunch Tathlum +1",
        head="Sakpata's Helm",neck="Unmoving Collar +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Petrov Ring",
        back=RudianosTurtle,waist="Carrier's sash",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		
	sets.engaged.Caladbolg = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim torque +1",ear1="Cessance Earring",ear2="Telos Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Petrov Ring",
		back=RudianosTP,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

    sets.engaged.Caladbolg.Acc = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim torque +1",ear1="Cessance Earring",ear2="Telos Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Petrov Ring",
		back=RudianosTP,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

    sets.engaged.DW = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim torque +1",ear1="Eabani Earring",ear2="Brutal Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Petrov Ring",
		back=RudianosTP,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.engaged.DW.AM = {ammo="Coiste Bodhar",
		head="Flamma zucchetto +2",neck="Vim torque +1",ear1="Telos Earring", ear2="Eabani Earring",
		body="Hjarrandi Breastplate",hands="Emicho gauntlets +1",ring1="Chirich Ring +1",ring2="Moonlight Ring",
		back=RudianosTP,waist="Sailfi Belt +1",legs=OdysseanLegsSTP,feet=ValorousBootsSTP}

    sets.engaged.DW.Acc = {ammo="Coiste Bodhar",
		head="Sakpata's Helm",neck="Vim torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Sakpata's Breastplate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Petrov Ring",
		back=RudianosTP,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}

	sets.engaged.ShieldTank = {ammo="Staunch Tathlum +1",
		head="Chev. Armet +3",neck="Unmoving Collar +1",ear1="Creed Earring",ear2="Thureous Earring",
		body="Sakpata Breastplate",hands="Souv. Handsch. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=RudianosTP,waist="Flume Belt +1",legs="Chev. Cuisses +3",feet="Souveran Schuhs +1"}
		
    sets.engaged.Reraise = set_combine(sets.engaged.ShieldTank, sets.Reraise)
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'BLU' then
        set_macro_page(3, 5)
    else
        set_macro_page(1, 5) --War/Etc
    end
	
	send_command('wait 4;gs c set unlockweapons on')
end