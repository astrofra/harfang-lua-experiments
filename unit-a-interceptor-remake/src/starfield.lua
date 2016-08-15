-- Starfield 3D

require 'common'

max_stars = 0
particle_size = 5.0
stars = {}
starfield_size = gs.Vector3(50, 50, 25)
camera_velocity = gs.Vector3()
pos_dt = gs.Vector3()
zoom = 100.0
camera_pos = gs.Vector3(0, 0, 5)


function starfield_init(_max_stars)
	-- global stars, max_stars, starfield_size
	max_stars = _max_stars or 35

	function rand_point_within_size()
		-- global starfield_size
		return gs.Vector3(math.random(-starfield_size.x, starfield_size.x),
		                  math.random(-starfield_size.y, starfield_size.y),
		                  math.random(-starfield_size.z, starfield_size.z))
	end

	for i = 1, max_stars do
		table.insert(stars, {pos = rand_point_within_size(), intensity = 1.0})
	end
end

function starfield_set_camera_velocity(vec)
	-- global camera_velocity, pos_dt
	camera_velocity = vec
	framerate = 60.0
	while framerate > 0 and pos_dt:Len() < 5.0 do
		pos_dt = camera_velocity * (1.0 / framerate)
		framerate = framerate - 1.0
	end
end

function starfield_update(dt)
	-- global camera_velocity, starfield_size, stars, max_stars

	for i = 1, max_stars do
		pos = stars[i]['pos']
		pos = pos + camera_velocity * dt

		if pos.x > starfield_size.x then
			pos.x = pos.x - starfield_size.x
		else
			if pos.x < -starfield_size.x then
				pos.x = pos.x + starfield_size.x
			end
		end

		if pos.y > starfield_size.y then
			pos.y = pos.y - 2 * starfield_size.y
		else
			if pos.y < -starfield_size.y then
				pos.y = pos.y + 2 * starfield_size.y
			end
		end

		if pos.z > starfield_size.z then
			pos.z = pos.z - starfield_size.z 
		else
			if pos.z < starfield_size.z * -0.1 then
				pos.z = pos.z + starfield_size.z * 1.1
			end
		end

		stars[i]['pos'] = pos -- /!\ try to comment this line
	end
end

function starfield_draw()
	for i = 1, max_stars do
		p = RangeAdjust(stars[i]['pos'].z, starfield_size.z * -0.1, starfield_size.z, 1.0, 0.05)
		p = Clamp(p, 0.0, 1.0)
		a = stars[i]['pos'] + camera_pos

		if a.z ~= 0 then
			x2d = (a.x  * zoom) / a.z
			y2d = (a.y  * zoom) / a.z
			gsplus:Sprite2D(x2d + (SCR_WIDTH * 0.5), y2d + (SCR_HEIGHT * 0.5), p * particle_size * ZOOM_RATIO, "assets/yellow_star.png", gs.Color.White, -2.5 * p, -2.5 * p, false, false)
		end
	end
end