function confTela()
	height = 630
	width = 700
	love.window.setMode(width, height)
	music = love.audio.newSource("tetris.mp3", "stream")
	music:setVolume(0.5)
	music:play()
	blocoParede = love.graphics.newImage("parede.jpg")
	font = love.graphics.newFont("fonte.ttf", 30)
end