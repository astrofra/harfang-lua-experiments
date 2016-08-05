-- D:\projects\amiga-experiments\lua_intro\project
SCR_WIDTH = 1280
SCR_HEIGHT = 720

require 'demo_audio'
require 'starfield'

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
gsplus:SetDepthTest2D(false)

while 1 do
	dt_sec = gsplus:UpdateClock()

	gsplus:Clear()
	gsplus:Image2D(0, 0, SCR_HEIGHT / 287, "@assets/background.png", gs.Color.White)
	starfield_update(dt_sec:to_sec())
	starfield_draw(gsplus)

	gsplus:Flip()
	gsplus:UpdateClock()
end