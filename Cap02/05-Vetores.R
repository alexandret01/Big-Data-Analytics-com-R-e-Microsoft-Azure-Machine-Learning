#Set Ambiente
setwd("~/Documentos/BigDataAnalytics-R-Azure2.0/Cap02")
getwd()

#Vetor Strings
vetor_string = c("Data", "Science", "Academy")

#Vetor Float
vetor_floar = c(1.3, 2.4, 5.2)

#Vetor Complexo
vetor_complexo = c(3+1i, 2.3+5i)

#Utilizado seq
vetor1 = seq(1:10)

#Utilizando rep
vetor2 = rep(1:10)

#Indexação
a = c(1,2,3,4,5)
a[1]

#Combinando Vetores de tipos diferentes
v1 = c(1,2,3,4,5)
v2 = c("aa","bb", "cc", "dd", "ee")
c(v1, v2)

#Somando vetores de diferentes valores (Tem que ser multiplo)
alfa = c(10, 20, 30)
beta = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
alfa + beta

#Nomeando Vetor
v = c("Nelson", "Mandela")
v
names(v) = c("Nome", "Sobrenome")
v["Nome"]
