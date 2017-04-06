--

function start_fx_hello_outline(dt)
	print("start_fx_hello_outline()")
	DEMO_STATE = fx_hello_outline
end

function fx_hello_outline(dt, demo_clock)
	--
	wipe_len = 25 / 30
	wipe_max_x = SCR_WIDTH / 3
	fx_clock = demo_clock - get_fx_start_time('fx_hello_outline')
	fx_clock_norm = fx_clock / get_fx_end_time('fx_hello_outline')

	--	blue bg
	gsplus:Clear(color_blue_dark)

	--	blue wipe
	gsplus:SetBlend2D(gs.BlendOpaque)
	gsplus:SetDepthTest2D(true) 

	wipe_clock = RangeAdjust(Clamp(fx_clock, 0, get_fx_end_time('fx_hello_outline') / 5), 0, get_fx_end_time('fx_hello_outline') / 5, 0, 1)
	wipe_clock = EaseInOutQuick(wipe_clock)

	gsplus:Quad2D(0, 0, 0, SCR_HEIGHT, wipe_clock * wipe_max_x, SCR_HEIGHT, wipe_clock * wipe_max_x, 0, color_blue_light, color_blue_light, color_blue_light, color_blue_light, nil, 0,0,1,1)

	--	orange wipe
	orange_wipe_start = wipe_len * 1.1
	orange_wipe_end = orange_wipe_start + wipe_len
	wipe_clock = RangeAdjust(Clamp(fx_clock, orange_wipe_start, orange_wipe_end), orange_wipe_start, orange_wipe_end, 0, 1)
	wipe_clock = EaseInOutQuick(wipe_clock)

	gsplus:Quad2D(wipe_max_x, 0, wipe_max_x, wipe_clock * SCR_HEIGHT, SCR_WIDTH, wipe_clock * SCR_HEIGHT, SCR_WIDTH, 0, gs.Color.Yellow, gs.Color.Yellow, gs.Color.Yellow, gs.Color.Orange , nil, 0,0,1,1)
	gsplus:Line2D(wipe_max_x, 0, wipe_max_x, wipe_clock * SCR_HEIGHT, gs.Color.White)

	--	white fade
	foreground_white_fade(fx_clock)

	gsplus:Text2D(5, 5, "fx_hello_outline" .. " " .. fx_clock)

	if demo_clock > get_fx_end_time('fx_hello_outline') then
		DEMO_STATE = start_fx_red_sector_title
	end
end