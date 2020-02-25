#Pergunta: Quais clubes mais realizam transações 
#de compra e venda de jogadores, entre si?
#Dataset Kaggle: https://www.kaggle.com/hugomathien/soccer

#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap05/")

#Pacotes
install.packages("RSQLite")
install.packages("dplyr")
install.packages("tidyr")
install.packages("arules")
install.packages("arulesSequences")
install.packages("readr")
install.packages("visNetwork")
install.packages("igraph")
install.packages("lubridate")
install.packages("DT")

library(RSQLite)
library(dplyr)
library(tidyr)
library(arules)
library(arulesSequences)
library(readr)
library(stringr)
library(visNetwork)
library(igraph)
library(lubridate)
library(DT)


  