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

while 1 do
	if gsplus ~= nil then 
		dt_sec = gsplus:UpdateClock()
		gsplus:Clear()
	end

	DEMO_STATE()

	-- gsplus:Image2D((SCR_WIDTH - 1024 * (ZOOM_RATIO / 2)) / 2, 0, ZOOM_RATIO / 2, "assets/background.png", gs.Color.White)
	-- starfield_update(dt_sec:to_sec())
	-- starfield_draw()
	-- scroll_text_draw(dt_sec:to_sec())
	-- logo_draw(dt_sec:to_sec())

	if gsplus ~= nil then 
		gsplus:Flip()
		gsplus:UpdateClock()
	end
end