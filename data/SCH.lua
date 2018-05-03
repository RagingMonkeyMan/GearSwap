-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
	
	state.Buff['Accession'] = buffactive['Accession'] or false
	
    LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}

    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
	
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	
	autows = 'Realmrazer'
	autofood = 'Pear Crepe'
	
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoWSMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","AutoBuffMode",},{"Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","RecoverMode","ElementalMode","CastingMode","TreasureMode",})
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
		end
		
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        elseif state.CastingMode.value == 'OccultAcumen' then
            classes.CustomClass = 'OccultAcumen'
        end
    end

end

function job_post_precast(spell, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if arts_active() and sets.precast.FC.Arts then
			equip(sets.precast.FC.Arts)
		end
	end
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, spellMap, eventArgs)

    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
	
	if spell.skill == 'Enfeebling Magic' then
		if (buffactive['light arts'] or buffactive['addendum: white']) and sets.buff['Light Arts'] then
			equip(sets.buff['Light Arts'])
		elseif (buffactive['dark arts'] or buffactive['addendum: black']) and sets.buff['Dark Arts'] then
			equip(sets.buff['Dark Arts'])
		end
	elseif default_spell_map == 'ElementalEnfeeble' and (buffactive['dark arts']  or buffactive['addendum: black']) and sets.buff['Dark Arts'] then
		equip(sets.buff['Dark Arts'])
    elseif spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' then
        if state.MagicBurstMode.value ~= 'Off' then equip(sets.MagicBurst) end
		if (state.CastingMode.value == 'Normal' or state.CastingMode.value == 'Fodder') then
			if spell.element == world.weather_element or spell.element == world.day_element then
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
				if state.Buff.Klimaform and spell.element == world.weather_element then
					equip(sets.buff['Klimaform'])
				end
			end
			if spell.element and sets.element[spell.element] then
				equip(sets.element[spell.element])
			end
			if state.Buff.Ebullience then
				equip(sets.buff['Ebullience'])
			end
		end
		
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
		
		if state.RecoverMode.value ~= 'Never' and (state.RecoverMode.value == 'Always' or tonumber(state.RecoverMode.value:sub(1, -2)) > player.mpp) then
			if state.MagicBurstMode.value ~= 'Off' and sets.RecoverBurst then
				equip(sets.RecoverBurst)
			else
				equip(sets.RecoverMP)
			end
		end
    end
	
end

function job_aftercast(spell, spellMap, eventArgs)
    if not spell.interrupted then
		if spell.type == 'Scholar' then
			windower.send_command:schedule(1,'gs c showcharge')
		elseif spell.action_type == 'Magic' then
			if state.UseCustomTimers.value and spell.english == 'Sleep' or spell.english == 'Sleepga' then
				windower.send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
			elseif state.UseCustomTimers.value and spell.english == 'Sleep II' then
				windower.send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
			elseif spell.skill == 'Elemental Magic' and state.MagicBurstMode.value == 'Single' then
				state.MagicBurstMode:reset()
				if state.DisplayMode.value then update_job_states()	end
			end
		end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        if not midaction() then handle_equipping_gear(player.status) end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
		if  default_spell_map == 'Cure' or default_spell_map == 'Curaga'  then
			if world.weather_element == 'Light' then
					return 'LightWeatherCure'
			elseif world.day_element == 'Light' then
					return 'LightDayCure'
			end
		elseif spell.skill == "Enfeebling Magic" then
			if spell.english:startswith('Dia') then
				return "Dia"
            elseif spell.type == "WhiteMagic" or spell.english:startswith('Frazzle') or spell.english:startswith('Distract') then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' and not spell.english:contains('helix') then
            if LowTierNukes:contains(spell.english) then
                return 'LowTierNuke'
            else
                return 'HighTierNuke'
            end
        end
    end
end

