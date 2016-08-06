-- Scrolltext

require 'common'
require 'demo_strings'

gl_w = 8
gl_h = 8

scrl_x = 0
scrl_y = 96
scroll_offset = 0
char_offset = 0
scrl_speed = 60

glypth_list = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!\"#$%&'()*+,-./0123456789:;<=>?@"

function char_to_index(c)
	c = string.upper(c)
	if c >= "A" and c <= "Z" then
		return string.byte(c) - string.byte("A")
	end

	if c >= "0" and c <= "9" then
		return string.byte(c) - string.byte("0")
	end

	if c == "!" then
		return 27
	end

	return -1
end

function scroll_text_draw(handler, dt)
	i = 0
	x = 0

	while x < SCR_WIDTH / ZOOM_RATIO do
		x = scrl_x - scroll_offset + i * gl_w
		y = scrl_y
		j = i + char_offset
		j = j % string.len(scroll_text)
		c = char_to_index(string.sub(scroll_text, j))
		if c >= 0 then
			handler:Blit2D(c * gl_w, 0, gl_w, gl_h, x * ZOOM_RATIO, y * ZOOM_RATIO, gl_w * ZOOM_RATIO, gl_h * ZOOM_RATIO, "@assets/ua_font.png", gs.Color.White)
		end
		i = i + 1
	end

	scroll_offset = scroll_offset + (dt * scrl_speed)

	if scroll_offset > gl_w then
		scroll_offset = scroll_offset - gl_w
		char_offset = char_offset + 1
	end
end