local Cpu = require("cpu")

-- === CONSTANTES DE VITÓRIA (A Regra) ===
local WIN_LINES = {
    {1, 2, 3}, {4, 5, 6}, {7, 8, 9},
    {1, 4, 7}, {2, 5, 8}, {3, 6, 9},
    {1, 5, 9}, {3, 5, 7}
}

-- === ESTADO DO JOGO ===
local movesP1 = {}
local movesP2 = {}

-- === O ORÁCULO (View Logic) ===
local function getCellLabel(i)
    if movesP1[i] then return "X" end
    if movesP2[i] then return "O" end
    return tostring(i)
end

-- === LÓGICA DE VITÓRIA ===
local function checkVictory(currentMoves)
    for _, line in ipairs(WIN_LINES) do
        local a, b, c = line[1], line[2], line[3]
        if currentMoves[a] and currentMoves[b] and currentMoves[c] then
            return true
        end
    end
    return false
end

-- === RENDERIZAÇÃO ===
local function drawBoard()
    os.execute("clear")
    print(string.format("\n %s | %s | %s ", getCellLabel(1), getCellLabel(2), getCellLabel(3)))
    print("---+---+---")
    print(string.format(" %s | %s | %s ", getCellLabel(4), getCellLabel(5), getCellLabel(6)))
    print("---+---+---")
    print(string.format(" %s | %s | %s \n", getCellLabel(7), getCellLabel(8), getCellLabel(9)))
end

local function isValid(pos)
    return pos >= 1 and pos <= 9 and (not movesP1[pos]) and (not movesP2[pos])
end

-- === LOOP DA SESSÃO ===
while true do
    -- Reset
    for i=1, 9 do movesP1[i] = false; movesP2[i] = false end
    local isP1Turn = true -- P1 é Humano (X)
    local winner = nil
    local turns = 0

    while not winner and turns < 9 do
        drawBoard()
        
        local pos = nil
        
        if isP1Turn then
            -- Vez do Humano
            print("Sua vez (X). Escolha: ")
            local input = io.read()
            pos = tonumber(input)
        else
            -- Vez da CPU (Matemática)
            print("Vez da CPU (O). Pensando...")
            os.execute("sleep 1") -- Drama
            -- A CPU é P2. Ela quer maximizar P2 (movesP2) e bloquear P1 (movesP1)
            pos = Cpu.decide(movesP2, movesP1)
        end

        if pos and isValid(pos) then
            if isP1Turn then
                movesP1[pos] = true
                if checkVictory(movesP1) then winner = "Você (X)" end
            else
                movesP2[pos] = true
                if checkVictory(movesP2) then winner = "CPU (O)" end
            end
            
            turns = turns + 1
            isP1Turn = not isP1Turn 
        else
            if isP1Turn then -- Só reclama se for o humano errando
                print(">>> Jogada Inválida! <<<")
                os.execute("sleep 1")
            end
            -- Se a CPU errar (impossível com nossa lógica), o loop roda de novo
        end
    end

    drawBoard()
    if winner then
        print("\n*** VENCEDOR: " .. winner .. " ***\n")
    else
        print("\n--- EMPATE (VELHA) ---")
    end
    
    io.write("Jogar novamente? (s/n): ")
    local resp = io.read()
    if resp ~= "s" and resp ~= "S" then break end
end
