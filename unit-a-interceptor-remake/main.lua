-- D:\projects\amiga-experiments\lua_intro\project
SCR_WIDTH = 1280
SCR_HEIGHT = 720
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

intro_init()

frame_count = 0

starfield_init()
starfield_set_camera_velocity(gs.Vector3(0, -50, -25))

gsplus:ResetClock()

play_music()

gsplus:SetBlend2D(gs.BlendAlpha)
gsplus:SetDepthTest2D(true)

while 1 do
	dt_sec = gsplus:UpdateClock()

	gsplus:Clear()
	gsplus:Image2D(0, 0, ZOOM_RATIO, "@assets/background.png", gs.Color.White)
	starfield_update(dt_sec:to_sec())
	starfield_draw(gsplus)
	scroll_text_draw(gsplus, dt_sec:to_sec())

	gsplus:Flip()
	gsplus:UpdateClock()
end