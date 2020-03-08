#Exercícios 

# Exercicio 1 - Instale a carregue os pacotes necessários para trabalhar com SQLite e R
install.packages("dplyr","RSQLite")
library(RSQLite)
library(dbplyr)
library(dplyr)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
mamiferos <- dbConnect(SQLite(),"mamiferos.sqlite")
??SQLite

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
src_dbi(mamiferos)
