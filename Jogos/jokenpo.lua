function Jokenpo()
  math.randomseed(os.time())

  local escolhas = {
  pedra = true,
  papel = true,
  tesoura = true
  }

  local lista = { "pedra", "papel", "tesoura" }

  local vence = {
  pedra   = "tesoura",
  tesoura = "papel",
  papel   = "pedra"
  }

  while true do
  print("\nEscolha entre pedra, papel e tesoura:")
  local mao = io.read()

  if not escolhas[mao] then
    print("Escolha inválida. Tente novamente.")
  else
    local IA = lista[math.random(3)]
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
end

Jokenpo()