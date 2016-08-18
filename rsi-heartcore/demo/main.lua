-- D:\projects\amiga-experiments\lua_intro\project

SCR_WIDTH = 400
SCR_HEIGHT = 300
ZOOM_RATIO = SCR_HEIGHT / 1365
gsplus = nil

require 'common'
require 'resolution_selector'
require 'demo_audio'
require 'demo'
require 'common_fx'
require 'timings'

require 'fx_hello_outline'
require 'fx_red_sector_title'
require 'fx_brings_you'
require 'fx_hand'

DEMO_STATE = resolution_selector

gs.LoadPlugins()
gs.MountFileDriver(gs.StdFileDriver())

demo_open_screen()
resolution_selector_init()

function do_nothing()
end

-- play_music()

function print_time(demo_clock)
	clock_sec = math.floor(demo_clock)
	if clock_sec ~= prev_clock_sec then
		print(clock_sec)
	end
	prev_clock_sec = clock_sec
end

while 1 do
	if gsplus ~= nil then 
		dt = gsplus:UpdateClock()
		gsplus:Clear()
	end

	if DEMO_STATE ~= nil then
		dt_sec = dt:to_sec()
		DEMO_STATE(dt_sec, demo_clock)
	end

	if gsplus ~= nil then 
		gsplus:Flip()
		if demo_start_clock ~= nil then
			demo_clock = (gsplus:GetClock() - demo_start_clock):to_sec()
		else
			demo_clock = 0
		end
		print_time(demo_clock)
	end
end