function job_customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 and (state.IdleMode.value == 'Normal' or state.IdleMode.value == 'Sphere') and state.DefenseMode.value == 'None' then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1]:lower() == 'scholar' then
        handle_strategems(commandArgs)
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'elemental' then
        handle_elemental(commandArgs)
        eventArgs.handled = true
	elseif commandArgs[1]:lower() == 'showcharge' then
		add_to_chat(204, '~~~Current Stratagem Charges Available: ['..get_current_strategem_count()..']~~~')
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
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
		
	local immactive = 0
		
	if buffactive['Immanence'] then
		immactive = 1
	end
	

    if strategem == 'nuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Fire' then
			if buffactive['addendum: black'] and spell_recasts[148] == 0 then
				windower.chat.input('/ma "Fire V" <t>')
			elseif buffactive['addendum: black'] and spell_recasts[147] == 0 then
				windower.chat.input('/ma "Fire IV" <t>')
			elseif spell_recasts[146] == 0 then
				windower.chat.input('/ma "Fire III" <t>')
			elseif spell_recasts[145] == 0 then
				windower.chat.input('/ma "Fire II" <t>')
			elseif spell_recasts[144] == 0 then
				windower.chat.input('/ma "Fire" <t>')
			end

		elseif state.ElementalMode.value == 'Wind' then
			if buffactive['addendum: black'] and spell_recasts[158] == 0 then
				windower.chat.input('/ma "Aero V" <t>')
			elseif buffactive['addendum: black'] and spell_recasts[157] == 0 then
				windower.chat.input('/ma "Aero IV" <t>')
			elseif spell_recasts[156] == 0 then
				windower.chat.input('/ma "Aero III" <t>')
			elseif spell_recasts[155] == 0 then
				windower.chat.input('/ma "Aero II" <t>')
			elseif spell_recasts[154] == 0 then
				windower.chat.input('/ma "Aero" <t>')
			end
			
		elseif state.ElementalMode.value == 'Lightning' then
			if buffactive['addendum: black'] and spell_recasts[168] == 0 then
				windower.chat.input('/ma "Thunder V" <t>')
			elseif buffactive['addendum: black'] and spell_recasts[167] == 0 then
				windower.chat.input('/ma "Thunder IV" <t>')
			elseif spell_recasts[166] == 0 then
				windower.chat.input('/ma "Thunder III" <t>')
			elseif spell_recasts[165] == 0 then
				windower.chat.input('/ma "Thunder II" <t>')
			elseif spell_recasts[164] == 0 then
				windower.chat.input('/ma "Thunder" <t>')
			end

		elseif state.ElementalMode.value == 'Earth' then
			if buffactive['addendum: black'] and spell_recasts[163] == 0 then
				windower.chat.input('/ma "Stone V" <t>')
			elseif buffactive['addendum: black'] and spell_recasts[162] == 0 then
				windower.chat.input('/ma "Stone IV" <t>')
			elseif spell_recasts[161] == 0 then
				windower.chat.input('/ma "Stone III" <t>')
			elseif spell_recasts[160] == 0 then
				windower.chat.input('/ma "Stone II" <t>')
			elseif spell_recasts[159] == 0 then
				windower.chat.input('/ma "Stone" <t>')
			end
			
		elseif state.ElementalMode.value == 'Ice' then
			if buffactive['addendum: black'] and spell_recasts[153] == 0 then
				windower.chat.input('/ma "Blizzard V" <t>')
			elseif buffactive['addendum: black'] and spell_recasts[152] == 0 then
				windower.chat.input('/ma "Blizzard IV" <t>')
			elseif spell_recasts[151] == 0 then
				windower.chat.input('/ma "Blizzard III" <t>')
			elseif spell_recasts[150] == 0 then
				windower.chat.input('/ma "Blizzard II" <t>')
			elseif spell_recasts[149] == 0 then
				windower.chat.input('/ma "Blizzard" <t>')
			end
		
		elseif state.ElementalMode.value == 'Water' then
			if buffactive['addendum: black'] and spell_recasts[173] == 0 then
				windower.chat.input('/ma "Water V" <t>')
			elseif buffactive['addendum: black'] and spell_recasts[172] == 0 then
				windower.chat.input('/ma "Water IV" <t>')
			elseif spell_recasts[171] == 0 then
				windower.chat.input('/ma "Water III" <t>')
			elseif spell_recasts[170] == 0 then
				windower.chat.input('/ma "Water II" <t>')
			elseif spell_recasts[169] == 0 then
				windower.chat.input('/ma "Water" <t>')
			end
			
		elseif state.ElementalMode.value == 'Light' then
			if spell_recasts[29] == 0 then
				send_command('input /ma "Banish II" <t>')
			elseif spell_recasts[28] == 0 then
				send_command('input /ma "Banish" <t>')
			end

		elseif state.ElementalMode.value == 'Dark' then
			if spell_recasts[219] == 0 then
				windower.chat.input('/ma "Comet" <t>')
			else
				add_to_chat(123,'Comet is on cooldown.')
			end
		end
		
	elseif strategem == 'smallnuke' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		
		if state.ElementalMode.value == 'Fire' then
			if spell_recasts[145] == 0 then
				windower.chat.input('/ma "Fire II" <t>')
			elseif spell_recasts[144] == 0 then
				windower.chat.input('/ma "Fire" <t>')
			end
			
		elseif state.ElementalMode.value == 'Wind' then
			if spell_recasts[155] == 0 then
				windower.chat.input('/ma "Aero II" <t>')
			elseif spell_recasts[154] == 0 then
				windower.chat.input('/ma "Aero" <t>')
			end
			
		elseif state.ElementalMode.value == 'Lightning' then
			if spell_recasts[165] == 0 then
				windower.chat.input('/ma "Thunder II" <t>')
			elseif spell_recasts[164] == 0 then
				windower.chat.input('/ma "Thunder" <t>')
			end

		elseif state.ElementalMode.value == 'Earth' then
			if spell_recasts[160] == 0 then
				windower.chat.input('/ma "Stone II" <t>')
			elseif spell_recasts[159] == 0 then
				windower.chat.input('/ma "Stone" <t>')
			end
			
		elseif state.ElementalMode.value == 'Ice' then
			if spell_recasts[150] == 0 then
				windower.chat.input('/ma "Blizzard II" <t>')
			elseif spell_recasts[149] == 0 then
				windower.chat.input('/ma "Blizzard" <t>')
			end
		
		elseif state.ElementalMode.value == 'Water' then
			if spell_recasts[170] == 0 then
				windower.chat.input('/ma "Water II" <t>')
			elseif spell_recasts[169] == 0 then
				windower.chat.input('/ma "Water" <t>')
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
			windower.chat.input('/ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Stone" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Water" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/ma "Banish" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			windower.chat.input('/ma "Bio" <t>')
		end
		
	elseif strategem == 'tier2' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Fire II" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Aero II" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Thunder II" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Stone II" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Blizzard II" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Water II" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/ma "Banish II" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			windower.chat.input('/ma "Bio II" <t>')
		end
		
	elseif strategem == 'tier3' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Fire III" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Aero III" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Thunder III" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Stone III" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Blizzard III" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Water III" <t>')
		elseif state.ElementalMode.value == 'Light' then
			add_to_chat(123,'Error: There is no light tier III.')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark tier III.')
		end
		
	elseif strategem == 'tier4' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Fire IV" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Aero IV" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Thunder IV" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Stone IV" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Blizzard IV" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Water IV" <t>')
		elseif state.ElementalMode.value == 'Light' then
			add_to_chat(123,'Error: There is no light tier IV.')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark tier IV.')
		end
		
	elseif strategem == 'tier5' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Fire V" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Aero V" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Thunder V" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Stone V" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Blizzard V" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Water V" <t>')
		elseif state.ElementalMode.value == 'Light' then
			add_to_chat(123,'Error: There is no light tier V.')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark tier V.')
		end
		
	elseif strategem == 'helix' then
		if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 1199 then
			if state.ElementalMode.value == 'Fire' then
				windower.chat.input('/ma "Pyrohelix II" <t>')
			elseif state.ElementalMode.value == 'Wind' then
				windower.chat.input('/ma "Anemohelix II" <t>')
			elseif state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/ma "Ionohelix II" <t>')
			elseif state.ElementalMode.value == 'Light' then
				windower.chat.input('/ma "Luminohelix II" <t>')
			elseif state.ElementalMode.value == 'Earth' then
				windower.chat.input('/ma "Geohelix II" <t>')
			elseif state.ElementalMode.value == 'Ice' then
				windower.chat.input('/ma "Cryohelix II" <t>')
			elseif state.ElementalMode.value == 'Water' then
				windower.chat.input('/ma "Hydrohelix II" <t>')
			elseif state.ElementalMode.value == 'Dark' then
				windower.chat.input('/ma "Noctohelix II" <t>')
			end
		else
			if state.ElementalMode.value == 'Fire' then
				windower.chat.input('/ma "Pyrohelix" <t>')
			elseif state.ElementalMode.value == 'Wind' then
				windower.chat.input('/ma "Anemohelix" <t>')
			elseif state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/ma "Ionohelix" <t>')
			elseif state.ElementalMode.value == 'Light' then
				windower.chat.input('/ma "Luminohelix" <t>')
			elseif state.ElementalMode.value == 'Earth' then
				windower.chat.input('/ma "Geohelix" <t>')
			elseif state.ElementalMode.value == 'Ice' then
				windower.chat.input('/ma "Cryohelix" <t>')
			elseif state.ElementalMode.value == 'Water' then
				windower.chat.input('/ma "Hydrohelix" <t>')
			elseif state.ElementalMode.value == 'Dark' then
				windower.chat.input('/ma "Noctohelix" <t>')
			end
		end
	
	elseif strategem == 'aga' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Firaga" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Aeroga" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Thundaga" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Stonega" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Blizzaga" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Waterga" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/ma "Banishga" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark -aja.')
		end
		
	elseif strategem == 'aga2' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Firaga II" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Aeroga II" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Thundaga II" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Stonega II" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Blizzaga II" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Waterga II" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/ma "Banishga II" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			add_to_chat(123,'Error: There is no dark -aja.')
		end
	
	elseif strategem == 'enfeeble' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Burn" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Choke" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Shock" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Rasp" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Frost" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Drown" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/ma "Dia II" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			windower.chat.input('/ma "Blind" <t>')
		end
	
	elseif strategem == 'bardsong' then
		if state.ElementalMode.value == 'Fire' then
			windower.chat.input('/ma "Ice Threnody" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/ma "Earth Threnody" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/ma "Water Threnody" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			windower.chat.input('/ma "Ltng. Threnody" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/ma "Wind Threnody" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/ma "Fire Threnody" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/ma "Dark Threnody" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			windower.chat.input('/ma "Light Threnody" <t>')
		end
	
	elseif strategem == 'skillchain1' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 2 then
			add_to_chat(123,'Abort: You have less than two stratagems available.')
		elseif not (buffactive['dark arts']  or buffactive['addendum: black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value ~= nil then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			
			if state.ElementalMode.value == 'Fire' then
				windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Stone" <t>')
				windower.chat.input:schedule(5,'/ja "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Fire" <t>')
			elseif state.ElementalMode.value == 'Wind' then
				windower.chat.input('/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Stone" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Aero" <t>')
			elseif state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Water" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Thunder" <t>')
			elseif state.ElementalMode.value == 'Light' then
				windower.chat.input('/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Noctohelix" <t>')
				windower.chat.input:schedule(6,'/ma "Immanence" <me>')
				windower.chat.input:schedule(7,'/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
				windower.chat.input:schedule(7,'/ma "Luminohelix" <t>')
			elseif state.ElementalMode.value == 'Earth' then
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Fire" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			elseif state.ElementalMode.value == 'Ice' then
				windower.chat.input('/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Water" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Blizzard" <t>')
			elseif state.ElementalMode.value == 'Water' then
				windower.chat.input('/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Stone" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Water" <t>')
			elseif state.ElementalMode.value == 'Dark' then
				windower.chat.input('/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Blizzard" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			else
				add_to_chat(123,'Abort: '..state.ElementalMode.value..' is not an Elemental Mode with a skillchain1 command!')
			end
		end
	
	elseif strategem == 'skillchain2' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 2 then
			add_to_chat(123,'Abort: You have less than two stratagems available.')
		elseif not (buffactive['dark arts']  or buffactive['addendum: black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
			
			
		elseif state.ElementalMode.value ~= nil then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			
			if state.ElementalMode.value == 'Fire' or state.ElementalMode.value == 'Light' then
				windower.chat.input('/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Fire" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Thunder" <t>')
			elseif state.ElementalMode.value == 'Wind' or state.ElementalMode.value == 'Lightning' then
				windower.chat.input('/p '..auto_translate('Fragmentation')..' -<t>- MB: '..auto_translate('wind')..' '..auto_translate('Thunder')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Blizzard" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Fragmentation')..' -<t>- MB: '..auto_translate('wind')..' '..auto_translate('Thunder')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Water" <t>')
			elseif state.ElementalMode.value == 'Earth' or state.ElementalMode.value == 'Dark' then
				windower.chat.input('/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Aero" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			elseif state.ElementalMode.value == 'Ice' or state.ElementalMode.value == 'Water' then
				windower.chat.input('/p '..auto_translate('Distortion')..' -<t>- MB: '..auto_translate('ice')..' '..auto_translate('Water')..' <scall21> OPEN!')
				windower.chat.input:schedule(1,'/ma "Luminohelix" <t>')
				windower.chat.input:schedule(7,'/ma "Immanence" <me>')
				windower.chat.input:schedule(8,'/p '..auto_translate('Distortion')..' -<t>- MB: '..auto_translate('ice')..' '..auto_translate('Water')..' <scall21> CLOSE!')
				windower.chat.input:schedule(8,'/ma "Stone" <t>')
			else
				add_to_chat(123,'Abort: '..state.ElementalMode.value..' is not an Elemental Mode with a skillchain1 command!')
			end
			

		end
		
	elseif strategem == 'skillchain3' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 3 then
			add_to_chat(123,'Abort: You have less than three stratagems available.')
		elseif not (buffactive['dark arts']  or buffactive['addendum: black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
			windower.chat.input:schedule(1,'/ma "Stone" <t>')
			windower.chat.input:schedule(5,'/ja "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Fire" <t>')
			windower.chat.input:schedule(13,'/ja "Immanence" <me>')
			windower.chat.input:schedule(14,'/p '..auto_translate('Fusion')..' -<t>- MB: '..auto_translate('Fire')..' '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(14,'/ma "Thunder" <t>')
		else
			add_to_chat(123,'Abort: Fire is the only element with a consecutive 3-step skillchain.')
		end
	
	elseif strategem == 'skillchain4' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 4 then
			add_to_chat(123,'Abort: You have less than four stratagems available.')
		elseif not (buffactive['dark arts']  or buffactive['addendum: black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		else 
			windower.chat.input('/p Starting 4-Step '..auto_translate('Skillchain')..' -<t>-')
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/ma "Aero" <t>')
			windower.chat.input:schedule(5,'/ma "Immanence" <me>')
			windower.chat.input:schedule(6,'/ma "Stone" <t>')
			windower.chat.input:schedule(10,'/ja "Immanence" <me>')
			windower.chat.input:schedule(11,'/ma "Water" <t>')
			windower.chat.input:schedule(15,'/ja "Immanence" <me>')
			windower.chat.input:schedule(16,'/ma "Thunder" <t>')
		end
		
	elseif strategem == 'skillchain6' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif get_current_strategem_count() < 5 then
			add_to_chat(123,'Abort: You have less than five stratagems available.')
		elseif not (buffactive['dark arts']  or buffactive['addendum: black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif not buffactive['Immanence'] then
			add_to_chat(123,'Immanence not active, wait for stratagem cooldown. - Activating Immanence.')
			windower.chat.input('/ja "Immanence" <me>')
		else
			windower.chat.input('/p Starting 6-Step '..auto_translate('Skillchain')..' -<t>-')
			windower.chat.input('/ma "Aero" <t>')
			windower.chat.input:schedule(4,'/ja "Immanence" <me>')
			windower.chat.input:schedule(5,'/ma "Stone" <t>')
			windower.chat.input:schedule(9,'/ja "Immanence" <me>')
			windower.chat.input:schedule(10,'/ma "Water" <t>')
			windower.chat.input:schedule(14,'/ja "Immanence" <me>')
			windower.chat.input:schedule(15,'/ma "Thunder" <t>')
			windower.chat.input:schedule(19,'/ja "Immanence" <me>')
			windower.chat.input:schedule(20,'/ma "Fire" <t>')
			windower.chat.input:schedule(24,'/ja "Immanence" <me>')
			windower.chat.input:schedule(25,'/ma "Thunder" <t>')
		end
	
	elseif strategem == 'wsskillchain' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif player.tp < 1000 then
			add_to_chat(123,'Abort: You don\'t have enough TP for this skillchain.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif (get_current_strategem_count() + immactive) < 1 then
			add_to_chat(123,'Abort: You have less than one stratagems available.')
		elseif not (buffactive['dark arts']  or buffactive['addendum: black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			windower.chat.input('/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> OPEN!')
			windower.chat.input('/ws "Rock Crusher" <t>')
			windower.chat.input:schedule(5,'/ma "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Liquefaction')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			windower.chat.input('/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> OPEN!')
			windower.chat.input('/ws "Rock Crusher" <t>')
			windower.chat.input:schedule(5,'/ma "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Detonation')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			windower.chat.input('/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ma "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Impaction')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Light' then
			windower.chat.input('/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ma "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Transfixion')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Luminohelix" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			if player.sub_job == 'WHM' then
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input('/ws "Earth Crusher" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			else
				windower.chat.input('/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> OPEN!')
				windower.chat.input('/ws "Shell Crusher" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Scission')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Stone" <t>')
			end
		elseif state.ElementalMode.value == 'Ice' then
			windower.chat.input('/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> OPEN!')
			windower.chat.input('/ws "Starburst" <t>')
			windower.chat.input:schedule(5,'/ma "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Induration')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			windower.chat.input('/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> OPEN!')
			windower.chat.input('/ws "Omniscience" <t>')
			windower.chat.input:schedule(5,'/ma "Immanence" <me>')
			windower.chat.input:schedule(6,'/p '..auto_translate('Reverberation')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
			windower.chat.input:schedule(6,'/ma "Water" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			if player.sub_job == 'WHM' then
				windower.chat.input('/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input('/ws "Earth Crusher" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Gravitation')..' -<t>- MB: '..auto_translate('earth')..' '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			else
				windower.chat.input('/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> OPEN!')
				windower.chat.input('/ws "Omniscience" <t>')
				windower.chat.input:schedule(5,'/ma "Immanence" <me>')
				windower.chat.input:schedule(6,'/p '..auto_translate('Compression')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
				windower.chat.input:schedule(6,'/ma "Noctohelix" <t>')
			end
		end
		
	elseif strategem == 'endskillchain' then
		if player.target.type ~= "MONSTER" then
			add_to_chat(123,'Abort: You are not targeting a monster.')
		elseif buffactive.silence or buffactive.mute or buffactive.paralysis then
			add_to_chat(123,'You are silenced, muted, or paralyzed, cancelling skillchain.')
		elseif not (buffactive['dark arts']  or buffactive['addendum: black']) then
			add_to_chat(123,'Can\'t use elemental skillchain commands without Dark Arts - Activating.')
			windower.chat.input('/ja "Dark Arts" <me>')
		elseif state.ElementalMode.value == 'Fire' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Fire')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Fire" <t>')
		elseif state.ElementalMode.value == 'Wind' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('wind')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Aero" <t>')
		elseif state.ElementalMode.value == 'Lightning' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Thunder')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Thunder" <t>')
		elseif state.ElementalMode.value == 'Light' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Light')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Luminohelix" <t>')
		elseif state.ElementalMode.value == 'Earth' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('earth')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Stone" <t>')
		elseif state.ElementalMode.value == 'Ice' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('ice')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Blizzard" <t>')
		elseif state.ElementalMode.value == 'Water' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Water')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Water" <t>')
		elseif state.ElementalMode.value == 'Dark' then
			if not buffactive['Immanence'] then windower.chat.input('/ja "Immanence" <me>') end
			windower.chat.input:schedule(1,'/p '..auto_translate('Skillchain')..' -<t>- MB: '..auto_translate('Darkness')..' <scall21> CLOSE!')
			windower.chat.input:schedule(1,'/ma "Noctohelix" <t>')
		end
	
	--Leave out target, let shortcuts auto-determine it.
	elseif strategem == 'weather' then
		local spell_recasts = windower.ffxi.get_spell_recasts()
		if player.job_points[(res.jobs[player.main_job_id].ens):lower()].jp_spent > 99 then
			if state.ElementalMode.value == 'Fire' then
				if player.target.index == player.index and buffactive['Firestorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Firestorm II')
				end
			elseif state.ElementalMode.value == 'Wind' then
				if player.target.index == player.index and buffactive['Windstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Windstorm II')
				end
			elseif state.ElementalMode.value == 'Lightning' then
				if player.target.index == player.index and buffactive['Thunderstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Thunderstorm II')
				end
			elseif state.ElementalMode.value == 'Light' then
				if player.target.index == player.index and buffactive['Aurorastorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Aurorastorm II')
				end
			elseif state.ElementalMode.value == 'Earth' then
				if player.target.index == player.index and buffactive['Sandstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Sandstorm II')
				end
			elseif state.ElementalMode.value == 'Ice' then
				if player.target.index == player.index and buffactive['Hailstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Hailstorm II')
				end
			elseif state.ElementalMode.value == 'Water' then
				if player.target.index == player.index and buffactive['Rainstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Rainstorm II')
				end
			elseif state.ElementalMode.value == 'Dark' then
				if player.target.index == player.index and buffactive['Voidstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Voidstorm II')
				end
			end
		else
			if state.ElementalMode.value == 'Fire' then
				if player.target.index == player.index and buffactive['Firestorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Firestorm')
				end
			elseif state.ElementalMode.value == 'Wind' then
				if player.target.index == player.index and buffactive['Windstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Windstorm')
				end
			elseif state.ElementalMode.value == 'Lightning' then
				if player.target.index == player.index and buffactive['Thunderstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Thunderstorm')
				end
			elseif state.ElementalMode.value == 'Light' then
				if player.target.index == player.index and buffactive['Aurorastorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Aurorastorm')
				end
			elseif state.ElementalMode.value == 'Earth' then
				if player.target.index == player.index and buffactive['Sandstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Sandstorm')
				end
			elseif state.ElementalMode.value == 'Ice' then
				if player.target.index == player.index and buffactive['Hailstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Hailstorm')
				end
			elseif state.ElementalMode.value == 'Water' then
				if player.target.index == player.index and buffactive['Rainstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Rainstorm')
				end
			elseif state.ElementalMode.value == 'Dark' then
				if player.target.index == player.index and buffactive['Voidstorm'] and not state.Buff['Accession'] and not buffactive['Klimaform'] and spell_recasts[287] == 0 then
					windower.chat.input('/ma "Klimaform" <me>')
				else
					send_command('Voidstorm')
				end
			end

		end
	
    else
        add_to_chat(123,'Unrecognized elemental command.')
    end
end

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            windower.chat.input('/ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            windower.chat.input('/ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            windower.chat.input('/ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            windower.chat.input('/ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            windower.chat.input('/ja "Penury" <me>')
        elseif strategem == 'speed' then
            windower.chat.input('/ja "Celerity" <me>')
        elseif strategem == 'aoe' then
            windower.chat.input('/ja "Accession" <me>')
        elseif strategem == 'power' then
            windower.chat.input('/ja "Rapture" <me>')
        elseif strategem == 'duration' then
            windower.chat.input('/ja "Perpetuance" <me>')
        elseif strategem == 'accuracy' then
            windower.chat.input('/ja "Altruism" <me>')
        elseif strategem == 'enmity' then
            windower.chat.input('/ja "Tranquility" <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            windower.chat.input('/ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            windower.chat.input('/ja "Parsimony" <me>')
        elseif strategem == 'speed' then
            windower.chat.input('/ja "Alacrity" <me>')
        elseif strategem == 'aoe' then
            windower.chat.input('/ja "Manifestation" <me>')
        elseif strategem == 'power' then
            windower.chat.input('/ja "Ebullience" <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            windower.chat.input('/ja "Focalization" <me>')
        elseif strategem == 'enmity' then
            windower.chat.input('/ja "Equanimity" <me>')
        elseif strategem == 'skillchain' then
            windower.chat.input('/ja "Immanence" <me>')
        elseif strategem == 'addendum' then
            windower.chat.input('/ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end

-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function job_tick()
	if check_arts() then return true end
	return false
end

function check_arts()
	if state.AutoArts.value and not moving and not areas.Cities:contains(world.area) and not arts_active() and player.in_combat then
	
		local abil_recasts = windower.ffxi.get_ability_recasts()

		if abil_recasts[232] == 0 then
			windower.chat.input('/ja "Dark Arts" <me>')
			tickdelay = (framerate * .5)
			return true
		end

	end
	
	return false
end