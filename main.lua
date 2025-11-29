-- === DADOS PUROS (State) ===
-- Apenas a verdade crua: Quem jogou onde?
local movesP1 = {} -- Player 1 (ex: X)
local movesP2 = {} -- Player 2 (ex: O)

-- Inicializa com false
for i=1, 9 do 
    movesP1[i] = false
    movesP2[i] = false
end

-- Estado do Jogo
local isP1Turn = true -- Começa com Player 1
local winner = nil
local turns = 0

-- === CONSTANTES DE VITÓRIA (A Regra) ===
-- Define quais combinações de índices representam uma linha completa
local WIN_LINES = {
    {1, 2, 3}, {4, 5, 6}, {7, 8, 9}, -- Horizontais
    {1, 4, 7}, {2, 5, 8}, {3, 6, 9}, -- Verticais
    {1, 5, 9}, {3, 5, 7}             -- Diagonais
}

-- === O ORÁCULO (View Logic) ===
-- Centraliza a tradução de "Dados" para "Visual"
local function getCellLabel(i)
    if movesP1[i] then return "X" end
    if movesP2[i] then return "O" end
    return tostring(i) -- Retorna o número para ajudar a escolher
end

-- === LÓGICA DE VITÓRIA (O Juiz) ===
local function checkVictory(currentMoves)
    -- Otimização: Fail Fast via Short-Circuit do 'and'
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

-- === A LÓGICA ===
local function isValid(pos)
    -- É válido se estiver no range E ninguém tiver jogado lá
    return pos >= 1 and pos <= 9 and (not movesP1[pos]) and (not movesP2[pos])
end

-- === O LOOP ===
while not winner and turns < 9 do
    drawBoard()
    
    local currentLabel = isP1Turn and "Player 1 (X)" or "Player 2 (O)"
    print("Vez de: " .. currentLabel)
    io.write("Escolha: ")
    
    local pos = tonumber(io.read())

    if pos and isValid(pos) then
        -- Atualiza apenas o booleano do jogador atual
        if isP1Turn then
            movesP1[pos] = true
            if checkVictory(movesP1) then winner = "Player 1 (X)" end
        else
            movesP2[pos] = true
            if checkVictory(movesP2) then winner = "Player 2 (O)" end
        end
        
        turns = turns + 1
        isP1Turn = not isP1Turn 
    else
        print(">>> Jogada Inválida! <<<")
        os.execute("sleep 1")
    end
end

drawBoard()
if winner then
    print("\n*** TEMOS UM VENCEDOR: " .. winner .. " ***\n")
else
    print("\n--- DEU VELHA (DRAW) ---\n")
end