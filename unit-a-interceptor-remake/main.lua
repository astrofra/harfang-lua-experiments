-- D:\projects\amiga-experiments\lua_intro\project
SCR_WIDTH = 1280
SCR_HEIGHT = 720

require 'demo_audio'
require 'starfield'

function intro_init()
	-- print(gs.get_default_plugins_path())
	gs.LoadPlugins('D:/projects/harfang-lua-experiments/unit-a-interceptor-remake')

	gsplus = gs.GetPlus()
	gsplus:RenderInit(SCR_WIDTH, SCR_HEIGHT, "pkg.core")

	gs.MountFileDriver(gs.StdFileDriver("assets/"), "@assets/")
end

function scene3d_init()
	scn = gsplus:NewScene()

	while not scn:IsReady() do
		gsplus:UpdateScene(scn, 0.0)
	end

	-- Add an environment to the scene
	env = gs.Environment()
	env:SetBackgroundColor(gs.Color.Red)
	scn:AddComponent(env)

	-- Add a camera
	render_camera = gs.Node()
	render_camera:AddComponent(gs.Transform())
	render_camera:AddComponent(gs.Camera())
	scn:AddNode(render_camera)
	scn:SetCurrentCamera(render_camera)
	render_camera:GetTransform():SetPosition(gs.Vector3(0, -25, -50))
	render_camera:GetComponent('Camera'):SetZoomFactor(2.0) 
end

intro_init()
scene3d_init()

frame_count = 0

starfield_init()
starfield_set_camera_velocity(gs.Vector3(0, -25, -50))

gsplus:ResetClock()

play_music()

while 1 do
	-- print ("frame_count = " .. frame_count)
	-- frame_count = frame_count + 1
	dt_sec = gsplus:UpdateClock()
	gsplus:UpdateScene(scn, dt_sec)

	gsplus:Clear()
	gsplus:Image2D(0, 0, SCR_HEIGHT / 287 / 2, "@assets/background.png", gs.Color.White)
	-- gsplus:Commit2D()
	starfield_update(dt_sec:to_sec())
	starfield_draw(gsplus)

	gsplus:Flip()
	gsplus:UpdateClock()
end