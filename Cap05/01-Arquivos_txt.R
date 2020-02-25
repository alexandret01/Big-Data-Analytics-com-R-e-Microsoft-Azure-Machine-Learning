#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap05/")

#Importando arquivo com read.table() - Pacote Utils Padrão R
df1 <- read.table("arq/pedidos.txt")
df1
dim(df1)

#Header e Seperador
df1 <- read.table("arq/pedidos.txt", header = TRUE, sep = ',')
df1
dim(df1)

#Importando arquivo com read.csv()
df2 <- read.csv("arq/pedidos.txt")
df2
dim(df2)

df3 <- read.csv2("arq/pedidos.txt")
df3
dim(df3)

df3 <- read.csv2("arq/pedidos.txt", sep = ',')
df3
dim(df3)


#Importando arquivo com read.delim()
df4 <- read.delim("arq/pedidos.txt")
df4

df4 <- read.delim("arq/pedidos.txt", sep = ',')
df4
dim(df4)


#Importando / Exportando

#Gerando arquivo
write.table(mtcars, file = 'arq/mtcars.txt')
dir()

df_mtcars <- read.table("arq/mtcars.txt")
df_mtcars
dim(df_mtcars)

write.table(mtcars, file = "arq/mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")
list.files()

read.table("arq/mtcars2.txt")
df_mtcars2 <- read.table("arq/mtcars2.txt")
df_mtcars2

df_mtcars2 <- read.table("arq/mtcars2.txt", sep = '|', encoding = 'UTF-8')
df_mtcars2
