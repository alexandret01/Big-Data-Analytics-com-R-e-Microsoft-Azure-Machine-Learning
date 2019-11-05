#Definindo Diretorio
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap02")
getwd()

print('Olá Mundo / Helo World')

#Criar Grafico Plot
plot(1:25)

#Instalando Pacotes
install.packages('randomForest')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('devtools')
install.packages("caret")

#Carregando Lib
library(ggplot2)

#Descarregando a Lob
detach(package:ggplot2)

#Help
help(mean)

#Mais Informações Sobre uma função
install.packages('sos')
library(sos)
findFn('fread')

#Se não souber o nome da Função
help.search('randomForest')
??randomForest

#Example
example(matplot)

#Quit
q()