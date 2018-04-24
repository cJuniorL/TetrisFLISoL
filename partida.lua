require 'pedra'
lovebird = require "lovebird"

Partida = {
	tabuleiro = {},
	pedraAtiva,
	proxPedra,
	pontos
}

function Partida:new()
	pontos = 0
	local jTable = {}
	for i = 0, 19, 1 do
		self.tabuleiro[i] = {}
		for j = 0, 9, 1 do
			self.tabuleiro[i][j] = {0, {nil, nil, nil}}
		end
	end
	self.tabuleiro[19][1] = {1, {255, 255, 255}}
	self.tabuleiro[19][2] = {1, {255, 255, 255}}
	self.tabuleiro[19][5] = {1, {255, 255, 255}}
	self.tabuleiro[19][6] = {1, {255, 255, 255}}
	self.tabuleiro[19][7] = {1, {255, 255, 255}}
	self.tabuleiro[19][8] = {1, {255, 255, 255}}
	self.tabuleiro[19][9] = {1, {255, 255, 255}}
	self.tabuleiro[18][1] = {1, {255, 255, 255}}
	self.tabuleiro[18][2] = {1, {255, 255, 255}}
	self.tabuleiro[18][5] = {1, {255, 255, 255}}
	self.tabuleiro[18][6] = {1, {255, 255, 255}}
	self.tabuleiro[18][7] = {1, {255, 255, 255}}
	self.tabuleiro[18][8] = {1, {255, 255, 255}}
	self.tabuleiro[18][9] = {1, {255, 255, 255}}
	self.tabuleiro[17][9] = {1, {255, 0, 0}}
	self.pedraAtiva = Pedra:new(6)
	proxPedra = math.random(0, 6)
	return self
end

function Partida:desenhar()
	love.graphics.setColor(0,0,0)
	for i in ipairs(self.tabuleiro) do
		for j in ipairs(self.tabuleiro[i]) do
			if self.tabuleiro[i][j][1] == 0 then
				love.graphics.setColor(127,127, 127)	
				love.graphics.rectangle('line', 5 + (j * 25), 5 + (i * 25), 25, 25)
			else
				if self.tabuleiro[i][j][2][1] ~= nil then
				love.graphics.setColor(self.tabuleiro[i][j][2][1], self.tabuleiro[i][j][2][2], self.tabuleiro[i][j][2][3])
				else
					love.graphics.setColor(30, 30, 30)
				end
				love.graphics.rectangle('fill', 5 + (j * 25), 5 + (i * 25), 25, 25)
			end
			love.graphics.print(self.tabuleiro[i][j][1], 300 + (j * 20), 100 + (i * 20))
		end
	end
	if self.pedraAtiva ~= nil then
		self.pedraAtiva:desenhar()
	end	
end

function Partida:update(dt)
	if self.pedraAtiva ~= nil then
		if self.pedraAtiva:update(dt, self.tabuleiro) then
			self.pedraAtiva = Pedra:new( math.random(0, 6))
			--self.proxPedra =
		end
	end
end
