##########################################################################################
################# Taxas de Crescimento de países #########################################
##########################################################################################



rm(list=ls(all=TRUE)) ### limpando tudo.

### Onde pegar os dados:
# https://databank.worldbank.org/home.aspx
# GDP growth (annual %)
# Downloads options: Excel
# Clique em Data on this page
# Abra o arquivo e o salve em CSV
# Atenção: no LibreOffice Calc desmarquei a opção "Espaço"
# Eliminei uma coluna vazia.
# Exclui a linha com os créditos.

### Carregando as bibliotecas:
library(ggplot2)
library(lubridate)
library(scales)


getwd()# Identificando o diretório de trabalho

pibpc<-read.csv('txcresc.csv', header = T) ### Lendo o arquivo.

dfpibpc <- subset(pibpc, select = c('Argentina', 'Brazil', 'France', 'Uganda', 'United.States')) ### Selecionando países.

dfpibpc ### Dando uma olhada no data frame criado.

Anos<-seq.Date(from = as_date("2000-01-01"),
               to = as_date("2015-01-01"),
               "year")
df = data.frame(Anos, dfpibpc) ### Uma maneira de montar o data frame que nos interessa.

df

### Gráfico 1

ggplot(data = df, aes(x = Anos, y = Brazil)) +
  geom_line(aes(y = Brazil, colour = "Brasil"), size =.8)+
  geom_line(aes(y= Argentina, colour="Argentina"),size=.8) +
  geom_line(aes(y= France, colour="França"),size=.8) +
  geom_line(aes(y= Uganda, colour="Uganda"),size=.8) +
  geom_line(aes(y= United.States, colour="Estados Unidos"),size=.8) +
  xlab('Anos')+ 
  ylab('Taxas de Crescimento') ### Deu certo.
  
  
### Gráfico 2
  
ggplot(data = df, aes(x = Anos)) +
  geom_line(aes(y = Brazil, colour = "Brasil"), size =.8)+
  geom_line(aes(y= Argentina, colour="Argentina"),size=.8) +
  geom_line(aes(y= France, colour="França"),size=.8) +
  geom_line(aes(y= Uganda, colour="Uganda"),size=.8) +
  geom_line(aes(y= United.States, colour="Estados Unidos"),size=.8) +
  xlab('Anos')+ 
  ylab('Taxas de Crescimento') ### Deu certo.


### Gráfico 3
ggplot(data = df, aes(x = Anos)) +
  theme_linedraw()+
  geom_line(aes(y= Brazil, colour = "Brasil"), size =.8)+
  geom_line(aes(y= Argentina, colour="Argentina"),size=.8) +
  geom_line(aes(y= France, colour="França"),size=.8) +
  geom_line(aes(y= Uganda, colour="Uganda"),size=.8) +
  geom_line(aes(y= United.States, colour="Estados Unidos"),size=.8) +
  geom_hline(yintercept=0, colour='red', linetype='dashed')+
  xlab('Anos')+ 
  ylab('Taxas de Crescimento') ### Deu certo.

### Gráfico 4
ggplot(data = df, aes(x = Anos)) +
  theme_linedraw()+
  geom_line(aes(y= Brazil, colour = "Brasil"), size =.8)+
  geom_line(aes(y= Argentina, colour="Argentina"),size=.8) +
  geom_line(aes(y= France, colour="França"),size=.8) +
  geom_line(aes(y= Uganda, colour="Uganda"),size=.8) +
  geom_line(aes(y= United.States, colour="Estados Unidos"),size=.8) +
  geom_hline(yintercept=0, colour='red', linetype='dashed')+
  labs(x='Anos', y='Crescimento Econômico (%)', ### "Labels".
       title='Taxas de Crecimento',subtitle = '(2000-2015)',
       caption='Fonte: Fundamentos de Macro Unicap', color = "")### Deu certo.



