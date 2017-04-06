demo_start_clock = nil
demo_is_starting = true

function demo_open_screen()
	gsplus = gs.GetPlus()
	gsplus:RenderInit(SCR_WIDTH, SCR_HEIGHT)
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

	-- logo_tex = gsplus:GetRenderer():LoadTexture("assets/ua_logo.png")


	DEMO_STATE = demo_start
	demo_is_starting = false
end

function demo_start()
	print("demo_start()")
	play_music()
	-- gsplus:ResetClock()	
	demo_start_clock = gsplus:GetClock()

	DEMO_STATE = start_demo
end

function start_demo(dt)
	DEMO_STATE = start_fx_hello_outline
end

function demo_update(dt)
	gsplus:SetBlend2D(gs.BlendAlpha)
	gsplus:SetDepthTest2D(true)
	-- gsplus:Image2D((SCR_WIDTH - 1024 * (ZOOM_RATIO / 2)) / 2, 0, ZOOM_RATIO / 2, "assets/background.png", gs.Color.White)
	-- logo_draw(dt_sec:to_sec())
end