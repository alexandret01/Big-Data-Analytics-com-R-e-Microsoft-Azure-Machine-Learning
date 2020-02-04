#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap04/")

#Definindo os dados
?cars
View(cars)
dados = cars$speed

#Construindo um histograma
?hist
hist(dados)

hist(dados, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histograma das Velocidades")


#Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = "Histograma das Velocidades")

xaxis = seq(min(dados), max(dados), length = 10)
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados))
yaxis = yaxis*diff(grafico$mids)*length(dados)

lines(xaxis, yaxis, col = "red")
