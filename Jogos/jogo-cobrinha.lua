local largura, altura = 20, 10
local cobra = { {x = 5, y = 5} }
local direcao = "d"
local comida = { x = 10, y = 5 }

local function desenhar()
  os.execute("cls")
  for y = 1, altura do
    for x = 1, largura do
      local desenhado = false

      if x == comida.x and y == comida.y then
        io.write("O")
        desenhado = true
      end

      for _, p in ipairs(cobra) do
        if p.x == x and p.y == y then
          io.write("#")
          desenhado = true
          break
        end
      end

      if not desenhado then io.write(".") end
    end
    io.write("\n")
  end
end

while true do
  desenhar()
  print("WASD para mover")
  local input = io.read()

  if input == "w" then direcao = "w"
  elseif input == "s" then direcao = "s"
  elseif input == "a" then direcao = "a"
  elseif input == "d" then direcao = "d"
  end

  local cabeca = cobra[1]
  local nova = { x = cabeca.x, y = cabeca.y }

  if direcao == "w" then nova.y = nova.y - 1
  elseif direcao == "s" then nova.y = nova.y + 1
  elseif direcao == "a" then nova.x = nova.x - 1
  elseif direcao == "d" then nova.x = nova.x + 1
  end

  if nova.x < 1 or nova.x > largura or nova.y < 1 or nova.y > altura then
    print("Game Over!")
    break
  end

  table.insert(cobra, 1, nova)

  if nova.x == comida.x and nova.y == comida.y then
    comida.x = math.random(1, largura)
    comida.y = math.random(1, altura)
  else
    table.remove(cobra)
  end
end
