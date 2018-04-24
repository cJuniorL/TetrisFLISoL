require 'bloco'

lovebird = require "lovebird"

Pedra = {
	pos = 0,
	tipo = 0,
	tempoDescida = 0,
	tempoMovimento = 0,
	tempoGiro = 0,
	ultMovimento = "",
	blocos = {},
	mov = true,
	cor = {0, 0, 0}
}
function Pedra:new(tipo)
	self.tipo = tipo
	self.pos = 0
	if (tipo == 0) then
		table.insert(self.blocos, Bloco(1,3))
		table.insert(self.blocos, Bloco(1,4))
		table.insert(self.blocos, Bloco(2,3))
		table.insert(self.blocos, Bloco(2,4))
		self.cor = {0,76, 153}
	elseif (tipo == 1) then
		table.insert(self.blocos, Bloco(1,3))
		table.insert(self.blocos, Bloco(1,4))
		table.insert(self.blocos, Bloco(1,5))
		table.insert(self.blocos, Bloco(2,4))
		self.cor = {255, 0, 0}
	elseif (tipo == 2) then
		table.insert(self.blocos, Bloco(1,2))
		table.insert(self.blocos, Bloco(2,2))
		table.insert(self.blocos, Bloco(3,2))
		table.insert(self.blocos, Bloco(3,3))
		self.cor = {255, 255, 0}
	elseif (tipo == 3) then
		table.insert(self.blocos, Bloco(1,2))
		table.insert(self.blocos, Bloco(2,2))
		table.insert(self.blocos, Bloco(3,2))
		table.insert(self.blocos, Bloco(3,1))
		self.cor = { 0, 255, 0}
	elseif (tipo == 4) then
		table.insert(self.blocos, Bloco(1,2))
		table.insert(self.blocos, Bloco(1,3))
		table.insert(self.blocos, Bloco(2,3))
		table.insert(self.blocos, Bloco(2,4))
		self.cor = { 255, 128, 0 }
	elseif (tipo == 5) then
		table.insert(self.blocos, Bloco(1,4))
		table.insert(self.blocos, Bloco(1,3))
		table.insert(self.blocos, Bloco(2,3))
		table.insert(self.blocos, Bloco(2,2))
		self.cor = { 255, 128, 0 }
	elseif (tipo == 6) then
		table.insert(self.blocos, Bloco(1,4))
		table.insert(self.blocos, Bloco(2,4))
		table.insert(self.blocos, Bloco(3,4))
		table.insert(self.blocos, Bloco(4,4))
		self.cor = { 255, 0, 0}
	end
	return self
end

function Pedra:desenhar()
	local teste = 400
	for i = 1, table.getn(self.blocos), 1  do
		self.blocos[i]:desenhar(self.cor)
	end
end

function Pedra:girar()
	local pos = {}
	pos[1] = {}
	pos[2] = {}
	pos[3] = {}
	if self.tipo == 1 then
		if self.pos == 0 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI - 1
			pos[3][2] = self.blocos[4].posJ - 1
		elseif self.pos == 1 then
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI - 1
			pos[3][2] = self.blocos[4].posJ + 1
		elseif self.pos == 2 then
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI + 1
			pos[3][2] = self.blocos[4].posJ + 1
		elseif self.pos == 3 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI + 1
			pos[3][2] = self.blocos[4].posJ - 1
		end
	elseif self.tipo == 2 then
		if self.pos == 0 then 
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI
			pos[3][2] = self.blocos[4].posJ - 2
		elseif self.pos == 1 then
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI - 2
			pos[3][2] = self.blocos[4].posJ
		elseif self.pos == 2 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI
			pos[3][2] = self.blocos[4].posJ + 2
		elseif self.pos == 3 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI + 2
			pos[3][2] = self.blocos[4].posJ
		end
	elseif self.tipo == 3 then
		if self.pos == 0 then 
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI - 2
			pos[3][2] = self.blocos[4].posJ
		elseif self.pos == 1 then
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI
			pos[3][2] = self.blocos[4].posJ + 2
		elseif self.pos == 2 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI + 2
			pos[3][2] = self.blocos[4].posJ
		elseif self.pos == 3 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI
			pos[3][2] = self.blocos[4].posJ - 2
		end
	elseif self.tipo == 4 then
		if self.pos == 0 then 
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI
			pos[3][2] = self.blocos[4].posJ - 2
		elseif self.pos == 1 then
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] = self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI
			pos[3][2] = self.blocos[4].posJ + 2
		end
	elseif self.tipo == 5 then
		if self.pos == 0 then
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI - 2
			pos[3][2] = self.blocos[4].posJ
		elseif self.pos == 1 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] =self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI + 2
			pos[3][2] = self.blocos[4].posJ
		end
	elseif self.tipo == 6 then 
		if self.pos == 0 then
			pos[1][1] = self.blocos[1].posI + 1
			pos[1][2] =self.blocos[1].posJ - 1
			pos[2][1] = self.blocos[3].posI - 1
			pos[2][2] = self.blocos[3].posJ + 1
			pos[3][1] = self.blocos[4].posI - 2
			pos[3][2] = self.blocos[4].posJ + 2
		elseif self.pos == 1 then
			pos[1][1] = self.blocos[1].posI - 1
			pos[1][2] = self.blocos[1].posJ + 1
			pos[2][1] = self.blocos[3].posI + 1
			pos[2][2] = self.blocos[3].posJ - 1
			pos[3][1] = self.blocos[4].posI + 2
			pos[3][2] = self.blocos[4].posJ - 2
		end
	end
	if verificarPos(pos) then
		if self.tipo ~= 0 then
			if self.tipo == 6 then
				lovebird.print(self.pos)
				self.pos = self.pos == 1 and 0 or (self.pos + 1)
				lovebird.print(self.pos)
			else
				self.pos = self.pos == 3 and 0 or (self.pos + 1)
			end
			self.blocos[1].posI = pos[1][1]
			self.blocos[1].posJ = pos[1][2]
			self.blocos[3].posI = pos[2][1]
			self.blocos[3].posJ = pos[2][2]
			self.blocos[4].posI = pos[3][1]
			self.blocos[4].posJ = pos[3][2]
		end

	end
