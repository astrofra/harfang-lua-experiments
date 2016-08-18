function start_fx_hand(dt)
	print("start_fx_hand()")
	DEMO_STATE = fx_hand
end

function fx_hand(dt)
	background_update(dt)

	gsplus:SetBlend2D(gs.BlendAlpha)
	gsplus:SetDepthTest2D(true)
	zoom_hand = 2
	gsplus:Image2D((SCR_WIDTH - 760 * (ZOOM_RATIO * zoom_hand)) / 2, (SCR_HEIGHT - 512 * (ZOOM_RATIO * zoom_hand)) / 2, ZOOM_RATIO * zoom_hand, "assets/hand.png", gs.Color.White)

	gsplus:Text2D(5, 5, "fx_hand")
	-- logo_draw(dt_sec:to_sec())
end