### Operações com matrizes
#Referência: https://rpubs.com/adelmofilho/AlgebraMatricial
#Referência para MIP no R: https://rpubs.com/amrofi/Regional_Economics_mip

getwd()
library(tseries) ### Pacote necessário à montagem das matrizes.

### Alimentando as matrizes com o comando read.matrix.
m1<-read.matrix ("m1.csv", header = FALSE, sep = ",", skip = 0) ### Dados hipotéticos de uma MIP.
m2<-read.matrix ("m2.csv", header = FALSE, sep = ",", skip = 0) ### Exemplo para operação com matrizes.
m3<-read.matrix ("m3.csv", header = FALSE, sep = ",", skip = 0) ### Exemplo para operação com matrizes.
gm1<-read.matrix("gM1.csv", header = F, sep = ",", skip = 0) ### Dados da produção (hipotéticos) de m1

### Estruturando as matrizes de outra forma:
M1 = matrix(m1, nrow = 3, ncol = 3)
M2 = matrix(m2, nrow = 3, ncol = 3)
M3 = matrix(m3, nrow = 7, ncol = 1) ### Criar vetor por aqui ficou melhor.
print(M3)
gM1 = matrix(gm1, nrow = 1, ncol = 3)
print(gM1)

################################################################################
################## Exemplos de operações com matrizes ##########################
################################################################################
### Soma de matrizes.
M_soma = M1 + M2
M_soma2 = m1 + m2 ### Funciona do mesmo jeito.

class(M1)
class(m1) ### Os dados já foram lidos como matriz.

### Multiplicar uma matriz por um escalar.
M_prod_escalar = 42 * m1

### Produto elemento por elmento de matrizes de mesma ordem.
M_prod_elemento = m1 * m2

### Multiplicação entre matrizes.
M_prod = m1 %*% m2

### Transposição
M_transp = t(M3) ### m3 passa a ser um vetor linha.
print(M_transp)

### Determinante de uma matriz.
det(m1)

### Matriz inversa
M_inversa = solve(M1)
M_inversa

### Matriz identidade
I3 <- diag(rep(1,3))
I3
I3a<-diag(3) ### O default desse comando já é a unidade.
I3a

################################################################################
################ Matriz de coeficientes técnicos de M1 #########################
################################################################################
### 1º Método
k1<-(gM1)^-1 ### O inverso dos valores da produção (gM1).
k2<-diag(rep(k1,1)) ### Matriz diagonal com os valores do inverso de gM1.
A<-M1%*%k2
A ### Matriz de coeficientes técnicos de M1. Deu certo.

### 2º Método
k3<-diag(rep((gM1)^-1,1)) ### Mais direto.
Aa<-M1%*%k3
Aa ### Deu certo.


################################################################################
############# Matriz de Leontief ###############################################
################################################################################
### (I - A)
I_A<- diag(3) - A

### Inversa de (I - A)
Z<-solve(I_A) ### Matriz de Leontief ou matriz de coeficientes diretos e indiretos.


### Matriz de demanda final
f<-read.matrix ("df.csv", header = FALSE, sep = ",", skip = 0)
F = matrix(f, nrow = 3, ncol = 1)

### Calculando o vetor de produção a partir da matriz de Leontief.
g=Z%*%F
g
