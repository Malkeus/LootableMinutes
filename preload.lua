function minute(item, active)
	local speed = player:get_speed()
	local moves = 10 * speed
	player:mod_moves(moves)
	player:i_rem(item)
	game.add_msg("You feel as if you suddenly have plenty of time to spare, an entire minute in fact, best make good use of it")
end

function store_minute(item, active)
	player:item_handling_cost(item, true, 2)
	local moves = player.movecounter
	player:mod_moves(-moves)
	if (math.floor(item.charges) < item:ammo_capacity()) then
		item.charges = item.charges + moves
		if (item.charges > item:ammo_capacity()) then
			item.charges = item:ammo_capacity()
		end
	end
	if (item.charges > 9500) then
		player:i_add(item("minute", 1))
		item.charges = 0
		game.add_msg("The net shudders and congeals a literal piece of Time itself.")
	else
		game.add_msg("Time jumps past you, the net strangely shimmers")
	end
	if (item.charges < 0) then
		player:mod_moves(1)
		item.charges = 0
	end
end

game.register_iuse("IUSE_MINUTE", minute)
game.register_iuse("IUSE_STORE_MINUTE", store_minute)