require 'partida'

LevelManage = {
	estado,
	func,
	partida,
	batata
}



function LevelManage:iniciar()
	self.estado = 0
	self.batata = "x"
	return self
end

function LevelManage:iniciarPartida()
	self.estado = 1
	self.partida = Partida:new()
end

function LevelManage:desenhar()
	if self.estado == 0 then

	elseif self.estado == 1 then
		self.partida:desenhar()
	end
end

function LevelManage:update(dt)
	if self.estado == 0 then

	elseif self.estado == 1 then
		self.partida:update(dt)
	end
end