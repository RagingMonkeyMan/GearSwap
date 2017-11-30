-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:
    
    gs c step
        Uses the currently configured step on the target, with either <t> or <stnpc> depending on setting.

    gs c step t
        Uses the currently configured step on the target, but forces use of <t>.
    
    
    Configuration commands:
    
    gs c cycle mainstep
        Cycles through the available steps to use as the primary step when using one of the above commands.
        
    gs c cycle altstep
        Cycles through the available steps to use for alternating with the configured main step.
        
    gs c toggle usealtstep
        Toggles whether or not to use an alternate step.
        
    gs c toggle selectsteptarget
        Toggles whether or not to use <stnpc> (as opposed to <t>) when using a step.
--]]


-- Initialization function for this job file.
function get_sets()
    -- Load and initialize the include file.
    include('Sel-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

    state.Buff['Climactic Flourish'] = buffactive['Climactic Flourish'] or false
	state.Buff['Saber Dance'] = buffactive['Saber Dance'] or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	
    state.MainStep = M{['description']='Main Step', 'Box Step', 'Quickstep', 'Feather Step', 'Stutter Step'}
    state.AltStep = M{['description']='Alt Step', 'Quickstep', 'Feather Step', 'Stutter Step', 'Box Step'}
	state.AutoSamba = M{['description']='Auto Samba', 'Off', 'Haste Samba', 'Aspir Samba II', 'Drain Samba III'}
    state.UseAltStep = M(false, 'Use Alt Step')
    state.SelectStepTarget = M(false, 'Select Step Target')
    state.IgnoreTargetting = M(false, 'Ignore Targetting')

    state.CurrentStep = M{['description']='Current Step', 'Main', 'Alt'}
	
	--List of which WS you plan to use TP bonus WS with.
	moonshade_ws = S{"Rudra's Storm"}

	autows = "Rudra's Storm"
	autofood = 'Soy Ramen'
	
    update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoWSMode","AutoFoodMode","AutoStunMode","AutoDefenseMode","AutoBuffMode",},{"OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","TreasureMode",})
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

function job_filtered_action(spell, eventArgs)

end

function job_precast(spell, spellMap, eventArgs)

	if spell.type == 'WeaponSkill' and state.AutoBuffMode.value and player.tp > 100 then
		local abil_recasts = windower.ffxi.get_ability_recasts()
		if under3FMs() and abil_recasts[236] == 0 and player.status == 'Engaged' then
			eventArgs.cancel = true
			windower.send_command('gs c step')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		elseif not under3FMs() and not buffactive['Building Flourish'] and abil_recasts[226] == 0 then
			eventArgs.cancel = true
			windower.chat.input('/ja "Climactic Flourish" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		elseif not under3FMs() and not buffactive['Climactic Flourish'] and abil_recasts[222] == 0 then
			eventArgs.cancel = true
			windower.chat.input('/ja "Building Flourish" <me>')
			windower.chat.input:schedule(1,'/ws "'..spell.english..'" '..spell.target.raw..'')
			return
		end
    elseif spell.type == 'Step' then
        local abil_recasts = windower.ffxi.get_ability_recasts()
        local prestoCooldown = abil_recasts[236]
        
        if player.main_job_level >= 77 and prestoCooldown < 1 and under3FMs() and player.status == 'Engaged' then
            eventArgs.cancel = true
			windower.chat.input('/ja "Presto" <me>')
			windower.chat.input:schedule(1,'/ja "'..spell.english..'" '..spell.target.raw..'')
        end
    end
end

function job_post_precast(spell, spellMap, eventArgs)
    if spell.type == "WeaponSkill" then
        if state.Buff['Climactic Flourish'] then
            equip(sets.buff['Climactic Flourish'])
        end

		-- Replace Moonshade Earring if we're at cap TP
        if player.tp == 3000 and moonshade_ws:contains(spell.english) then
			if state.WeaponskillMode.Current:contains('Acc') then
				if sets.precast.AccMaxTP then
					equip(sets.precast.AccMaxTP)
				end
						
			elseif sets.precast.MaxTP then
					equip(sets.precast.MaxTP)
			end

		end
    end
	
end

-- Return true if we handled the aftercast work.  Otherwise it will fall back
-- to the general aftercast() code in Mote-Include.
function job_aftercast(spell, spellMap, eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff,gain)
	update_melee_groups()
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    update_melee_groups()
end


function job_customize_idle_set(idleSet)
    if player.hpp < 80 and not areas.Cities:contains(world.area) then
        idleSet = set_combine(idleSet, sets.ExtraRegen)
    end
    
    return idleSet
end

function job_customize_melee_set(meleeSet)
    if state.DefenseMode.value ~= 'None' then
        if state.Buff['Saber Dance'] then
            meleeSet = set_combine(meleeSet, sets.buff['Saber Dance'])
        end
        if state.Buff['Climactic Flourish'] then
            meleeSet = set_combine(meleeSet, sets.buff['Climactic Flourish'])
        end
    end
    
    return meleeSet
end

-- Handle auto-targetting based on local setup.
function job_auto_change_target(spell, action, spellMap, eventArgs)
    if spell.type == 'Step' then
        if state.IgnoreTargetting.value == true then
            state.IgnoreTargetting:reset()
            eventArgs.handled = true
        end
        
        eventArgs.SelectNPCTargets = state.SelectStepTarget.value
    end
end


-- Function to display the current relevant user state when doing an update.
-- Set eventArgs.handled to true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'
    
    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end
    
    msg = msg .. ': '
    
    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value
    
    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end
    
    if state.Kiting.value then
        msg = msg .. ', Kiting'
    end

    msg = msg .. ', ['..state.MainStep.current

    if state.UseAltStep.value == true then
        msg = msg .. '/'..state.AltStep.current
    end
    
    msg = msg .. ']'

    if state.SelectStepTarget.value == true then
        steps = steps..' (Targetted)'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1] == 'step' then
        if commandArgs[2] == 't' then
            state.IgnoreTargetting:set()
        end

        local doStep = ''
        if state.UseAltStep.value == true then
            doStep = state[state.CurrentStep.current..'Step'].current
            state.CurrentStep:cycle()
        else
            doStep = state.MainStep.current
        end        
        
        send_command('@input /ja "'..doStep..'" <t>')
    end
end

function job_tick()
	if check_buff() then return true end
	return false
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_melee_groups()
	classes.CustomMeleeGroups:clear()

	if state.Buff['Saber Dance'] then
		classes.CustomMeleeGroups:append('Saber')
	end	
	
	if player.equipment.main and player.equipment.main == "Terpsichore" and state.Buff['Aftermath: Lv.3'] then
		classes.CustomMeleeGroups:append('AM')
	end
end

function under3FMs()
	if not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] then
		return true
	else
		return false
	end
end

function check_buff()

	if state.AutoBuffMode.value then
		local abil_recasts = windower.ffxi.get_ability_recasts()
	
		if not buffactive['Finishing Move 1'] and not buffactive['Finishing Move 2'] and not buffactive['Finishing Move 3'] and not buffactive['Finishing Move 4'] and not buffactive['Finishing Move 5'] and abil_recasts[223] == 0 then
			windower.chat.input('/ja "No Foot Rise" <me>')
			tickdelay = 110
			return true
		end
		
		if player.in_combat then
			if not buffactive[''..state.AutoSamba.value..''] and abil_recasts[216] == 0 and state.AutoSamba.value ~= 'Off' and player.tp > 400 then
				windower.chat.input('/ja "'..state.AutoSamba.value..'" <me>')
				tickdelay = 110
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Berserk and abil_recasts[1] == 0 then
				windower.chat.input('/ja "Berserk" <me>')
				tickdelay = 110
				return true
			elseif player.sub_job == 'WAR' and not buffactive.Aggressor and abil_recasts[4] == 0 then
				windower.chat.input('/ja "Aggressor" <me>')
				tickdelay = 110
				return true
			else
				return false
			end
		end
	end
	return false
end