require 'levelManage'
require 'configure'

function love.load()
	confTela()
	levelManage = LevelManage:iniciar()
	levelManage:iniciarPartida()
	math.randomseed(os.time())
end

function love.draw()
	levelManage:desenhar()
end

function love.update(dt)
	require("lovebird").update()
	levelManage:update(dt)
end
