function confTela()
	height = 620
	width = 700
	love.window.setMode(width, height)
	music = love.audio.newSource("tetris.mp3", "stream")
	music:setVolume(0.5)
	music:play()
end