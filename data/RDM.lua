-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.Buff.Saboteur = buffactive.Saboteur or false
	state.Buff.Chainspell = buffactive.Chainspell or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	
    LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}
	
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	
	autows = "Chant Du Cygne"
	autofood = 'Pear Crepe'
	
	update_combat_form()
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoWSMode","AutoFoodMode","AutoStunMode","AutoDefenseMode"},{"OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filtered_action(spell, eventArgs)

end

function job_pretarget(spell, spellMap, eventArgs)

end

function job_precast(spell, spellMap, eventArgs)

	if spell.action_type == 'Magic' then
		if state.Buff.Chainspell then
			eventArgs.handled = true
		end
		if spellMap == 'Cure' or spellMap == 'Curaga' then
			gear.default.obi_back = gear.obi_cure_back
			gear.default.obi_waist = gear.obi_cure_waist
		elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
			if LowTierNukes:contains(spell.english) then
				gear.default.obi_back = gear.obi_low_nuke_back
				gear.default.obi_waist = gear.obi_low_nuke_waist
			else
				gear.default.obi_back = gear.obi_high_nuke_back
				gear.default.obi_waist = gear.obi_high_nuke_waist
			end
		elseif spell.english == 'Phalanx II' and (spell.target.type == 'SELF' or buffactive.Accession) then
			windower.chat.input('/ma "Phalanx" <me>')
			cancel_spell()
			eventArgs.cancel = true
		elseif spell.english == 'Phalanx' and (spell.target.type ~= 'SELF') then
			windower.chat.input('/ws "Phalanx II" '..spell.target.raw)
			cancel_spell()
			eventArgs.cancel = true
		end
		
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end

end

function job_post_precast(spell, spellMap, eventArgs)

end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, spellMap, eventArgs)

	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' and spell.english ~= 'Impact' then
        if state.MagicBurstMode.value ~= 'Off' then equip(sets.MagicBurst) end
		if spell.element == world.weather_element or spell.element == world.day_element then
			if state.CastingMode.value == 'Fodder' then
				if item_available('Twilight Cape') and not state.Capacity.value then
					sets.TwilightCape = {back="Twilight Cape"}
					equip(sets.TwilightCape)
				end
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
		
		if state.RecoverMode.value == 'Always' or (state.RecoverMode.value == '60%' and player.mpp < 60) or (state.RecoverMode.value == '35%' and player.mpp < 35) then
			if state.MagicBurstMode.value ~= 'Off' and sets.RecoverBurst then
				equip(sets.RecoverBurst)
			else
				equip(sets.RecoverMP)
			end
		end
		
    elseif spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
		equip(sets.midcast['Enhancing Magic'])
	
		if buffactive.Composure and spell.target.type == 'PLAYER' then
			equip(sets.buff.ComposureOther)
		end
		
		if sets.midcast[spell.english] then
			equip(sets.midcast[spell.english])
		elseif sets.midcast[spellMap] then
			equip(sets.midcast[spellMap])
		end
		
    end
end

function job_aftercast(spell, spellMap, eventArgs)
    if not spell.interrupted then
	    if buffup then
			if spell.english == 'Composure' or spell.english:endswith('Arts') or spell.english:startswith('Addendum') then
				windower.send_command:schedule(1,'gs c buffup')
			elseif spell.skill == 'Enhancing Magic' then
				windower.send_command:schedule(3,'gs c buffup')
			end
		end
	
        if spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        elseif spell.skill == 'Elemental Magic' and state.MagicBurstMode.value == 'Single' then
            state.MagicBurstMode:reset()
			if state.DisplayMode.value then update_job_states()	end
        end
    end
end

function job_buff_change(buff, gain)
	update_melee_groups()
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_update(cmdParams, eventArgs)
    update_combat_form()
	update_melee_groups()
end

function update_combat_form()
	if player.equipment.main and not (player.equipment.sub == 'empty' or player.equipment.sub:contains('Grip') or player.equipment.sub:contains('Strap') or player.equipment.sub:contains('Shield') or player.equipment.sub:contains('Culminus')) then
			state.CombatForm:set('DW')
	else
			state.CombatForm:reset()
	end
end

    -- Allow jobs to override this code
function job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'elemental' then
		handle_elemental(commandArgs)
		eventArgs.handled = true			
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function job_customize_idle_set(idleSet)
    if player.mpp < 51 and (state.IdleMode.value == 'Normal' or state.IdleMode.value == 'Sphere') and state.DefenseMode.value == 'None' then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if  default_spell_map == 'Cure' or default_spell_map == 'Curaga'  then
		if world.weather_element == 'Light' then
                return 'LightWeatherCure'
		elseif world.day_element == 'Light' then
                return 'LightDayCure'
        end
	end	
	
	if spell.skill == 'Enfeebling Magic' then
		if spell.english:startswith('Dia') then
			return "Dia"
		elseif spell.type == "WhiteMagic" or spell.english:startswith('Frazzle') or spell.english:startswith('Distract') then
			return 'MndEnfeebles'
        else
            return 'IntEnfeebles'
        end
    end
	
	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        if LowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
    end
	
