local Cpu = {}

local LINES = {
    {1, 2, 3}, {4, 5, 6}, {7, 8, 9},
    {1, 4, 7}, {2, 5, 8}, {3, 6, 9},
    {1, 5, 9}, {3, 5, 7}
}

-- Valor base posicional (Centro > Cantos > Meios)
local G = {3, 2, 3, 2, 4, 2, 3, 2, 3}

local function contains(table, val)
    for i = 1, #table do
        if table[i] == val then return true end
    end
    return false
end

local function evaluateLine(line, T)
    local sum = T[line[1]] + T[line[2]] + T[line[3]]
    -- abs(sum) == 2 -> Tem 2 peças iguais e 1 vazia (CRÍTICO: Ganhar ou Bloquear)
    if math.abs(sum) == 2 then return 100 end
    
    -- abs(sum) == 1 -> Tem 1 peça e 2 vazias (Avanço)
    if math.abs(sum) == 1 then return 10 end
    
    -- sum == 0. Pode ser 3 vazias ou bloqueada (X e O na mesma linha).
    local hasP1 = (T[line[1]]==1 or T[line[2]]==1 or T[line[3]]==1)
    local hasP2 = (T[line[1]]==-1 or T[line[2]]==-1 or T[line[3]]==-1)
    
    if hasP1 and hasP2 then return 0 end -- Bloqueada (inútil)
    return 1 -- Livre (potencial futuro)
end

function Cpu.decide(movesCpu, movesHuman)
    -- 1. Converter para Numérico (-1, 0, 1)
    -- Assumimos: CPU = 1, Humano = -1
    local T = {}
    local available = {}
    for i=1, 9 do
        if movesCpu[i] then T[i] = 1
        elseif movesHuman[i] then T[i] = -1
        else 
            T[i] = 0 
            table.insert(available, i)
        end
    end

    -- Abertura: Se vazio, pega o centro.
    if #available == 9 then return 5 end 

    -- 2. Calcular Scores para cada casa vazia
    local bestScore = -9999
    local bestMove = available[1]

    for _, i in ipairs(available) do
        local score = 0
        
        -- Soma o potencial de todas as linhas que passam por 'i'
        for _, line in ipairs(LINES) do
            if contains(line, i) then
                score = score + evaluateLine(line, T)
            end
        end
        
        -- Adiciona peso posicional (Geometria)
        score = score + G[i]

        -- Seleção do melhor
        if score > bestScore then
            bestScore = score
            bestMove = i
        elseif score == bestScore then
            -- Desempate aleatório simples
            if math.random() > 0.5 then bestMove = i end
        end
    end

    return bestMove
end

return Cpu
