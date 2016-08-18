-- Colors

color_blue_dark = gs.Color(51 / 255, 75 / 255, 106 / 255, 1.0)
color_blue_light = gs.Color(71 / 255, 119 / 255, 141 / 255, 1.0)

-- Bitmap Background

bg_zoom_phase = 0

function background_update(dt)
	gsplus:SetBlend2D(gs.BlendOpaque)
	gsplus:SetDepthTest2D(true)
	zoom_bg = RangeAdjust(math.sin(bg_zoom_phase), -1, 1, 1.0, 1.25)
	bg_zoom_phase = bg_zoom_phase + (dt * 2.0)
	gsplus:Image2D((SCR_WIDTH - 2048 * (ZOOM_RATIO * zoom_bg)) / 2, (SCR_HEIGHT - 1365 * (ZOOM_RATIO * zoom_bg)) / 2, ZOOM_RATIO * zoom_bg, "assets/rsio_bg.png", gs.Color.White)
end

function foreground_white_fade(fx_clock, fade_len)
	fade_len = fade_len or 16 / 60
	gsplus:SetBlend2D(gs.BlendAdditive)
	gsplus:SetDepthTest2D(true) 

	fade_clock = Clamp(RangeAdjust(fx_clock, 0, fade_len, 1, 0), 0, 1)
	fade_clock = EaseInOutQuick(fade_clock)
	color_fade = gs.Color(fade_clock, fade_clock, fade_clock, 1)
	gsplus:Quad2D(0, 0, 0, SCR_HEIGHT, SCR_WIDTH, SCR_HEIGHT, SCR_WIDTH, 0, color_fade, color_fade, color_fade, color_fade, nil, 0,0,1,1)
end