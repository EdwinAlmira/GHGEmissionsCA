#Librarys
library(ggplot2)
library(plotly)
library(dplyr)
library(data.table)

#-----------------------EL SALVADOR-------------------------
# Conjunto de el salvador
ElSalvador <- emission.data %>% 
  filter(row_number()==68)

#Cambia las columnas a filas
ElSalvador <- t(ElSalvador)

#Hago un data frame
ElSalvadorDF <- data.frame(ElSalvador)
colnames(ElSalvadorDF)[1] <- "emisionGHG"

#Hago que las filas se vuelvan la primer columna en un data table
ElSalvadorDT <- setDT(ElSalvadorDF, keep.rownames = TRUE)[]
colnames(ElSalvadorDT)[1] <- "year"

#Elimino las primeras 230 filas
ElSalvadorDT <- ElSalvadorDT[-1:-230,]

#Elimino el primer caracter de toda una columna
ElSalvadorDT$year <- sub("^.|.$","", ElSalvadorDT$year)

#Convertir el tipo de dato
ElSalvadorDT$year <- as.numeric(ElSalvadorDT$year)

#Convierto un gran numero en un caracter para despues pasarlo a numerico y de ahi divido todos los valores entre 1 millon
ElSalvadorDT$emisionGHG <- as.numeric(as.character(ElSalvadorDT$emisionGHG))
ElSalvadorDT$emisionGHG <- round((ElSalvadorDT$emisionGHG / 1000000), digits = 1)


#Scatterplot de como ha ido creciendo el valor en El Salvador
ggplot(ElSalvadorDT, aes(x=ElSalvadorDT$year, y=ElSalvadorDT$emisionGHG)) +
      geom_line(color="blue")+
      geom_point(color="blue")+
      labs(x="Año", y="Toneladas de Gases invernadero emitido (Millones)", title="Emisiones de gases invernadero por año en EL Salvador")


#-----------------------Guatemala-------------------------
# Conjunto de el salvador
Guatemala <- emission.data %>% 
  filter(row_number()==91)

#Cambia las columnas a filas
Guatemala <- t(Guatemala)

#Hago un data frame
GuatemalaDF <- data.frame(Guatemala)
colnames(GuatemalaDF)[1] <- "emisionGHG"

#Hago que las filas se vuelvan la primer columna en un data table
GuatemalaDT <- setDT(GuatemalaDF, keep.rownames = TRUE)[]
colnames(GuatemalaDT)[1] <- "year"

#Elimino las primeras 230 filas
GuatemalaDT <- GuatemalaDT[-1:-230,]

#Elimino el primer caracter de toda una columna
GuatemalaDT$year <- sub("^.|.$","", GuatemalaDT$year)

#Convertir el tipo de dato
GuatemalaDT$year <- as.numeric(GuatemalaDT$year)

#Convierto un gran numero en un caracter para despues pasarlo a numerico y de ahi divido todos los valores entre 1 millon
GuatemalaDT$emisionGHG <- as.numeric(as.character(GuatemalaDT$emisionGHG))
GuatemalaDT$emisionGHG <- round((GuatemalaDT$emisionGHG / 1000000), digits = 1)


#Scatterplot de como ha ido creciendo el valor en El Salvador
ggplot(GuatemalaDT, aes(x=GuatemalaDT$year, y=GuatemalaDT$emisionGHG)) +
  geom_line(color="blue")+
  geom_point(color="blue")+
  labs(x="Año", y="Toneladas de Gases invernadero emitido (Millones)", title="Emisiones de gases invernadero por año en EL Salvador")

