# Arquitetura da IA (Vector Heuristic Engine)

Este documento detalha o funcionamento do módulo `cpu.lua`, que implementa uma inteligência artificial para o Jogo da Velha sem utilizar árvores de busca recursiva (Minimax).

## 1. Filosofia: Matemática > Busca
Em vez de simular todos os futuros possíveis, a IA avalia o **potencial vetorial** do tabuleiro atual. Ela trata o jogo como um problema de otimização linear.

## 2. Componentes da Decisão
A IA decide a jogada baseada em um **Score** calculado para cada casa vazia.
$$Score(i) = \sum Potencial(Linhas) + Geometria(i)$$

### A. Matriz Geométrica (G)
Define o valor estático de cada posição baseada em quantas linhas de vitória passam por ela.
* **Centro (5):** 4 linhas. (Valor Base Alto)
* **Cantos:** 3 linhas. (Valor Médio)
* **Meios:** 2 linhas. (Valor Baixo)

Isso garante que, em um tabuleiro vazio, a IA "sabe" que o centro é a melhor jogada estatística.

### B. Avaliação de Linhas (Vetores)
O tabuleiro é convertido para valores numéricos:
* **CPU:** +1
* **Humano:** -1
* **Vazio:** 0

Para cada linha (trio de células), somamos os valores:
* **Soma = 2 (ou -2):** [1, 1, 0]. Ponto Crítico.
    * A IA atribui valor **100** à casa vazia. (Vitória Imediata ou Bloqueio Obrigatório).
* **Soma = 1 (ou -1):** [1, 0, 0]. Avanço.
    * A IA atribui valor **10**. (Construção de jogada).
* **Soma = 0:** [0, 0, 0] ou [1, -1, 0].
    * Se bloqueada (peças mistas), valor **0**.
    * Se vazia, valor **1**.

## 3. O Algoritmo "Guloso"
1. A IA varre todas as casas vazias.
2. Para cada casa, soma o potencial de todas as 4 linhas (H, V, D1, D2) que passam por ela.
3. Adiciona o peso geométrico (G) como critério de desempate.
4. Escolhe a casa com o maior Score final.

### Resultado
Uma IA extremamente rápida (O(1) na prática) que joga de forma agressiva e defensiva simultaneamente, sem precisar "pensar" no futuro.
