function evitar(min, max)
  while true do
    local entrada = io.read()
    local numero = tonumber(entrada)

    if not numero then
      print("Digite um número válido")
    elseif numero < min or numero > max then
      print("Digite um número entre "..min.." e "..max)
    else
      return numero
    end
  end
end

print("Você quer jogar")
print("(1) = Jokenpo \n(2) = Impar-Par \n(3) = Jogo da Cobrinha")

io.write("\n> ")
local jogo = evitar(1, 3)

local jogos = {
  [1] = function()
    dofile("Jogos/jokenpo.lua")
  end,
  [2] = function()
    dofile("Jogos/impar-par.lua")
  end,
  [3] = function()
    dofile("Jogos/jogo-cobrinha.lua")
  end
}

jogos[jogo]()
