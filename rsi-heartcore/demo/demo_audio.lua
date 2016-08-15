-- Demo audio

function play_music()
	-- global al, channel
	-- create an OpenAL mixer and wrap it with the MixerAsync interface
	al = gs.MixerAsync(gs.ALMixer())
	al:Open()
	future_channel = al:Stream("assets/geir_tjelta_i_love_holy_daze.ogg")
	channel = future_channel:get()
end