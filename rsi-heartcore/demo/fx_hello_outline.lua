--

function start_fx_hello_outline(dt)
	print("start_fx_hello_outline()")
	DEMO_STATE = fx_hello_outline
end

function fx_hello_outline(dt, demo_clock)
	if demo_clock > get_fx_end_time('fx_hello_outline') then
		DEMO_STATE = start_fx_red_sector_title
	end
end