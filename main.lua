print("Você quer jogar jokenpo (1) ou impar-par? (2)")
local jogo = io.read()

if jogo == "1" then
   dofile("jokenpo.lua")
  elseif jogo == "2" then
   dofile("impar-par.lua")
end