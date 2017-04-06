--

function start_fx_red_sector_title(dt)
	print("start_fx_red_sector_title()")
	DEMO_STATE = fx_red_sector_title
end

function fx_red_sector_title(dt, demo_clock)
	fx_clock = demo_clock - get_fx_start_time('fx_red_sector_title')
	fx_clock_norm = fx_clock / get_fx_end_time('fx_red_sector_title')


	--	blue bg
	gsplus:Clear(color_blue_dark)

	-- Logo
	layer_start = 0
	layer_end = 15 / 30
	layer_clock = RangeAdjust(Clamp(fx_clock, layer_start, layer_end), layer_start, layer_end, 0, 1)
	layer_clock = EaseInOutQuick(layer_clock)

	gsplus:SetBlend2D(gs.BlendAlpha)
	gsplus:SetDepthTest2D(true)
	gsplus:Image2D(0, SCR_HEIGHT * 0.25 * layer_clock, 1.0, "assets/rsi_8bit_small.png", gs.Color.White)

	if fx_clock < layer_end then
		gsplus:Image2D(0, SCR_HEIGHT * 0.25 * layer_clock, 1.0, "assets/rsi_8bit_small_white.png", gs.Color.White * layer_clock)
	else
		layer_start = layer_end
		layer_end = layer_end * 1.5
		layer_clock = RangeAdjust(Clamp(fx_clock, layer_start, layer_end), layer_start, layer_end, 1, 0)
		layer_clock = EaseInOutQuick(layer_clock)
		gsplus:Image2D(0, SCR_HEIGHT * 0.25, 1.0, "assets/rsi_8bit_small_white.png", gs.Color.White * layer_clock)	
	end

	--

	--	white fade
	foreground_white_fade(fx_clock)

	gsplus:Text2D(5, 5, "fx_red_sector_title" .. " " .. fx_clock)

	if demo_clock > get_fx_end_time('fx_red_sector_title') then
		DEMO_STATE = start_fx_brings_you
	end
end