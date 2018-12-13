function minute(item, active)
	local speed = player:get_speed()
	local moves = 10 * speed
	player:mod_moves(moves)
	player:i_rem(item)
	game.add_msg("You feel as if you suddenly have plenty of time to spare, an entire minute in fact, best make good use of it")
end

Timenet = nil
TimenetCast = false

function cast_timenet(item, active)
	Timenet = player:i_add(item("time_net_active",1))
	Timenet.charges = item.charges
	TimenetCast = true
	player:i_rem(item)
	game.add_msg("You try to cast the net but it doesn't move, you feel sluggish.")
	player:set_value("TimenetCast", "true")
end

function fold_timenet(item, active)
	Timenet = player:i_add(item("time_net",1))
	Timenet.charges = item.charges
	TimenetCast = false
	player:i_rem(item)
	game.add_msg("You fold up the net and feel much faster.")
	player:set_value("TimenetCast", "false")
end

game.register_iuse("IUSE_MINUTE", minute)
game.register_iuse("IUSE_CAST_TIMENET", cast_timenet)
game.register_iuse("IUSE_FOLD_TIMENET", fold_timenet)