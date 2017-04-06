source_fps = 30
dest_fps = 60

timings = {
	fx_hello_outline={0, 109}, fx_red_sector_title={110, 229}, fx_brings_you={230, 349}, fx_hand={350, 469}, 
	fx_buddha={470, 589}, fx_pentagon_tunnel={590, 709}, fx_heartcore_dualplayfield={710, 829}, fx_heartcore_title={830, 959}, 
	fx_triangle_tunnel={960, 1079}, fx_rsi_ring={1080, 1199}, fx_rat_king={1200, 1319}, fx_hexoball_grey={1320, 1559}, 
	fx_alien_greets={1560, 1889}, fx_lego_credits={1890, 2079}, fx_hexoball_white={2080, 2199}, fx_hexoball_dark={2200, 2319}, 
	fx_grolsch={2320, 2439}, fx_purple_starfield={2440, 2714}, fx_gameboy_end={2715, 3000}
}

function get_fx_start_time(fx_key)
	return timings[fx_key][1] / source_fps
end 

function get_fx_end_time(fx_key)
	return timings[fx_key][2] / source_fps
end 