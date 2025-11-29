# Tic-Tac-Toe (Lua) - MVP Reboot

Este branch (`geminiandi`) representa uma refatoração completa focada em simplicidade e performance.

## A História (Architecture Decision Record)

Originalmente, este projeto tentou implementar uma arquitetura OOP complexa (Classes, Judge, Game, Match, Round). Isso se provou um *Overengineering* desnecessário para o escopo do problema, dificultando a conclusão.

Decidimos "resetar" o projeto (`v5.0.0`) adotando uma abordagem **Data-Oriented** e **KISS**.

## Arquitetura Atual

Não existem classes. O estado do jogo é mantido em estruturas de dados primitivas otimizadas para lógica booleana.

### Estrutura de Dados

1.  **`movesP1` e `movesP2` (Arrays Booleanos):**
    *   Em vez de um tabuleiro único com strings ("X", "O"), usamos dois arrays paralelos de booleanos.
    *   Isso permite validações ultra-rápidas (Bitboard style).

2.  **`WIN_LINES` (Constante de Regra):**
    *   Define estaticamente as 8 combinações de vitória.
    *   A verificação de vitória usa *Short-Circuiting* do Lua para parar imediatamente ao encontrar uma falha na linha, garantindo performance O(1) na prática.

3.  **`getCellLabel` (View Logic):**
    *   Atua como uma camada de tradução. O "Core" do jogo só vê `true/false`. Essa função traduz para "X" ou "O" apenas no momento de desenhar na tela.

## Como Rodar

```bash
lua main.lua
```

## Próximos Passos (Roadmap)

Este código serve como base sólida (MVP) para futuros experimentos, como implementação de IA (Minimax), já que a separação de estado (arrays booleanos) facilita muito a simulação de jogadas futuras.
