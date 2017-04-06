--

function start_fx_brings_you(dt)
	print("start_fx_brings_you()")
	DEMO_STATE = fx_brings_you
end

function fx_brings_you(dt, demo_clock)
	fx_clock = demo_clock - get_fx_start_time('fx_brings_you')
	fx_clock_norm = fx_clock / get_fx_end_time('fx_brings_you')

	gsplus:Text2D(5, 5, "fx_brings_you" .. " " .. fx_clock)

	if demo_clock > get_fx_end_time('fx_brings_you') then
		DEMO_STATE = start_fx_hand -- start_fx_heartcore_title
	end
end