#Diretórios
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap04/")
getwd()

#Definindo Dados
set.seed(67)
x = rnorm(10, 5, 7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

?plot

#Criando Plot
plot(x, y, col = 13, pch = 10, main = "Multi Scatterplot", 
     col.main = "red", cex.main = 1.5, xlab = "Variável Independente", 
     ylab = "Variável Dependente")

#Adiciona outros dados 
points(z, t, col = "blue", pch = 4)

#Adiciona outros dados 
points(y, t, col = 777, pch = 9)

#Criar legenda
legend(-6,5.9, legend = c("Nível 1", "Nível 2", "Nível 3"),
       col = c(123, "blue", 777), pch = c(10,4,9),
       cex = 0.65, bty = "n")