end

function verificarPos(pos)
	return true
end

function Pedra:update(dt, tabuleiro)
	local pedraRemovida = false
	if love.keyboard.isDown("w") and self.tempoGiro > 0.15 then
		self:girar()
		self.tempoGiro = 0
	else
		self.tempoGiro = self.tempoGiro + dt
	end
	if love.keyboard.isDown("d") and self.tempoMovimento > 0.15 then
		self.ultMovimento = "d"
	end
	if love.keyboard.isDown("a") and self.tempoMovimento > 0.15 then
		self.ultMovimento = "a"
	end
	if self.tempoMovimento > 0.15 then
		if self.ultMovimento == "d" then
			local mover = true
			for i = 1, #self.blocos, 1 do
				if self.blocos[i]:verificarDireita(tabuleiro) == false then
					mover = false
				end
			end
			if mover then
				for i = 1, table.getn(self.blocos), 1 do
					self.blocos[i]:moverDireita()
				end
				self.ultMovimento = ""
				self.tempoMovimento = 0
			end
		elseif self.ultMovimento == "a" then
			local mover = true
			for i = 1, #self.blocos, 1 do
				if self.blocos[i]:verificarEsquerda(tabuleiro) == false then
					mover = false
				end
			end
			if mover then
				for i = 1, table.getn(self.blocos), 1 do
					self.blocos[i]:moverEsquerda()
				end
				self.ultMovimento = ""
				self.tempoMovimento = 0
			end
		end
	else
		self.tempoMovimento = self.tempoMovimento + dt
	end
	
	if self.tempoDescida > 0.4 then
		self.tempoDescida = 0
		local descida = true
		for i = 1, table.getn(self.blocos), 1 do
			if self.blocos[i]:verificarDescida(tabuleiro) == true then
				descida = false
			end
		end
		if descida then
			for i = 1, table.getn(self.blocos), 1 do
				self.blocos[i]:descer()
			end 
		else
			for i = 1, table.getn(self.blocos), 1 do
				self.blocos[i]:inserirPedra(tabuleiro, self.cor)
			end
			self.blocos = {}
			pedraRemovida = true
			for i = 1, table.getn(tabuleiro), 1 do
				local linhaCompleta = true
		
				for j = 1, table.getn(tabuleiro[i]), 1 do
					if tabuleiro[i][j][1] ~= 1 then
						linhaCompleta = false
						j = #tabuleiro[i]
					end
				end	
				if linhaCompleta == true then
					for i2 = i, 1, -1 do
						for j = 1, #tabuleiro[i2], 1 do
							tabuleiro[i2][j] = tabuleiro[i2 - 1][j]
						end
					end
				end
			end
		end
	else 
		self.tempoDescida = self.tempoDescida + dt
	end
	return pedraRemovida
end

