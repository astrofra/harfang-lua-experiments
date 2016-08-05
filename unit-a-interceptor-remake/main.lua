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

play_music()

while 1 do
	-- gsplus:SetBlend2D(gs.BlendAdditive)
	gsplus:Clear()
	gsplus:Image2D(0, 0, SCR_HEIGHT / 287 / 2, "@assets/background.png", gs.Color.White)
	gsplus:Line3D(-500, -500, -500, 500, 500, 500, gs.Color.White, gs.Color.White)
	gsplus:Line3D(500, 500, -500, -500, -500, 500, gs.Color.White, gs.Color.White)

	gsplus:Flip()
end