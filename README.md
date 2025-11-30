# Lua Tic-Tac-Toe (MVP)

Uma implementação focada em performance e simplicidade do clássico Jogo da Velha, escrita em Lua.

## 🧠 Filosofia de Engenharia

Este projeto nasceu de uma refatoração radical (`v5.0.0`). A versão original tentava implementar uma arquitetura OOP complexa (Classes, Judges, Rounds) que se provou desnecessária (Overengineering).

Decidimos resetar e aplicar o princípio **KISS (Keep It Simple, Stupid)**.

### Destaques Técnicos
*   **Bitboards Lógicos:** O tabuleiro não é uma matriz de strings. São dois arrays booleanos (`movesP1`, `movesP2`) separados.
*   **Validação O(1) Prática:** A verificação de vitória usa *Short-Circuiting* do Lua. Se a primeira casa de uma linha vitoriosa não tem a marca, o código aborta a verificação daquela linha instantaneamente (Fail Fast).
*   **Zero Dependências:** Apenas Lua puro.
*   **Single Source of Truth:** A função de renderização (`getCellLabel`) é a única que traduz o estado lógico (`true/false`) para visual ("X"/"O"). A lógica do jogo desconhece a "skin".

## 🚀 Como Rodar

Certifique-se de ter o Lua instalado.

```bash
lua main.lua
```

## 🎮 Features
*   **Input Numérico:** Mapeado de 1-9 (top-left a bottom-right).
*   **Replay Loop:** Permite jogar múltiplas partidas na mesma sessão, com reset automático de estado.
*   **Feedback Visual:** Tabuleiro desenhado em ASCII limpo.

---
*Desenvolvido por [Sanchez] com mentalidade SRE: Menos código, menos bugs.*