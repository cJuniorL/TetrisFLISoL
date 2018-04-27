require 'pedra'
lovebird = require "lovebird"

Partida = {
	tabuleiro = {},
	pedraAtiva,
	proxPedra,
	pontos,
	tempoD
}

function Partida:new()
	self.pontos = 0
	self.tempoD = 0.35	
	local jTable = {}
	for i = 0, 19, 1 do
		self.tabuleiro[i] = {}
		for j = 0, 9, 1 do
			self.tabuleiro[i][j] = {0, {nil, nil, nil}}
		end
	end
	self.pedraAtiva = nil
	self.pedraAtiva = Pedra:new(6)
	self.proxPedra = 0
	return self
end

function Partida:desenhar()
	love.graphics.setColor(0,0,0)
	desenharFundo()
	love.graphics.setFont(font)
	love.graphics.print("Prox. Pedra", 340, 20)
	love.graphics.print(self.pontos, 340, 500)
	desenharProxPedra(self.proxPedra)
	for i in ipairs(self.tabuleiro) do
		love.graphics.setColor(0,0,0)
		for j in ipairs(self.tabuleiro[i]) do
			if self.tabuleiro[i][j][1] == 0 then
				love.graphics.setColor(127,127, 127)	
				love.graphics.rectangle('line', j * 30, i * 30, 30, 30)
			else
				if self.tabuleiro[i][j][2][1] ~= nil then
				love.graphics.setColor(self.tabuleiro[i][j][2][1], self.tabuleiro[i][j][2][2], self.tabuleiro[i][j][2][3])
				else
					love.graphics.setColor(30, 30, 30)
				end
				love.graphics.rectangle('fill', j * 30, i * 30, 30, 30)
			end
		end
	end
	if self.pedraAtiva ~= nil then
		self.pedraAtiva:desenhar()
	end	
end

function desenharFundo() 
	love.graphics.setColor(255,0,0)
	for i = 0, 21, 1 do
		love.graphics.draw(blocoParede, 0, i * 30)
		love.graphics.draw(blocoParede, 300, i * 30)
	end
	for i = 1, 9, 1 do
	love.graphics.draw(blocoParede, i * 30, 0)
	love.graphics.draw(blocoParede, i * 30, 600)
	end
end

function desenharProxPedra(tipo)
	if tipo == 0 then
		love.graphics.rectangle("fill", 370 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 370 + 2, 120 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 120 + 2, 26, 26)
	end
	if tipo == 1 then
		love.graphics.rectangle("fill", 370 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 430 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 120 + 2, 26, 26)
	end
	if tipo == 2 then
		love.graphics.rectangle("fill", 370 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 370 + 2, 120 + 2, 26, 26)
		love.graphics.rectangle("fill", 370 + 2, 150 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 150 + 2, 26, 26)
	end
	if tipo == 3 then
		love.graphics.rectangle("fill", 400 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 120 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 150 + 2, 26, 26)
		love.graphics.rectangle("fill", 370 + 2, 150 + 2, 26, 26)
	end
	if tipo == 4 then
		love.graphics.rectangle("fill", 370 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 120 + 2, 26, 26)
		love.graphics.rectangle("fill", 430 + 2, 120 + 2, 26, 26)
	end
	if tipo == 5 then
		love.graphics.rectangle("fill", 370 + 2, 120 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 120 + 2, 26, 26)
		love.graphics.rectangle("fill", 400 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 430 + 2, 90 + 2, 26, 26)
	end
	if tipo == 6 then
		love.graphics.rectangle("fill", 370 + 2, 90 + 2, 26, 26)
		love.graphics.rectangle("fill", 370 + 2, 120 + 2, 26, 26)
		love.graphics.rectangle("fill", 370 + 2, 150 + 2, 26, 26)
		love.graphics.rectangle("fill", 370 + 2, 180 + 2, 26, 26)
	end
end


function Partida:update(dt)
	if self.pedraAtiva ~= nil then
		local pedraRemovidaLinha = self.pedraAtiva:update(dt, self.tabuleiro, self.tempoD)
		if pedraRemovidaLinha[1] then
			self.pedraAtiva = Pedra:new(self.proxPedra)
			self.pontos = self.pontos + (pedraRemovidaLinha[2] * 1000)
			self.proxPedra = math.random(0, 6)
		end
		if pedraRemovidaLinha[3] == "ESC" then
			lovebird.print("oi")
			self = Partida:new()
		end
	end
end
