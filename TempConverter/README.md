# Dia 19, Challenge 1

## TempConverter

+ Criar um conversor de unidades

[Day 19 - Challenge 1](https://www.hackingwithswift.com/100/swiftui/19)

Criei um conversor de temperaturas (Celsius, Fahrenheit e Kelvin) sem usar a API de "Unit and Measurement" do Swift.

## Screenshot

![](/TempConverter/screenshot.png)

## Estrutura

A estrutura foi a seguinte:

+ criei a variável userInput (vazia) que representa o valor que o usuário vai digitar

+ criei a variável unitInputI com valor de zero, que representa o índice do array das unidades (no caso 0 é a primeira posição)

+ criei a variávei unitOutputI, que tem o mesmo objetivo que a de acima, mas vale para a saída

+ criei dois array (poderia ter sido um dicionário, eu sei): units e unitSymbols. Nomes autoexplicativos

+ criei a variável appOutput, que representa o valor final, já convertido

	+ a saída dela é Double

	+ nela, criei as variáveis inputValor (como Double, e se não for, vira  0), unitInput (que éo input da unidade, com seu respectivo índice), unitOutput (o mesmo)

	+ estabeleci que, se o input e o output fossemoes mesmos (i.e. Celsius / Celsius), para retoretornar o mesmo valor dado, caso não, ele faz o cálculo

	+ as possibilidades de unitInput foram baseadas num "switch", pra cada possibilidade de unidade de entrada e duas possibilidades de unidade de saída

+ as variáveis usam  funções "XpY", que nada mais são que as conversoras (i.e. CpK - Celsius para  Kelvin)

+ por fim, a interface tem duas seções (input e output): a primeira, com o valor de input da temperatura, a  unidade de origem e a unidade de destino, e a segunda, com o resultado.
