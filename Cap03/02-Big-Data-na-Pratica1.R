# Big Data na Prática 1 - Analisando a Temperatura Média nas Cidades Brasileiras

#Diretorio
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap03")

# Dataset:
# http://berkeleyearth.org/data
# https://drive.google.com/open?id=1nSwP3Y0V7gncbnG_DccNhrTRxmUNqMqa

# Instalando e Carregando Pacotes
install.packages("readr")
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)

# Carregando os dados

# Usando fread()
?fread
system.time(df <- fread("../TemperaturasGlobais.csv"))

# Criando subsets dos dados carregados
cidadesBrasil <- subset(df, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)
head(cidadesBrasil)
nrow(df)
nrow(cidadesBrasil)
dim(cidadesBrasil)

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt,format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)

# Carregando os subsets

# São Caetano do Sul
scs <- subset(cidadesBrasil, City == 'São Caetano do Sul')
scs <- subset(scs, Year %in% c(1796,1846,1896,1946,1996,2012))

# Santo André
sa <- subset(cidadesBrasil, City == 'Santo André')
sa <- subset(sa, Year %in% c(1796,1846,1896,1946,1996,2012))

# São Bernardo do Campo
sbc <- subset(cidadesBrasil, City == 'São Bernardo do Campo')
sbc <- subset(sbc,Year %in% c(1796,1846,1896,1946,1996,2012))

# Construindo os Plots
p_scs <- ggplot(scs, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE,fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em São Caetano do Sul") +
  theme(plot.title = element_text(size = 18))

p_sa <- ggplot(sa, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE,fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Santo André") +
  theme(plot.title = element_text(size = 18))

p_sbc <- ggplot(sbc, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE,fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Recife") +
  theme(plot.title = element_text(size = 18))

# Plotando
p_scs
p_sa
p_sbc
