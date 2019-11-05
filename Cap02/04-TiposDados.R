#Complex
compl = 2.5 + 4i
typeof(compl)

sqrt(-1+0i)
sqrt(as.complex(-1))

#Operção com 0
5/0
0/5

#Vetor
vetor1 <- c(1:20)
length(vetor1)
vetor1[1] #Vetor começa em um

#Matriz
matriz <- matrix(1:20, nrow=2)
matriz

#Array
array1 <- array(1:5, dim = c(3,3,3))
array1

#DataFrame
View(iris)
typeof(iris)

#Lista
lista1 = list(a = matriz, b = vetor1)
lista1

#Function
func1 = function(x){
  var1 = x * x
  return(var1)
}

func1(4)

#Removendo Objetos
objects()
rm(array1, compl, lista1, vetor1)
