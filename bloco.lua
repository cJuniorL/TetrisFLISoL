lb = require "lovebird"

function Bloco(i,j)
	return {
		posI = i;
		posJ = j;
		desenhar = function(self, cor)
			love.graphics.setColor(cor[1], cor[2], cor[3])
			love.graphics.rectangle("fill", 5 + ((self.posJ * 25) + 2 ), 5 + ((self.posI * 25) + 2), 20, 20)
		end;

		verificarDescida = function (self, tabuleiro)
			local colisao = false
			if #tabuleiro - 1 < self.posI then
				colisao = true
			else
				if tabuleiro[self.posI + 1][self.posJ][1] == 1 then
					colisao = true
				end
			end 

			return colisao
		end;

		verificarDireita = function (self, tabuleiro)
			return self.posJ < #tabuleiro[self.posI] and tabuleiro[self.posI][self.posJ + 1][1] == 0
		end;

		verificarEsquerda = function (self, tabuleiro)
			return self.posJ -1 > 0 and tabuleiro[self.posI][self.posJ - 1][1] == 0
		end;

		descer = function (self)
			self.posI = self.posI + 1
		end;

		inserirPedra = function (self, tabuleiro, cor)
			tabuleiro[self.posI][self.posJ][1] = 1
			tabuleiro[self.posI][self.posJ][2] = cor
		end;

		moverDireita = function (self, tabuleiro)
			self.posJ = self.posJ + 1
		end;

		moverEsquerda = function (self, tabuleiro)
			self.posJ = self.posJ - 1
		end;

		girarPedra = function (self)
			-- body
		end
	}
end