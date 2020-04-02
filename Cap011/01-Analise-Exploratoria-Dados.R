#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap011/")

#Carregando o pacote readr
library(readr)

#Carregando o dataset
carros <- read_csv("carros-usados.csv")

# Resumo dos dados
View(carros)
str(carros)

#Medidas de Tendência Central
summary(carros$ano)
summary(carros[c('preco', 'kilometragem')])

##### Análise Exploratória de Dados Para Variáveis Numéricas ##### 

#Usando as funções
mean(carros$preco)
median(carros$preco)
quantile(carros$preco)
quantile(carros$preco, probs = c(0.01, 0.99))
quantile(carros$preco, seq( from = 0, to = 1, by = 0.20))
IQR(carros$preco)
range(carros$preco)
diff(range(carros$preco))

#Boxplot
boxplot(carros$preco, main = "Boxplot para os Preços de Carros Usados", ylab = "Preço (R$)")
boxplot(carros$kilometragem, main = "Boxplot para a Km de Carros Usados", ylab = "Kilometragem (R$)")

#Histograma
hist(carros$preco, main = "Histograma para os Preços Carros Usados", xlab = "Preço (R$)")
hist(carros$kilometragem, main = "Histograma para a Km de Carros Usados", ylab = "Kilometragem (R$)")
hist(carros$kilometragem, main = "Histograma para a Km de Carros Usados", breaks = 5, ylab = "Kilometragem (R$)")

#Scatterplot Preço x Km
plot(x = carros$kilometragem, y = carros$preco,
     main = "Scatterplot - Preço x Km",
     xlab = "Kilometragem",
     ylab = "Preço (R$)")

#Medidas de Dispersão
var(carros$preco)
sd(carros$preco)
var(carros$kilometragem)
sd(carros$kilometragem)

##### Análise Exploratória de Dados Para Variáveis Categóricas ##### 

#Criando tabelas de contingência - representam uma única variável categórica
?table
str(carros)
table(carros$cor)
table(carros$modelo)
str(carros)

#Calculando a proporção de cada categoria
model_table <- table(carros$modelo)
prop.table(model_table)

#Arrendondando os valores
model_table <- table(carros$modelo)
model_table <- prop.table(model_table) * 100
round(model_table, digits = 1)

#Criando uma nova variável indicando cores conservadoras 
head(carros)
carros$conserv <- carros$cor %in% c("Preto", "Cinza", "Prata", "Branco")
head(carros)

#Checando a variável
table(carros$conserv)

#Verificando o relacionamento entre 2 variáveis categóricas
install.packages("gmodels")
library(gmodels)
?CrossTable
CrossTable(x = carros$modelo, y = carros$conserv)

#Teste do Qui-quadrado
CrossTable(x = carros$modelo, y = carros$conserv, chisq = TRUE)
chisq.test(x = carros$modelo, y = carros$conserv)
