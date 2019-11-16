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
df <- data.frame(read.table("http://data.princeton.edu/wws509/datasets/effort.dat"))
class(df)
df
View(df)

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
names(df) = c("config", "esfc", "chang")
names(df) = c("Col1", "Col2", "Col3")
df

# Exercício 6 - Imprima na tela o dataframe iris, 
# verifique quantas dimensões existem no dataframe iris, imprima um resumo do dataset
iris
class(iris)
dim(iris)
summary(iris)
str(iris)
View(iris)

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)

# Exercício 8 - Usando s função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()
?subset
iris1 <- subset(iris, Sepal.Length > 7)
View(iris1)

