#Diretório
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap06/")

#RMongoDB
#Instalação do Pacote
install.packages("devtools")
library("devtools")
install_github("mongosoup/rmongodb", force = TRUE)
library(rmongodb)

#Criando a conexão
help("mongo.create")
mongo <- mongo.create()
mongo

#Checando a conexão
mongo.is.connected(mongo)

if(mongo.is.connected(mongo) == TRUE) {
  mongo.get.databases(mongo)
} else(mongo.is.connected(mongo) == FALSE){
  mongo <- mongo.create()
  mongo
}

#Armazenando o nome de uma das coleções
coll <- "users.contatos"

#Contando a quantidade de dados
mongo.count(mongo, coll)

#Buscando um registro em uma coleção
mongo.find.one(mongo, coll)

#Obtendo um vetor de valores distintos das chaves de uma coleção
res <- mongo.distinct(mongo, coll, "city")
head(res)

pops <- mongo.find.all(mongo, coll, list('pop' = list('$lte' = 2)))
head(pops, 2)

#Encerrando a conexão
mongo.destroy(mongo)
