-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end

    -- Setup vars that are user-independent.
function job_setup()

	state.Buff['Brazen Rush'] = buffactive['Brazen Rush'] or false
	state.Buff["Warrior's Charge"] = buffactive["Warrior's Charge"] or false
	state.Buff.Mighty = buffactive['Mighty Strikes']  or false
	state.Buff.Retaliation = buffactive['Retaliation'] or false
	state.Buff.Restraint = buffactive['Restraint'] or false
    state.Buff['Aftermath'] = buffactive['Aftermath'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
	
	--List of which WS you plan to use TP bonus WS with.
	moonshade_ws = S{'Savage Blade','Upheaval','Ruinator','Resolution','Rampage','Raging Rush',"Ukko's Fury",}

	autows = "Ukko's Fury"
	autofood = 'Soy Ramen'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","AutoBuffMode",},{"OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","TreasureMode",})
end
	
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' and not silent_check_amnesia() and state.AutoBuffMode.value then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if player.tp < 2250 and not buffactive['Blood Rage'] and abil_recasts[2] == 0 then
			eventArgs.cancel = true
			windower.chat.input('/ja "Warcry" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		elseif player.sub_job == 'SAM' and player.tp > 1850 and abil_recasts[140] == 0 then
			eventArgs.cancel = true
			windower.chat.input('/ja "Sekkanoki" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		elseif player.sub_job == 'SAM' and abil_recasts[134] == 0 then
			eventArgs.cancel = true
			windower.chat.input('/ja "Meditate" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		end
	end

end

-- Modify the default melee set after it was constructed.
function job_customize_melee_set(meleeSet)

	if not state.OffenseMode.value:contains('Acc') and state.HybridMode.value == 'Normal' and buffactive['Retaliation'] then
		meleeSet = set_combine(meleeSet, sets.buff.Retaliation)
	end
	
	if not state.OffenseMode.value:contains('Acc') and state.HybridMode.value == 'Normal' and buffactive['Restraint'] then
		meleeSet = set_combine(meleeSet, sets.buff.Restraint)
	end

    if state.ExtraMeleeMode.value ~= 'None' then
        meleeSet = set_combine(meleeSet, sets[state.ExtraMeleeMode.value])
    end
	
    return meleeSet
end

-- Run after the general precast() is done.
function job_post_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' then

		local WSset = get_precast_set(spell, spellMap)
		if not WSset.ear1 then WSset.ear1 = WSset.left_ear or '' end
		if not WSset.ear2 then WSset.ear2 = WSset.right_ear or '' end

        -- Replace Moonshade Earring if we're at cap TP
		if player.tp > 2950 and (WSset.ear1 == "Moonshade Earring" or WSset.ear2 == "Moonshade Earring") then
			if state.WeaponskillMode.Current:contains('Acc') and not buffactive['Sneak Attack'] and sets.precast.AccMaxTP then
				sets.precast.AccMaxTP.ear1 = sets.precast.AccMaxTP.left_ear or ''
				sets.precast.AccMaxTP.ear2 = sets.precast.AccMaxTP.right_ear or ''
				if (sets.precast.AccMaxTP.ear1:startswith("Lugra Earring") or sets.precast.AccMaxTP.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayMaxTPWSEars then
					equip(sets.AccDayMaxTPWSEars)
				else
					equip(sets.precast.AccMaxTP)
				end
			elseif sets.precast.MaxTP then
				if not sets.precast.MaxTP.ear1 then sets.precast.MaxTP.ear1 = sets.precast.MaxTP.left_ear or '' end
				if not sets.precast.MaxTP.ear2 then sets.precast.MaxTP.ear2 = sets.precast.MaxTP.right_ear or '' end
				if (sets.precast.MaxTP.ear1:startswith("Lugra Earring") or sets.precast.MaxTP.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayMaxTPWSEars then
					equip(sets.DayMaxTPWSEars)
				else
					equip(sets.precast.MaxTP)
				end
			else
			end
		else
			if state.WeaponskillMode.Current:contains('Acc') and not buffactive['Sneak Attack'] and (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.AccDayWSEars then
				equip(sets.AccDayWSEars)
			elseif (WSset.ear1:startswith("Lugra Earring") or WSset.ear2:startswith("Lugra Earring")) and not classes.DuskToDawn and sets.DayWSEars then
				equip(sets.DayWSEars)
			end
		end

		if state.WeaponskillMode.Current:contains('Acc') and not buffactive['Sneak Attack'] then
			if state.Buff.Charge and state.Buff.Mighty and sets.ACCWSMightyCharge then
				equip(sets.ACCWSMightyCharge)
			elseif state.Buff.Charge and sets.ACCWSCharge then
				equip(sets.ACCWSCharge)
			elseif state.Buff.Mighty and sets.ACCWSMighty then
				equip(sets.AccWSMighty)
			end
		else
			if state.Buff.Charge and state.Buff.Mighty and sets.WSMightyCharge then
				equip(sets.WSMightyCharge)
			elseif state.Buff.Charge and sets.WSCharge then
				equip(sets.WSCharge)
			elseif state.Buff.Mighty and sets.WSMighty then
				equip(sets.WSMighty)
			end
		end

	end

end

function job_tick()
	if check_hasso() then return true end
	if check_buff() then return true end
	return false
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_combat_form()
    update_melee_groups()
end

function job_buff_change(buff, gain)
	update_melee_groups()
end
	
function update_combat_form()
	if player.equipment.main then
		if player.equipment.main == "Ragnarok" then
			state.CombatForm:set('Ragnarok')
		elseif player.equipment.main == "Bravura" then
			state.CombatForm:set('Bravura')
		elseif player.equipment.main == "Conqueror" then
			state.CombatForm:set('Conqueror')
		else
			state.CombatForm:reset()
		end
	end
end
	
function update_melee_groups()
    if player then
		classes.CustomMeleeGroups:clear()
		
		if areas.Adoulin:contains(world.area) and buffactive.Ionis then
			classes.CustomMeleeGroups:append('Adoulin')
		end
		
		if state.Buff['Brazen Rush'] or state.Buff["Warrior's Charge"] then
			classes.CustomMeleeGroups:append('Charge')
		end
		
		if state.Buff.Mighty then
			classes.CustomMeleeGroups:append('Mighty')
		end
		
		if (player.equipment.main == "Conqueror" and buffactive['Aftermath: Lv.3']) or ((player.equipment.main == "Bravura" or player.equipment.main == "Ragnarok") and state.Buff['Aftermath']) then
				classes.CustomMeleeGroups:append('AM')
		end
	end
end

function check_hasso()
	if not (state.Stance.value == 'None' or state.Buff.Hasso or state.Buff.Seigan) and player.sub_job == 'SAM' and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if state.Stance.value == 'Hasso' and abil_recasts[138] == 0 then
			windower.chat.input('/ja "Hasso" <me>')
			tickdelay = 110
			return true
		elseif state.Stance.value == 'Seigan' and abil_recasts[139] == 0 then
			windower.chat.input('/ja "Seigan" <me>')
			tickdelay = 110
			return true
		else
			return false
		end
	end

	return false
end

function check_buff()
	if state.AutoBuffMode.value and player.in_combat then
		
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if not buffactive.Retaliation and abil_recasts[8] == 0 then
			windower.chat.input('/ja "Retaliation" <me>')
			tickdelay = 110
			return true		
		elseif not buffactive.Restraint and abil_recasts[9] == 0 then
			windower.chat.input('/ja "Restraint" <me>')
			tickdelay = 110
			return true
		elseif not buffactive['Blood Rage'] and abil_recasts[11] == 0 then
			windower.chat.input('/ja "Blood Rage" <me>')
			tickdelay = 110
			return true
		elseif not buffactive.Berserk and abil_recasts[1] == 0 then
			windower.chat.input('/ja "Berserk" <me>')
			tickdelay = 110
			return true
		elseif not buffactive.Aggressor and abil_recasts[4] == 0 then
			windower.chat.input('/ja "Aggressor" <me>')
			tickdelay = 110
			return true
		else
			return false
		end
	end
		
	return false
end