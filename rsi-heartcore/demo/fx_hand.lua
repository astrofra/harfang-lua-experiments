bg_zoom_phase = 0

function background_update(dt)
	gsplus:SetBlend2D(gs.BlendOpaque)
	gsplus:SetDepthTest2D(true)
	zoom_bg = RangeAdjust(math.sin(bg_zoom_phase), -1, 1, 1.0, 1.25)
	bg_zoom_phase = bg_zoom_phase + (dt * 2.0)
	gsplus:Image2D((SCR_WIDTH - 2048 * (ZOOM_RATIO * zoom_bg)) / 2, (SCR_HEIGHT - 1365 * (ZOOM_RATIO * zoom_bg)) / 2, ZOOM_RATIO * zoom_bg, "assets/rsio_bg.png", gs.Color.White)
end

function fx_hand_update(dt)
	background_update(dt)

	gsplus:SetBlend2D(gs.BlendAlpha)
	gsplus:SetDepthTest2D(true)
	zoom_hand = 2
	gsplus:Image2D((SCR_WIDTH - 760 * (ZOOM_RATIO * zoom_hand)) / 2, (SCR_HEIGHT - 512 * (ZOOM_RATIO * zoom_hand)) / 2, ZOOM_RATIO * zoom_hand, "assets/hand.png", gs.Color.White)
	-- logo_draw(dt_sec:to_sec())
end