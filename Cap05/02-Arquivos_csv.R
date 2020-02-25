#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap05/")

#Usando pacote readr
install.packages("readr")
library(readr)

#Carregando atraves do promt
meu_arquivo <- read_csv(file.choose())

#Importando Arquivos
df1 <- read_table("arq/temperaturas.txt", 
                  col_names = c("DAY","MONTH","YEAR","TEMP"))

head(df1)
View(df1)
str(df1)

read_lines("arq/temperaturas.txt", skip = 0, n_max = -1L)
read_file("arq/temperaturas.txt")

#Exportando e Importando
write_csv(iris, "arq/iris.csv")
dir()

df_iris <- read_csv("arq/iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

dim(df_iris)
str(df_iris)

#Manipulando arquivos csv
df_cad <- read_csv("arq/cadastro.csv")
View(df_cad)
class(df_cad)

install.packages("dplyr")
library(dplyr)
options(warn=-1)

df_cad <- tbl_df(df_cad)
head(df_cad)
View(df_cad)

write.csv(df_cad, "arq/df_cad_bkp.csv")

#Importando vários arquivos simultaneamente
list.files()
lista_arquivos <- list.files('~/Documentos/BigDataAnalytics-R-Azure2.0/Cap05/arquivos', full.names = TRUE)
class(lista_arquivos)
lista_arquivos

lista_arquivos2 <- lapply(lista_arquivos, read_csv)
class(lista_arquivos2)
View(lista_arquivos2)

#Parsing Data
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d")

#Definindo Local
locale("en")
locale("fr")
locale("pt")


