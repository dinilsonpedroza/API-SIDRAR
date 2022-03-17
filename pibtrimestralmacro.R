###################################################################################################
################# PIB Trimestral por raspagem #######################################################
#####################################################################################################
rm(list=ls(all=TRUE)) ### limpando tudo.
### Pacotes necessários

library(sidrar)
library(ggplot2)
library(lubridate)
library (zoo)
library(ggthemes)
library(scales)
library(tidyverse)
library(rvest)

###  Tabela 5932 - Taxa de variação do índice de volume trimestral

info_sidra("5932")### Informações da tabela.

y<-get_sidra(api ="/t/5932/n1/all/v/6564/p/all/c11255/90707/d/v6564%201")
y ### visualizando o o objeto criado.
class(y) ### Vendo a classe do objeto criado.

### Vamos criar um data frame (y2) apenas com os itens que nos interessa.
y2<-data.frame(y$Trimestre, y$Valor)
y2 ### visualizando o objeto criado.
y2<-y2[-1, ] ### eliminando a primeira linha do data frame.
y2
pib<-y2$y.Valor ### Renomeando a coluna de PIB do objeto y2.

### Notem que a data em y2 não é percebida com data no R. Precisamos criar uma coluna de datas 
### que seja percebida como tal no R.
### Para isso usaremos a função seq.Date.
trim<-seq.Date(from = as_date("1996-04-01"),
                      to = as_date("2021-12-01"),
                      "quarter")

### Vamos usar agora uma função do pacote "zoo" para criar datas trimestrais.
trimestre = as.yearqtr(trim, format='%Y%q')
trimestre

### Vamos formar um data frame com as datas recém criadas.

pib_tri <- data.frame(trimestre, pib)
pib_tri

### Renomeando as colunas de nosso data frame definitivo.

colnames(pib_tri) = c('trimestres', 'pib_trim')
pib_tri


mm <- rollmean(pib_tri$pib_trim, 4, align = "right") ### média móvel do pib trimestral.
mm
### Gráfico com ggplot2 versão null

ggplot(pib_tri, aes(x=trimestres, y=pib_trim))+
  geom_line(col="blue")


### Gráfico com ggplot2 versão 1

ggplot(pib_tri, aes(x=trimestres, y=pib_trim))+theme_linedraw()+
  geom_line(col="blue", size = .8)+
  geom_hline(yintercept=0, colour='red', linetype='dashed')+
  scale_x_yearqtr(breaks = seq(from = min(pib_tri$trimestres),
                               to = max(pib_tri$trimestres),
                               by = .5),
                  format = "%Y/Tri%q")+
  theme(axis.text.x=element_text(angle=45, hjust=1),
        plot.title = element_text(size=10, face='bold'))+
  labs(x='Ano/Trimestre', y='PIB (%)',
       title='PIB Trimestral',subtitle = '1996-2021',
       caption='Fonte: Macroeconomia Unicap') ### Perfeito!

### Gráfico com ggplot2 versão 2 - com linha de suavização


ggplot(pib_tri, aes(x=trimestres, y=pib_trim))+theme_minimal()+
  geom_line(col="blue", size = .8)+
  geom_hline(yintercept=0, colour='red', linetype='dashed')+
  geom_smooth(method = "loess", colour = 'green', se = FALSE)+
  scale_x_yearqtr(breaks = seq(from = min(pib_tri$trimestres),
                               to = max(pib_tri$trimestres),
                               by = .5),
                  format = "%Y/Q%q")+
  theme(axis.text.x=element_text(angle=45, hjust=1),
        plot.title = element_text(size=10, face='bold'))+
  labs(x='ano/trimestre', y='PIB (%)',
       title='PIB Trimestral',subtitle = '1996-2021',
       caption='Fonte: Macroeconomia Unicap') ### Deu certo.


### Gráfico com ggplot2 versão 3 - com legenda
colors<-c("PIB"="darkgreen")

ggplot(pib_tri, aes(x=trimestres, y=pib_trim))+theme_bw()+
  geom_line(aes(y=pib_trim, colour = "PIB"), size = 1)+
  scale_x_yearqtr(breaks = seq(from = min(pib_tri$trimestres),
                               to = max(pib_tri$trimestres),
                               by = .5),
                  format = "%Y/Tri%q")+
  theme(axis.text.x=element_text(angle=45, hjust=1),
        plot.title = element_text(size=10, face='bold'), legend.position = "top")+
  labs(x='Ano/Trimestre', y='PIB (%)',
       title='PIB Trimestral',subtitle = '1996-2021',
       caption='Fonte: Macroeconomia Unicap', color = "")+
  scale_color_manual(values = colors) ### Perfeito!

