-- D:\projects\amiga-experiments\lua_intro\project

SCR_WIDTH = 400
SCR_HEIGHT = 300
ZOOM_RATIO = SCR_HEIGHT / 287
gsplus = nil

gs.LoadPlugins()
gs.MountFileDriver(gs.StdFileDriver())

require 'resolution_selector'
require 'demo_audio'
require 'starfield'
require 'scrolltext'
require 'demo'

DEMO_STATE = resolution_selector

demo_open_screen()
resolution_selector_init()

function do_nothing()
end

-- play_music()

exit_code = false

while not exit_code do
	if gsplus ~= nil then 
		dt_sec = gsplus:UpdateClock()
		gsplus:Clear()
	end

	exit_code = DEMO_STATE()

	if gsplus ~= nil then 
		gsplus:Flip()
		gsplus:UpdateClock()
	end
end