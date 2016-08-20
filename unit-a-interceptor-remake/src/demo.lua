function logo_draw(dt)
	xo = 8 * ZOOM_RATIO
	yo = 16 * ZOOM_RATIO
	w = 88 * ZOOM_RATIO / 2 
	h = 72 * ZOOM_RATIO / 2
	logo_phase = logo_phase + dt
	w = w * math.abs(math.sin(logo_phase)) / 2
	-- w = w / 4
	-- w = math.floor(w)
	-- w = w * 2
	-- w = math.max(1, w)
	gsplus:Quad2D(SCR_WIDTH/2 - w + xo, SCR_HEIGHT/2 + yo, SCR_WIDTH/2 - w + xo, SCR_HEIGHT/2 + h + yo, SCR_WIDTH/2 + w + xo, SCR_HEIGHT/2 + h + yo, SCR_WIDTH/2 + w + xo, SCR_HEIGHT/2 + yo, gs.Color.White, gs.Color.White, gs.Color.White, gs.Color.White, logo_tex, 0,0,1,1) 
end

function demo_open_screen()
	gsplus = gs.GetPlus()
	gsplus:RenderInit(SCR_WIDTH, SCR_HEIGHT, "pkg.core")
end

function demo_close_screen()
	if gsplus ~= nil then
		gsplus:RenderUninit()
		gsplus = nil
	end
end

function demo_init()
	frame_count = 0
	logo_phase = 0

	logo_tex = gsplus:GetRenderer():LoadTexture("assets/ua_logo.png")

	starfield_init()
	starfield_set_camera_velocity(gs.Vector3(0, -75, -25))

	DEMO_STATE = demo_start
end

function demo_start()
	play_music()
	gsplus:ResetClock()	

	DEMO_STATE = demo_update
end

function demo_update(dt)
	gsplus:SetBlend2D(gs.BlendAlpha)
	gsplus:SetDepthTest2D(true)
	gsplus:Image2D((SCR_WIDTH - 1024 * (ZOOM_RATIO / 2)) / 2, 0, ZOOM_RATIO / 2, "assets/background.png", gs.Color.White)
	starfield_update(dt_sec:to_sec())
	starfield_draw()
	scroll_text_draw(dt_sec:to_sec())
	logo_draw(dt_sec:to_sec())
	if gsplus:IsAppEnded() then
		return true
	else
		return false
	end
end