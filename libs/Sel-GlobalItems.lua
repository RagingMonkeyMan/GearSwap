-- Universal items that are the same for all characters, and logic to determine if some specific items are owned and used.
sets.EndorsementRing = {ring2="Endorsement Ring"}
sets.TrizekRing = {ring2="Trizek Ring"}
sets.EchadRing = {ring2="Echad Ring"}
sets.FacilityRing = {ring2="Facility Ring"}
sets.CapacityRing = {ring2="Capacity Ring"}
sets.VocationRing = {ring2="Vocation Ring"}
sets.HollaRing = {ring2="Dim. Ring (Holla)"}
sets.DemRing = {ring2="Dim. Ring (Dem)"}
sets.MeaRing = {ring2="Dim. Ring (Mea)"}
sets.Nexus = {back="Nexus Cape"}
sets.Warp = {ring2="Warp Ring"}
sets.RREar = {ear2="Reraise Earring"}
sets.BehemothSuit = {body="Behemoth Suit +1",hands=empty,legs=empty,feet=empty}

if not sets.Reive then
	if item_owned("Adoulin's Refuge +1") then
		sets.Reive = {neck="Adoulin's Refuge +1"}
	elseif item_owned("Arciela's Grace +1") then
		sets.Reive = {neck="Arciela's Grace +1"}
	elseif item_owned("Ygnas's Resolve +1") then
		sets.Reive = {neck="Ygnas's Resolve +1"}
	else
		sets.Reive = {}
	end
end

uses_waltz_legs = false
if sets.precast.Waltz and sets.precast.Waltz.legs then
	waltz_legs = standardize_set(sets.precast.Waltz).legs
	if (waltz_legs == "Desultor Tassets" or waltz_legs == "Blitzer Poleyn" or waltz_legs == "Tatsumaki Sitagoromo") then
		uses_waltz_legs	= true
	end
end