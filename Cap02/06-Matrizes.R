#Diretorio
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap02/")

#Matrizes

#Numero de Linhas
matrix(c(1,2,3,4,5,6), nr = 2)
matrix(c(1,2,3,4,5,6), nr = 3)

#Numero de Colunas
matrix(c(1,2,3,4,5,6), nc = 2)

help(matrix)

#Matriz Diagonal
matriz = 1:3
diag(matriz)

#Multiplicação de Matrizes
mat1 <- matrix(c(2,3,4,5), nr = 2)
mat2 <- matrix(c(6,7,8,9), nr = 2)

mat1 * mat2

#Multiplicando Matriz com Vetor
x = c(1:4)
y = matrix(c(2,3,4,5), nr=2)

x*y

#Nomeando Matriz
mat3 = matrix(c('Terra','Marte', 'Saturno', 'Netuno'), nr = 2)
dimnames(mat3) = (list(c('Linha1','Linha2'), c('Coluna1', 'Coluna2')))
mat3

#Combinando Matriz
mat4 = matrix(c(2,3,4,5), nr = 2)
mat5 = matrix(c(6,7,8,9), nr = 2)

cbind(mat4, mat5) #Combinando Por Colunas
rbind(mat4, mat5) #Combinando por Linhas
