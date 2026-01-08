function Jokenpo()
    math.randomseed(os.time())

    local escolhas = { "pedra", "papel", "tesoura" }

    local vence = {
      pedra   = "tesoura",
      tesoura = "papel",
      papel   = "pedra"
    }

    while true do
      print("\nEscolha entre pedra, papel e tesoura:")
      local mao = io.read()

      local IA = escolhas[math.random(#escolhas)]

      print("A IA escolheu: " .. IA)

      if mao == IA then
          print("Empate! Jogando novamente...")
      elseif vence[mao] == IA then
          print("Você ganhou!")
          break
      else
          print("Você perdeu!")
          break
      end
    end
end

Jokenpo()