function start_fx_hand(dt)
	print("start_fx_hand()")
	DEMO_STATE = fx_hand
end

function fx_hand(dt)
	fx_clock = demo_clock - get_fx_start_time('fx_hand')
	fx_clock_norm = fx_clock / get_fx_end_time('fx_hand')

	background_update(dt)

	gsplus:SetBlend2D(gs.BlendAlpha)
	gsplus:SetDepthTest2D(true)
	zoom_hand = 2
	gsplus:Image2D((SCR_WIDTH - 760 * (ZOOM_RATIO * zoom_hand)) / 2, (SCR_HEIGHT - 512 * (ZOOM_RATIO * zoom_hand)) / 2, ZOOM_RATIO * zoom_hand, "assets/hand.png", gs.Color.White)

	--	white fade
	foreground_white_fade(fx_clock)

	gsplus:Text2D(5, 5, "fx_hand")
	-- logo_draw(dt_sec:to_sec())
end