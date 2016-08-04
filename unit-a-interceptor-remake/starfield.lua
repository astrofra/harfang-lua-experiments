-- Starfield 3D

max_stars = 0
particle_size = 1.5
stars = {}
starfield_size = gs.Vector3(50, 50, 500)
camera_velocity = gs.Vector3()
pos_dt = gs.Vector3()


function starfield_init(_max_stars)
	-- global stars, max_stars, starfield_size
	max_stars = _max_stars or 500

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
			pos.y = pos.y - starfield_size.y
		else
			if pos.y < -starfield_size.y then
				pos.y = pos.y + starfield_size.y
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

function starfield_draw(rctx)
	-- global pos_dt, starfield_size, stars, max_stars

	for i = 1, max_stars do
		p = 0.2 + (stars[i]['pos'].z / starfield_size.z)
		p = p * particle_size
		a = stars[i]['pos']
		b = stars[i]['pos'] + gs.Vector3(-p, 0, 0)
		c = stars[i]['pos'] + gs.Vector3(-p, p, 0)
		d = stars[i]['pos'] + gs.Vector3(0, p, 0)
		-- rctx:Line3D(a.x, a.y, a.z, b.x, b.y, b.z, gs.Color.White, gs.Color.White)
		rctx:Quad3D(a.x, a.y, a.z, b.x, b.y, b.z, c.x, c.y, c.z, d.x, d.y, d.z, gs.Color.White, gs.Color.White, gs.Color.White, gs.Color.White, nil, 0, 0, 1, 1)
		-- rctx:Triangle3D(a.x, a.y, a.z, b.x, b.y, b.z, c.x, c.y, c.z, gs.Color.White, gs.Color.White, gs.Color.White)
	end

	-- print(pos_a.x, pos_a.y, pos_a.z)
end