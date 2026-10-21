# 🐍 Programação de Computadores I

Disciplina cursada em **2025.1**, no 1º período de Ciência da Computação na UFF. As soluções são em **Python**.

O trabalho final da disciplina está em um repositório próprio: **[gerenciador-de-vendas-python](https://github.com/Gbravo22/gerenciador-de-vendas-python)**.

Para rodar qualquer exercício:

```bash
python lista-3/ex003.py
```

---

## Lista 1: Fundamentos e condicionais · [enunciado](lista-1/enunciado.pdf)

| Arquivo | O que faz |
|---------|-----------|
| [ex001.txt](lista-1/ex001.txt) | Questões de verdadeiro ou falso sobre variáveis, escopo e comentários |
| [ex002.txt](lista-1/ex002.txt) | Avaliação passo a passo de expressões aritméticas e lógicas (precedência de operadores) |
| [ex003(a).py](lista-1/ex003(a).py) | Área da superfície de um cubo a partir do lado |
| [ex003(b).py](lista-1/ex003(b).py) | Soma, média, produto e maior de três números |
| [ex003(c).py](lista-1/ex003(c).py) | Preço de acordo com a cor digitada (`if`/`elif`) |
| [ex003(d).py](lista-1/ex003(d).py) | Soma de três números, ignorando os valores repetidos |

## Lista 2: Laços de repetição · [enunciado](lista-2/enunciado.pdf)

| Arquivo | O que faz |
|---------|-----------|
| [ex001.py](lista-2/ex001.py) | Termos da sequência de Fibonacci menores que um limite L, com validação da entrada |
| [ex002(a).py](lista-2/ex002(a).py) | Lê de 1 a 30 inteiros e calcula soma, média, produto, menor e maior valor sem usar `min`/`max` |

## Lista 3: Listas, recursão e ordenação · [enunciado](lista-3/enunciado.pdf)

| Arquivo | O que faz |
|---------|-----------|
| [ex001.py](lista-3/ex001.py) | Busca um valor em uma lista e mostra a posição dele |
| [ex002.py](lista-3/ex002.py) | Calcula quantas locações grátis cada compra gera (1 a cada R$ 10) |
| [ex003.py](lista-3/ex003.py) | Inverte uma lista e calcula o fatorial de cada elemento, ambos **recursivos** |
| [ex004.py](lista-3/ex004.py) | Média de uma lista (soma recursiva) e o elemento mais próximo dela |
| [ex005.py](lista-3/ex005.py) | Intercala duas listas de tamanhos diferentes |
| [ex006.py](lista-3/ex006.py) | Ranking de candidatos pela média de 3 notas, com **Bubble Sort** decrescente |
| [ex007.py](lista-3/ex007.py) | Agenda de telefones que mantém a lista sempre ordenada (Bubble Sort) |

## Lista 4: Funções, recursão e funções de ordem superior · [enunciado](lista-4/enunciado.pdf)

| Arquivo | O que faz |
|---------|-----------|
| [ex001.py](lista-4/ex001.py) | Calculadora com menu e uma função para cada operação, tratando divisão por zero |
| [ex002.py](lista-4/ex002.py) | Tamanho da maior sequência crescente consecutiva (recursivo) |
| [ex003.py](lista-4/ex003.py) | Classifica cada número da lista com `map` (negativo → 0, menor que 10 → 1, demais → 2) |
| [ex004.py](lista-4/ex004.py) | Soma recursiva da série 2/3 + 3/5 + 4/7 + ... |
| [ex005.py](lista-4/ex005.py) | Menor elemento da lista a partir da posição K |
| [ex006.py](lista-4/ex006.py) | Sequência de Tribonacci até um valor n (recursivo) |
| [ex007.py](lista-4/ex007.py) | Verifica se uma palavra é palíndromo (recursivo) |
| [ex009.py](lista-4/ex009.py) | "Suaviza" uma lista trocando cada elemento pela média com os vizinhos, recebendo a função como parâmetro |

---

### Conceitos praticados

`input`/`print` · operadores e precedência · `if`/`elif`/`else` · `while` e `for` · listas · funções · **recursão** · Bubble Sort · `map` e funções de ordem superior · tratamento de exceções

---

### 🔧 Correções feitas depois da disciplina

Revisando as listas, encontrei e corrigi alguns bugs nas soluções originais:

| Arquivo | Problema | Correção |
|---------|----------|----------|
| [lista-1/ex003(a).py](lista-1/ex003(a).py) | Parêntese faltando (erro de sintaxe) | Fechado o `float(input(...))` |
| [lista-1/ex003(c).py](lista-1/ex003(c).py) | `]` sobrando (erro de sintaxe) | Removido |
| [lista-1/ex003(b).py](lista-1/ex003(b).py) | Com `9 1 2`, mostrava o 9 **e** a mensagem de empate, porque o `else` só valia para o último `if` | `if`s viraram `if`/`elif`/`else` |
| [lista-3/ex006.py](lista-3/ex006.py) | Ao escolher as opções 1 ou 2, também aparecia "Escolha um número válido" | Mesmo ajuste: `if`/`elif`/`else` |
| [lista-3/ex001.py](lista-3/ex001.py) | O `while i <= len(lista)` poderia acessar uma posição fora da lista | Trocado por `i < len(lista)` |
| [lista-4/ex005.py](lista-4/ex005.py) | Comparava valores com posições e ignorava o último elemento (com `5,3,8,1,7` e K=0, respondia 3 em vez de 1) | Guarda a posição e o valor do menor separadamente e percorre a lista inteira |
| [lista-4/ex007.py](lista-4/ex007.py) | O valor padrão de `fim` era calculado uma vez só, com a palavra global, quando a função era definida | `fim` agora é calculado dentro da função |
| [lista-4/ex009.py](lista-4/ex009.py) | O penúltimo elemento não era suavizado, e listas com menos de 3 elementos davam resultado errado | O laço vai até o penúltimo elemento, e listas pequenas voltam sem alteração |
