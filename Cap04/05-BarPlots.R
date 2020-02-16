#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap04/")

?barplot

#Número de casamentos em uma igreja de SP
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow = 3, byrow = T)
dados

#Nomeando linhas e colunas na matriz
colnames(dados) <- c("0","1-150","151-300",">300")
rownames(dados) <- c("Jovem","Adulto","Idoso")
dados

#Construindo o Barplot
barplot(dados, beside = T)
barplot(dados)

#Construindo o plot - Stacked Bar Plot
barplot(dados, col = c("steelblue1", "tan3", "seagreen3"))

#Crie uma legenda para o gráfico anterior
colors()
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3"), legend = c("Jovem","Adulto","Idoso"))

#Coluna para cada faixa etária
barplot(dados, beside = T, col = c("steelblue1", "tan3", "seagreen3"))
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3"), legend = c("Jovem","Adulto","Idoso"))

#Posições invertidas entre faixa etária e faixa de quantidade
t(dados)
barplot(t(dados), beside = T, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"))
legend("topright", pch = 1, col = c("steelblue1", "tan3", "seagreen3", "peachpuff1"), legend = c("0","1-150","151-300",">300"))
