local MOD = {}

mods["LootableMinutes"] = MOD

function MOD.on_turn_passed()
	if (TimenetCast == false) then return end
	local item = GetInvItem("time_net_active")
	if (item == nil) then
		TimenetCast = false
		game.add_msg("You have misplaced your Temporal Net but have not folded it, you will have to refold and recast it to capture more Time.")
	end
	if (item.charges >= 9500) then
		player:i_add(item("minute",1))
		item.charges = 0
		game.add_msg("A genuine Minute congeals from your Temporal Net, it will be invaluable if you happen to need more Time in a pinch.")
	else
		player:mod_moves(-20)
		item.charges = item.charges + 5
	end
end

function GetInvItem(itemid)
	local i = -1
	local item = player:i_at(i)
	while i == -1 or item:typeId() ~= "null" do
		if tostring(item:typeId()) == itemid then
			item = player:i_at(i)
			break
		end
		i = i + 1
		item = player:i_at(i)
	end
	return item
end



function MOD.on_new_player_created()
	if (player:get_value("TimeNet") == "true") then
	else
		player:i_add(item("time_net",1))
		player:set_value("TimeNet", "true")
		game.add_msg("A mysterious net appears before you, warping strangely in ways that seem impossible")
	end
end

function MOD.on_day_passed()
	if (player:get_value("TimeNet") == "true") then
	else
		player:i_add(item("time_net",1))
		player:set_value("TimeNet", "true")
		game.add_msg("A mysterious net appears before you, warping strangely in ways that seem impossible")
	end
end

function MOD.on_savegame_loaded()
	if (player:get_value("TimeNet") == "true") then
		if (player:get_value("TimenetCast") == "true") then
			TimenetCast = true
		else
			TimenetCast = false
		end
	else
		player:i_add(item("time_net",1))
		player:set_value("TimeNet", "true")
		game.add_msg("A mysterious net appears before you, warping strangely in ways that seem impossible")
	end
end