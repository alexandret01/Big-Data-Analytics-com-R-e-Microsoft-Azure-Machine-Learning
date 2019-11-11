# Lista de Exercícios - Capítulo 2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap02")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vetor1 = c(1:30)
vetor1

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
matriz1 = matrix(c(1:20), nrow = 4, ncol = 4)
matriz1

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista1 = c(matriz1, vetor1)
lista1

# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
dataframe1 = data.frame(read.csv("exer.csv"))
dataframe1
