--

function start_fx_red_sector_title(dt)
	print("start_fx_red_sector_title()")
	DEMO_STATE = fx_red_sector_title
end

function fx_red_sector_title(dt, demo_clock)
	gsplus:Text2D(5, 5, "fx_red_sector_title")

	if demo_clock > get_fx_end_time('fx_red_sector_title') then
		DEMO_STATE = start_fx_brings_you
	end
end