function Restart()
    print("\nJogar novamente? (s/n)")
    local restart = io.read()

    if restart == "s" then
        os.execute("clear")
        dofile("main.lua")
    else
        print("Obrigado por jogar!")
    -- else
    --     print("Opção inválida, tente novamente.")
    end
end

Restart()