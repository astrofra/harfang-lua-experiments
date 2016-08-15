-- Demo audio

function play_music()
	-- global al, channel
	-- create an OpenAL mixer and wrap it with the MixerAsync interface
	al = gs.MixerAsync(gs.ALMixer())
	al:Open()
	future_channel = al:Stream("assets/unit5.xm")
	channel = future_channel:get()
end