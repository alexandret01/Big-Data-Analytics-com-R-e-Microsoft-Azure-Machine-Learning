#Customer Churn Analytics 
# Neste projeto, vamos prever a rotatividade (churn) de clientes usando um conjunto de dados de telecomunicações. 
# Usaremos a regressão logística, a árvore de decisão e a floresta aleatória como modelos de Machine Learning. 
#Cada linha representa um cliente e cada coluna contém os atributos desse cliente.
#https://www.ibm.com/communities/analytics/watson-analytics-blog/guide-to-sample-datasets/

#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap06/")

#Instalando Pacotes
install.packages("plyr")
install.packages("corrplot")
install.packages("ggplot2")
install.packages("gridExtra")
install.packages("ggthemes")
install.packages("caret")
install.packages("MASS")
install.packages("randomForest")
install.packages("party")

#Carregando Pacotes
library(plyr)
library(corrplot)
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(caret)
library(MASS)
library(randomForest)
library(party)

##Carregando e LImpando os Dados##
churn <- read.csv('Telco-Customer-Churn.csv')
View(churn)
str(churn)

#Verificar o número de valores ausentes (missing) em cada coluna. 
sapply(churn, function(x) sum(is.na(x)))
churn <- churn[complete.cases(churn), ]

#No internet para No
str(churn)
cols_recode1 <- c(10:15)
for(i in 1:ncol(churn[,cols_recode1])) {
  churn[,cols_recode1][,i] <- as.factor(mapvalues
                                        (churn[,cols_recode1][,i], from =c("No internet service"),to=c("No")))
}

#No phone service para No
churn$MultipleLines <- as.factor(mapvalues(churn$MultipleLines, 
                                           from=c("No phone service"),
                                           to=c("No")))

# 1 há 72 meses, Agrupado por meses
min(churn$tenure); max(churn$tenure)

group_tenure <- function(tenure){
  if (tenure >= 0 & tenure <= 12){
    return('0-12 Month')
  }else if(tenure > 12 & tenure <= 24){
    return('12-24 Month')
  }else if (tenure > 24 & tenure <= 48){
    return('24-48 Month')
  }else if (tenure > 48 & tenure <=60){
    return('48-60 Month')
  }else if (tenure > 60){
    return('> 60 Month')
  }
}

churn$tenure_group <- sapply(churn$tenure,group_tenure)
churn$tenure_group <- as.factor(churn$tenure_group)

#SeniorCitizen de 0 ou 1 para No ou Yes.
churn$SeniorCitizen <- as.factor(mapvalues(churn$SeniorCitizen,
                                           from=c("0","1"),
                                           to=c("No", "Yes")))

#Removemos as colunas que não precisa
churn$customerID <- NULL
churn$tenure <- NULL

