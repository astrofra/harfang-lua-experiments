-- Scrolltext

require 'common'

gl_w = 8
gl_h = 8

scrl_x = 0
scrl_y = 32 * ZOOM_RATIO

function scroll_text_draw(handler)
	handler:Blit2D(0, 0, gl_w, gl_h, scrl_x, scrl_y, gl_w * ZOOM_RATIO, gl_h * ZOOM_RATIO, "@assets/crystal.png", gs.Color.White)
end