# λ Linguagens de Programação

Disciplina cursada em **2026.2**, com o Prof. Bruno Lopes, em Ciência da Computação na UFF. As soluções são em **Haskell**.

---

## Trabalho prático: Jogo da Vida de Conway · [jogo-da-vida/Main.hs](jogo-da-vida/Main.hs)

Implementação do [Jogo da Vida](https://pt.wikipedia.org/wiki/Jogo_da_vida) em um tabuleiro de tamanho fixo `n × m`. A cada geração, cada célula olha seus 8 vizinhos e decide se vive ou morre de acordo com uma regra.

```
.....        .....
..*..        .....
..*..   →    .***.        o "blinker", que oscila entre vertical e horizontal
..*..        .....
.....        .....
```

Para rodar:

```bash
runghc jogo-da-vida/Main.hs
```

Também dá para colar o código no [Haskell Playground](https://play.haskell.org/) e clicar em **Run**.

### Decisões de projeto

- **Representação:** matriz densa (`type Board = [[Cell]]`, indexada `[linha][coluna]`). É a forma mais direta de ler e imprimir o tabuleiro, e para tabuleiros pequenos o custo de guardar as células mortas não importa.
- **Bordas:** fixas. Qualquer coordenada fora do tabuleiro é tratada como célula morta (`cellAt` devolve `Dead`).
- **Regras parametrizáveis:** `type Rule = Int -> Cell -> Cell` recebe o número de vizinhos vivos e o estado atual. O `step` recebe a regra como parâmetro, então trocar de variação é só trocar a função.
- **Entrada e saída:** o tabuleiro é lido de uma `String` com `*` (viva) e `.` (morta), e `showBoard (parseBoard s) == s` para qualquer `s` bem formada.

### Variações de regra implementadas

| Função | Nasce com | Sobrevive com |
|--------|-----------|---------------|
| `conwayRule` | 3 | 2, 3 |
| `highLifeRule` | 3, 6 | 2, 3 |
| `seedsRule` | 2 | nunca |
| `dayNightRule` | 3, 6, 7, 8 | 3, 4, 6, 7, 8 |

### Funções

| Função | O que faz |
|--------|-----------|
| `emptyBoard` | Cria um tabuleiro `n × m` todo morto |
| `parseBoard` / `showBoard` | Convertem entre `String` e tabuleiro |
| `dimensions` | Devolve `(linhas, colunas)` do tabuleiro |
| `cellAt` | Célula numa coordenada, com borda fixa |
| `countAliveNeighbors` | Conta os vizinhos vivos das 8 posições adjacentes |
| `step` | Aplica a regra em todas as células e gera a próxima geração |

### Testes

Ficam no próprio `main`, com `print` e comparações:

- `showBoard (parseBoard s) == s` (leitura e impressão são inversas)
- o **blinker** volta ao estado original depois de 2 gerações
- casos de borda do `cellAt` e da contagem de vizinhos
- cada variação de regra nos casos que a diferenciam das outras

### Status

- [x] Tipos, leitura e impressão do tabuleiro
- [x] Vizinhança com borda fixa
- [x] Regras: Conway, HighLife, Seeds e Day & Night
- [x] `step` e testes com o blinker
- [ ] `generations` (lista infinita com `iterate`)
- [ ] `runSimulation` para imprimir N gerações
- [ ] Variante toroidal de `cellAt`

---

### Conceitos praticados

`type` e `data` · `deriving (Eq, Show)` · pattern matching · guards · `map` e `map` aninhado · list comprehension · `where` · aplicação parcial · `lines`/`unlines` · `!!` e `length` · `elem` · funções como parâmetro
