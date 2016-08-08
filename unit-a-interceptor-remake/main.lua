-- D:\projects\amiga-experiments\lua_intro\project
SCR_WIDTH = 720
SCR_HEIGHT = 575
ZOOM_RATIO = SCR_HEIGHT / 287

require 'demo_audio'
require 'starfield'
require 'scrolltext'

function intro_init()
	gs.LoadPlugins()

	gsplus = gs.GetPlus()
	gsplus:RenderInit(SCR_WIDTH, SCR_HEIGHT, "pkg.core")

	gs.MountFileDriver(gs.StdFileDriver("assets/"), "@assets/")
end

function logo_draw(dt)
	xo = 8 * ZOOM_RATIO
	yo = 16 * ZOOM_RATIO
	w = 88 * ZOOM_RATIO / 2 
	h = 72 * ZOOM_RATIO / 2
	logo_phase = logo_phase + dt
	w = w * math.abs(math.sin(logo_phase))
	w = w / 4
	w = math.floor(w)
	w = w * 2
	w = math.max(1, w)
	gsplus:Quad2D(SCR_WIDTH/2 - w + xo, SCR_HEIGHT/2 + yo, SCR_WIDTH/2 - w + xo, SCR_HEIGHT/2 + h + yo, SCR_WIDTH/2 + w + xo, SCR_HEIGHT/2 + h + yo, SCR_WIDTH/2 + w + xo, SCR_HEIGHT/2 + yo, gs.Color.White, gs.Color.White, gs.Color.White, gs.Color.White, logo_tex, 0,0,1,1) 
end

intro_init()

frame_count = 0
logo_phase = 0

logo_tex = gsplus:GetRenderer():LoadTexture("@assets/ua_logo.png")

starfield_init()
starfield_set_camera_velocity(gs.Vector3(0, -75, -25))

gsplus:ResetClock()

play_music()

gsplus:SetBlend2D(gs.BlendAlpha)
gsplus:SetDepthTest2D(true)

while 1 do
	dt_sec = gsplus:UpdateClock()

	gsplus:Clear()
	gsplus:Image2D((SCR_WIDTH - 1024 * (ZOOM_RATIO / 2)) / 2, 0, ZOOM_RATIO / 2, "@assets/background.png", gs.Color.White)
	starfield_update(dt_sec:to_sec())
	starfield_draw(gsplus)
	scroll_text_draw(gsplus, dt_sec:to_sec())
	logo_draw(dt_sec:to_sec())

	gsplus:Flip()
	gsplus:UpdateClock()
end