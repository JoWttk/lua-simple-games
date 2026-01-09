function ImparOuPar()
    math.randomseed(os.time())

    function evitarString(min, max)
    while true do
        local entrada = io.read()
        local numero = tonumber(entrada)

        if numero and numero >= min and numero <= max then
            return numero
        else
            print("Digite um número válido entre "..min.." e "..max)
        end
    end
    end

    print("impar ou par? (1 = Par | 2 = Impar)")
    local escolha = evitarString(1, 2)
    local impar_par = (escolha == 1) and "Par" or "Impar"

    print("Você é "..impar_par.." e a IA é "..(impar_par=="Par" and "Impar" or "Par"))

    print("\nEscolha um número de 1 a 10")
    local numero_jogador = evitarString(1, 10)

    local numero_ia = math.random(1,10)
    local soma = numero_jogador + numero_ia
    local resultado = (soma % 2 == 0) and "Par" or "Impar"

    print("\nVocê escolheu:", numero_jogador)
    print("IA escolheu:", numero_ia)
    print("Soma:", soma, "(", resultado, ")")

    if resultado == impar_par then
        print("\nVocê venceu!")
    else
        print("\nA IA venceu!")
    end
end

ImparOuPar()