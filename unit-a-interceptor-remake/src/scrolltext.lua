-- Scrolltext

require 'common'
require 'demo_strings'

gl_w = 8
gl_h = 8
pixel_size = 2

scrl_x = 0
scrl_y = 96
scroll_offset = 0
char_offset = 0
scrl_speed = 80
color_cycle = 0

glypth_list = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!\"#$%&'()*+,-./0123456789:;<=>?@"

function char_to_index(c)
	c = string.upper(c)
	if c >= "A" and c <= "Z" then
		return string.byte(c) - string.byte("A")
	end

	if c >= "0" and c <= "9" then
		return string.byte(c) - string.byte("0")
	end

	for i = 1, glypth_list:len() do
		if glypth_list:sub(i,i) == c then
			return i - 1
		end
	end

	return -1
end

function scroll_text_draw(dt)
	i = 0
	x = 0
	color_cycle = color_cycle + dt * 30
	if color_cycle > 9 then
		color_cycle = 0
	end
	txt_fname = "assets/ua_font_" .. tostring(math.floor(color_cycle)) .. ".png"

	while x < SCR_WIDTH / ZOOM_RATIO do
		x = scrl_x - scroll_offset + i * gl_w
		y = scrl_y
		j = i + char_offset
		j = j % scroll_text:len()
		c = char_to_index(scroll_text:sub(j,j))
		if c >= 0 then
			gsplus:Blit2D(math.floor(c * gl_w * pixel_size), 0, math.floor(gl_w * pixel_size), gl_h * pixel_size, x * ZOOM_RATIO, y * ZOOM_RATIO, gl_w * ZOOM_RATIO, gl_h * ZOOM_RATIO, txt_fname, gs.Color.White)
		end
		i = i + 1
	end

	scroll_offset = scroll_offset + (dt * scrl_speed)

	if scroll_offset > gl_w then
		scroll_offset = scroll_offset - gl_w
		char_offset = char_offset + 1
	end
end