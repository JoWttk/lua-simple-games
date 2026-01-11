math.randomseed(os.time())

local player = {
    hp = 100,
    atk = 15,
    def = 5,
    potions = 3
}

local enemy = {
    hp = 80,
    atk = 12,
    def = 4
}

local function printStatus()
    print("\n===== INFORMAÇOES =====")
    print("Você   HP:", player.hp, "| Poções:", player.potions)
    print("Adversário HP:", enemy.hp)
end

local function attack(attacker, defender)
    local damage = math.max(0, attacker.atk - defender.def + math.random(-2,2))
    defender.hp = defender.hp - damage
    print("Dano:", damage)
end

local function heal()
    if player.potions > 0 then
        local heal = math.random(15, 25)
        player.hp = math.min(100, player.hp + heal)
        player.potions = player.potions - 1
        print("Você curou ", heal, " de HP")
    else
        print("Acabou suas poções")
    end
end

while player.hp > 0 and enemy.hp > 0 do
    printStatus()
    print("\nSeu turno:")
    print("1 - Atacar")
    print("2 - Defender")
    print("3 - Curar")

    local choice = io.read()

    if choice == "1" then
        attack(player, enemy)
    elseif choice == "2" then
        print("Se defendeu, menos dano no turno")
        player.def = player.def + 5
    elseif choice == "3" then
        heal()
    else
        print("Ação irregular, perdeu o turno")
    end
    os.execute("clear")

    if enemy.hp <= 0 then break end

    -- turno do inimigo
    print("\nTurno do adversário:")
    local enemyChoice = math.random(1,2)

    if enemyChoice == 1 then
        attack(enemy, player)
    else
        print("O adversário se defendeu")
        enemy.def = enemy.def + 3
    end

    player.def = 5
    enemy.def = 4
end

if player.hp > 0 then
    print("\nVocê venceu!")
else
    print("\nVocê foi derrotado!")
end
dofile("restart.lua")