end

-- Handling Elemental spells within Gearswap.
-- Format: gs c elemental <nuke, helix, skillchain1, skillchain2, weather>
function handle_elemental(cmdParams)
    -- cmdParams[1] == 'elemental'
    -- cmdParams[2] == ability to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No elemental command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'nuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Fire' then
			if spell_recasts[148] == 0 and player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
				send_command('input /ma "Fire V" <t>')
			elseif spell_recasts[147] == 0 then
				send_command('input /ma "Fire IV" <t>')
			elseif spell_recasts[146] == 0 then
				send_command('input /ma "Fire III" <t>')
			elseif spell_recasts[145] == 0 then
				send_command('input /ma "Fire II" <t>')
			elseif spell_recasts[144] == 0 then
				send_command('input /ma "Fire" <t>')
			end
			
		elseif state.ElementalMode.value == 'Wind' then
			if spell_recasts[158] == 0 and player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
				send_command('input /ma "Aero V" <t>')
			elseif spell_recasts[157] == 0 then
				send_command('input /ma "Aero IV" <t>')
			elseif spell_recasts[156] == 0 then
				send_command('input /ma "Aero III" <t>')
			elseif spell_recasts[155] == 0 then
				send_command('input /ma "Aero II" <t>')
			elseif spell_recasts[154] == 0 then
				send_command('input /ma "Aero" <t>')
			end
			
		elseif state.ElementalMode.value == 'Lightning' then
			if spell_recasts[168] == 0 and player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
				send_command('input /ma "Thunder V" <t>')
			elseif spell_recasts[167] == 0 then
				send_command('input /ma "Thunder IV" <t>')
			elseif spell_recasts[166] == 0 then
				send_command('input /ma "Thunder III" <t>')
			elseif spell_recasts[165] == 0 then
				send_command('input /ma "Thunder II" <t>')
			elseif spell_recasts[164] == 0 then
				send_command('input /ma "Thunder" <t>')
			end

		elseif state.ElementalMode.value == 'Earth' then
			if spell_recasts[163] == 0 and player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
				send_command('input /ma "Stone V" <t>')
			elseif spell_recasts[162] == 0 then
				send_command('input /ma "Stone IV" <t>')
			elseif spell_recasts[161] == 0 then
				send_command('input /ma "Stone III" <t>')
			elseif spell_recasts[160] == 0 then
				send_command('input /ma "Stone II" <t>')
			elseif spell_recasts[159] == 0 then
				send_command('input /ma "Stone" <t>')
			end
			
		elseif state.ElementalMode.value == 'Ice' then
			if spell_recasts[153] == 0 and player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
				send_command('input /ma "Blizzard V" <t>')
			elseif spell_recasts[152] == 0 then
				send_command('input /ma "Blizzard IV" <t>')
			elseif spell_recasts[151] == 0 then
				send_command('input /ma "Blizzard III" <t>')
			elseif spell_recasts[150] == 0 then
				send_command('input /ma "Blizzard II" <t>')
			elseif spell_recasts[149] == 0 then
				send_command('input /ma "Blizzard" <t>')
			end
		
		elseif state.ElementalMode.value == 'Water' then
			if spell_recasts[173] == 0 and player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
				send_command('input /ma "Water V" <t>')
			elseif spell_recasts[172] == 0 then
				send_command('input /ma "Water IV" <t>')
			elseif spell_recasts[171] == 0 then
				send_command('input /ma "Water III" <t>')
			elseif spell_recasts[170] == 0 then
				send_command('input /ma "Water II" <t>')
			elseif spell_recasts[169] == 0 then
				send_command('input /ma "Water" <t>')
			end
			
		elseif state.ElementalMode.value == 'Light' then
			if spell_recasts[29] == 0 then
				send_command('input /ma "Banish II" <t>')
			elseif spell_recasts[28] == 0 then
				send_command('input /ma "Banish" <t>')
			end

		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There are no dark nukes.')
		end
		
	elseif strategem == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Fire' then
			if spell_recasts[145] == 0 then
				send_command('input /ma "Fire II" <t>')
			elseif spell_recasts[144] == 0 then
				send_command('input /ma "Fire" <t>')
			end
			
		elseif state.ElementalMode.value == 'Wind' then
			if spell_recasts[155] == 0 then
				send_command('input /ma "Aero II" <t>')
			elseif spell_recasts[154] == 0 then
				send_command('input /ma "Aero" <t>')
			end
			
		elseif state.ElementalMode.value == 'Lightning' then
			if spell_recasts[165] == 0 then
				send_command('input /ma "Thunder II" <t>')
			elseif spell_recasts[164] == 0 then
				send_command('input /ma "Thunder" <t>')
			end

		elseif state.ElementalMode.value == 'Earth' then
			if spell_recasts[160] == 0 then
				send_command('input /ma "Stone II" <t>')
			elseif spell_recasts[159] == 0 then
				send_command('input /ma "Stone" <t>')
			end
			
		elseif state.ElementalMode.value == 'Ice' then
			if spell_recasts[150] == 0 then
				send_command('input /ma "Blizzard II" <t>')
			elseif spell_recasts[149] == 0 then
				send_command('input /ma "Blizzard" <t>')
			end
		
		elseif state.ElementalMode.value == 'Water' then
			if spell_recasts[170] == 0 then
				send_command('input /ma "Water II" <t>')
			elseif spell_recasts[169] == 0 then
				send_command('input /ma "Water" <t>')
			end
			
		elseif state.ElementalMode.value == 'Light' then
			if spell_recasts[29] == 0 then
				send_command('input /ma "Banish II" <t>')
			elseif spell_recasts[28] == 0 then
				send_command('input /ma "Banish" <t>')
			end

		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There are no dark nukes.')
		end

	elseif strategem == 'tier1' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Stone" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Water" <t>')
		elseif state.ElementalMode.value == 'Light' then
			send_command('input /ma "Banish" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			send_command('input /ma "Bio" <t>')
		end
		
	elseif strategem == 'tier2' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Fire II" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Aero II" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Thunder II" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Stone II" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Blizzard II" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Water II" <t>')
		elseif state.ElementalMode.value == 'Light' then
			send_command('input /ma "Banish II" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			send_command('input /ma "Bio II" <t>')
		end
		
	elseif strategem == 'tier3' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Fire III" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Aero III" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Thunder III" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Stone III" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Blizzard III" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Water III" <t>')
		elseif state.ElementalMode.value == 'Light' then
			add_to_chat(123,'Error: There is no light tier III.')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark tier III.')
		end
		
	elseif strategem == 'tier4' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Fire IV" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Aero IV" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Thunder IV" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Stone IV" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Blizzard IV" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Water IV" <t>')
		elseif state.ElementalMode.value == 'Light' then
			add_to_chat(123,'Error: There is no light tier IV.')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark tier IV.')
		end
		
	elseif strategem == 'tier5' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Fire V" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Aero V" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Thunder V" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Stone V" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Blizzard V" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Water V" <t>')
		elseif state.ElementalMode.value == 'Light' then
			add_to_chat(123,'Error: There is no light tier V.')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark tier V.')
		end
		
	elseif strategem == 'aga' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Firaga" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Aeroga" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Thundaga" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Stonega" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Blizzaga" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Waterga" <t>')
		elseif state.ElementalMode.value == 'Light' then
			send_command('input /ma "Banishga" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark -aja.')
		end
		
	elseif strategem == 'aga2' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Firaga II" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Aeroga II" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Thundaga II" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Stonega II" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Blizzaga II" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Waterga II" <t>')
		elseif state.ElementalMode.value == 'Light' then
			send_command('input /ma "Banishga II" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark -aja.')
		end
		
	elseif strategem == 'helix' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Pyrohelix" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Anemohelix" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Ionohelix" <t>')
		elseif state.ElementalMode.value == 'Light' then
			send_command('input /ma "Luminohelix" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Geohelix" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Cryohelix" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Hydrohelix" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			send_command('input /ma "Noctohelix" <t>')
		end
	
	elseif strategem == 'enfeeble' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Burn" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Choke" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Shock" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Rasp" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Frost" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Drown" <t>')
		elseif state.ElementalMode.value == 'Light' then
			send_command('input /ma "Dia II" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			send_command('input /ma "Blind" <t>')
		end
		
	elseif strategem == 'spikes' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Blaze Spikes" <me>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('There are no wind spikes')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Shock Spikes" <me>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('There are no earth spikes')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Ice Spikes" <me>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('There are no water spikes')
		elseif state.ElementalMode.value == 'Light' then
			send_command('There are no light spikes')
		elseif state.ElementalMode.value == 'Dark' then
			send_command("Red mage can't cast Dread Spikes.")
		end
		
	elseif strategem == 'enspell' then
	
		if  (player.sub_job:lower() == 'nin' or player.sub_job:lower() == 'dnc') then 
			if state.ElementalMode.value == 'Fire' then
				send_command('input /ma "Enfire" <me>')
			elseif state.ElementalMode.value == 'Wind' then
				send_command('input /ma "Enaero" <me>')
			elseif state.ElementalMode.value == 'Lightning' then
				send_command('input /ma "Enthunder" <me>')
			elseif state.ElementalMode.value == 'Earth' then
				send_command('input /ma "Enstone" <me>')
			elseif state.ElementalMode.value == 'Ice' then
				send_command('input /ma "Enblizzard" <me>')
			elseif state.ElementalMode.value == 'Water' then
				send_command('input /ma "Enwater" <me>')
			elseif state.ElementalMode.value == 'Light' then
				add_to_chat(123,'Error: There is no light enspell.')
			elseif state.ElementalMode.value == 'Dark' then
				add_to_chat(123,'Error: There is no dark enspell.')
			end
		else
			if state.ElementalMode.value == 'Fire' then
				send_command('input /ma "Enfire II" <me>')
			elseif state.ElementalMode.value == 'Wind' then
				send_command('input /ma "Enaero II" <me>')
			elseif state.ElementalMode.value == 'Lightning' then
				send_command('input /ma "Enthunder II" <me>')
			elseif state.ElementalMode.value == 'Earth' then
				send_command('input /ma "Enstone II" <me>')
			elseif state.ElementalMode.value == 'Ice' then
				send_command('input /ma "Enblizzard II" <me>')
			elseif state.ElementalMode.value == 'Water' then
				send_command('input /ma "Enwater II" <me>')
			elseif state.ElementalMode.value == 'Light' then
				add_to_chat(123,'Error: There is no light enspell.')
			elseif state.ElementalMode.value == 'Dark' then
				add_to_chat(123,'Error: There is no dark enspell.')
			end
		end
	
	elseif strategem == 'bardsong' then
		if state.ElementalMode.value == 'Fire' then
			send_command('input /ma "Ice Threnody" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			send_command('input /ma "Earth Threnody" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			send_command('input /ma "Water Threnody" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			send_command('input /ma "Ltng. Threnody" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			send_command('input /ma "Wind Threnody" <t>')
		elseif state.ElementalMode.value == 'Water' then
			send_command('input /ma "Fire Threnody" <t>')
		elseif state.ElementalMode.value == 'Light' then
			send_command('input /ma "Dark Threnody" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			send_command('input /ma "Light Threnody" <t>')
		end
	
	--Leave out target, let shortcuts auto-determine it.
	elseif strategem == 'weather' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Fire' then
			if player.target.index == player.index and buffactive['Firestorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Firestorm"')
			end
		elseif state.ElementalMode.value == 'Wind' then
			if player.target.index == player.index and buffactive['Windstorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Windstorm"')
			end
		elseif state.ElementalMode.value == 'Lightning' then
			if player.target.index == player.index and buffactive['Thunderstorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Thunderstorm"')
			end
		elseif state.ElementalMode.value == 'Light' then
			if player.target.index == player.index and buffactive['Aurorastorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Aurorastorm"')
			end
		elseif state.ElementalMode.value == 'Earth' then
			if player.target.index == player.index and buffactive['Sandstorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Sandstorm"')
			end
		elseif state.ElementalMode.value == 'Ice' then
			if player.target.index == player.index and buffactive['Hailstorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Hailstorm"')
			end
		elseif state.ElementalMode.value == 'Water' then
			if player.target.index == player.index and buffactive['Rainstorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Rainstorm"')
			end
		elseif state.ElementalMode.value == 'Dark' then
			if player.target.index == player.index and buffactive['Voidstorm'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
				send_command('input /ma "Klimaform" <me>')
			else
				send_command('input /ma "Voidstorm"')
			end
		end
	
    else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end

function job_tick()
	if check_arts() then return true end
	return false
end

function check_arts()
	if state.AutoArts.value and not moving and not areas.Cities:contains(world.area) then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()
		
		if not buffactive.Composure then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[50] == 0 and player.in_combat then
				tickdelay = 30
				windower.chat.input('/ja "Composure" <me>')
				return true
			end
		end

		local needsArts = 
				player.sub_job:lower() == 'sch' and
				not buffactive['Light Arts'] and
				not buffactive['Addendum: White'] and
				not buffactive['Dark Arts'] and
				not buffactive['Addendum: Black'] and
				player.in_combat
				

		if needsArts and abil_recasts[228] == 0 then
			send_command('@input /ja "Light Arts" <me>')
			tickdelay = 30
			return true
		end

	end
	
	return false
end

function update_melee_groups()
	if player.equipment.main then
		classes.CustomMeleeGroups:clear()
		
		if player.equipment.main == "Murgleis" and state.Buff['Aftermath: Lv.3'] then
				classes.CustomMeleeGroups:append('AM')
		end
	end	
end