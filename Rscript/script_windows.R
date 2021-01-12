#############################################
## Script para ajustar um modelo linear   ###
## e fazer um gráfico de dispersão com a  ###
## com a reta de regressão                ###
##                                        ###
##Desenvolvido por:    Fabio Silva        ###
##Instagram:                              ###
#############################################

#Apagando todos objetos da memória
rm(list = ls())

#Carregando Pacotes
library(readxl)  #Para leitura de arquivos do Excel
library(ggplot2) #Para fazer gráficos 
library(ggpubr)  #Para adicionar elementos de gráficos

#Definindo diretório de trabalho
setwd('C:/Users/Fsilva/OneDrive/Documents/projeto_r/reg_linear')

#Lendo dados do excel 
dados <- read_excel('dados/atlas2013_dadosbrutos_pt.xlsx',sheet = 3)

#Ajustando um modelo linear
modelo <- lm(formula = PIND~T_ANALF25A29,data = dados )

#####################################################
#####        Fazendo o gráfico                #######
#####################################################
ggplot(dados,aes(x=T_ANALF25A29,y=PIND))+ #Informando os dados e mapeando as variáveis
  geom_point(shape=21,colour='dodgerblue4',fill='deepskyblue1',size=3.0)+ #Inserindo os pontos e definindo cores e tamanho
  geom_smooth(method = 'lm',formula = y~x,se=FALSE,col='darkred')+ #Adicionando a reta de regressão
  stat_regline_equation(aes(label=paste(..eq.label..,..rr.label..,sep = '~~~')))+ #Adicionando a equação e o R-quadrado
  labs(x='Taxa de Analfabetismo[%]', y='Proporção de Pobres [%]')+#Inserindo os títulos dos eixos
  theme_light() #Definindo o tema


#Salvando o gráfico
ggsave(filename = 'figs/reg_linear.png', #Definindo nome do arquivo
       width = 12, #Largura da figura
       height = 10, #Altura da figura
       units = 'cm')  #Unidade



