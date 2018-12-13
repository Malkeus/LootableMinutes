local MOD = {}

mods["LootableMinutes"] = MOD

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
	else
		player:i_add(item("time_net",1))
		player:set_value("TimeNet", "true")
		game.add_msg("A mysterious net appears before you, warping strangely in ways that seem impossible")
	end
end