### Gráfico 5
ggplot(data = df, aes(x = Anos)) +
  theme_linedraw()+
  geom_line(aes(y= Brazil, colour = "Brasil"), size =.8)+
  geom_line(aes(y= Argentina, colour="Argentina"),size=.8) +
  geom_line(aes(y= France, colour="França"),size=.8) +
  geom_line(aes(y= Uganda, colour="Uganda"),size=.8) +
  geom_line(aes(y= United.States, colour="Estados Unidos"),size=.8) +
  geom_hline(yintercept=0, colour='red', linetype='dashed')+
  labs(x='Anos', y='Crescimento Econômico (%)', ### "Labels".
       title='Taxas de Crecimento',subtitle = '(2000-2015)',
       caption='Fonte: Fundamentos de Macro Unicap', color = "") +
  theme (plot.title = element_text(size=14, face='bold', hjust = 0.5, family = "mono"))+ ### Estilo do título.
  theme (plot.subtitle = element_text(size = 13, face = 'bold', hjust = 0.5, family = "mono" ))+ ### Estilo do subtítulo.
  theme (axis.text.x = element_text(size = 10, face="bold", color="black", angle=45, hjust = 1, family = "mono")) + ### Estilo de "x".
  theme (axis.text.y = element_text(size=10, face="bold", color="Black",angle=0, family = "mono")) ### Estilo de "y".


### Gráfico 6
ggplot(data = df, aes(x = Anos)) +
  theme_linedraw()+
  geom_line(aes(y= Brazil, colour = "Brasil"), size =.8)+
  geom_line(aes(y= Argentina, colour="Argentina"),size=.8) +
  geom_line(aes(y= France, colour="França"),size=.8) +
  geom_line(aes(y= Uganda, colour="Uganda"),size=.8) +
  geom_line(aes(y= United.States, colour="Estados Unidos"),size=.8) +
  geom_hline(yintercept=0, colour='red', linetype='dashed')+
  labs(x='Anos', y='Crescimento Econômico (%)', ### "Labels".
       title='Taxas de Crecimento',subtitle = '(2000-2015)',
       caption='Fonte: Fundamentos de Macro Unicap', color = "") +
  theme (plot.title = element_text(size=14, face='bold', hjust = 0.5, family = "mono"))+ ### Estilo do título.
  theme (plot.subtitle = element_text(size = 13, face = 'bold', hjust = 0.5, family = "mono" ))+ ### Estilo do subtítulo.
  theme (axis.text.x = element_text(size = 10, face="bold", color="black", angle=45, hjust = 1, family = "mono")) + ### Estilo de "x".
  theme (axis.text.y = element_text(size=10, face="bold", color="Black",angle=0, family = "mono")) +### Estilo de "y".
  theme (legend.position = "bottom") + ### Posição da legenda.
  scale_x_date(date_labels = "%Y", breaks = date_breaks("1 year"))+ ### Espaçamento de "x".
  scale_color_brewer(palette = "Dark2")  ### Cores no padrão Dark2 ### Perfeito.

### Gráfico 7
ggplot(data = df, aes(x = Anos)) + ### Definindo o "X" do gráfico.
  theme_linedraw()+ ### Fundo do gráfico.
  geom_line(aes(y= Brazil, colour = "Brasil"), size =.8)+ ### Y, nome da linha, grossura da linha.
  geom_point(aes(y = Brazil))+ ### Botando pontos nas linhas.
  geom_line(aes(y= Argentina, colour="Argentina"),size=.8) +
  geom_point(aes(y = Argentina))+
  geom_line(aes(y= France, colour="França"),size=.8) +
  geom_point(aes(y = France))+
  geom_line(aes(y= Uganda, colour="Uganda"),size=.8) +
  geom_point(aes(y = Uganda))+
  geom_line(aes(y= United.States, colour="Estados Unidos"),size=.8) +
  geom_point(aes(y = United.States))+
  geom_hline(yintercept=0, colour='red', linetype='dashed')+ ### Desenhando uma linha horizontal ao nível zero.
  labs(x='Anos', y='Crescimento Econômico (%)', ### "Labels".
       title='Taxas de Crecimento',subtitle = '(2000-2015)',
       caption='Fonte: Fundamentos de Macro Unicap', color = "") + ### Nota de rodapé e dizendo que não quero nome na legenda.
  theme (plot.title = element_text(size=14, face='bold', hjust = 0.5, family = "mono"))+ ### Estilo do título.
  theme (plot.subtitle = element_text(size = 13, face = 'bold', hjust = 0.5, family = "mono" ))+ ### Estilo do subtítulo.
  theme (axis.text.x = element_text(size = 10, face="bold", color="black", angle=45, hjust = 1, family = "mono")) + ### Estilo de "x".
  theme (axis.text.y = element_text(size=10, face="bold", color="Black",angle=0, family = "mono")) +### Estilo de "y".
  theme (legend.position = "bottom") + ### Posição da legenda.
  scale_x_date(date_labels = "%Y", breaks = date_breaks("1 year"))+ ### Espaçamento de "x".
  scale_color_brewer(palette = "Dark2")  ### Cores no padrão Dark2 ### Perfeito.



