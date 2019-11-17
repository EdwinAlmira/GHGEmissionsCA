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
Guatemala <- emission.data %>% 
  filter(row_number()==91)

Guatemala <- t(Guatemala)

GuatemalaDF <- data.frame(Guatemala)
colnames(GuatemalaDF)[1] <- "emisionGHG"

GuatemalaDT <- setDT(GuatemalaDF, keep.rownames = TRUE)[]
colnames(GuatemalaDT)[1] <- "year"

GuatemalaDT <- GuatemalaDT[-1:-230,]

GuatemalaDT$year <- sub("^.|.$","", GuatemalaDT$year)

GuatemalaDT$year <- as.numeric(GuatemalaDT$year)

GuatemalaDT$emisionGHG <- as.numeric(as.character(GuatemalaDT$emisionGHG))
GuatemalaDT$emisionGHG <- round((GuatemalaDT$emisionGHG / 1000000), digits = 1)

ggplot(GuatemalaDT, aes(x=GuatemalaDT$year, y=GuatemalaDT$emisionGHG)) +
  geom_line(color="blue")+
  geom_point(color="blue")+
  labs(x="Año", y="Toneladas de Gases invernadero emitido (Millones)", title="Emisiones de gases invernadero por año en EL Salvador")

#-----------------------Honduras-------------------------
Honduras <- emission.data %>% 
  filter(row_number()==96)

Honduras <- t(Honduras)

HondurasDF <- data.frame(Honduras)
colnames(HondurasDF)[1] <- "emisionGHG"

HondurasDT <- setDT(HondurasDF, keep.rownames = TRUE)[]
colnames(HondurasDT)[1] <- "year"

HondurasDT <- HondurasDT[-1:-230,]

HondurasDT$year <- sub("^.|.$","", HondurasDT$year)

HondurasDT$year <- as.numeric(HondurasDT$year)

HondurasDT$emisionGHG <- as.numeric(as.character(HondurasDT$emisionGHG))
HondurasDT$emisionGHG <- round((HondurasDT$emisionGHG / 1000000), digits = 1)

ggplot(HondurasDT, aes(x=HondurasDT$year, y=HondurasDT$emisionGHG)) +
  geom_line(color="blue")+
  geom_point(color="blue")+
  labs(x="Año", y="Toneladas de Gases invernadero emitido (Millones)", title="Emisiones de gases invernadero por año en Honduras")

#-----------------------Nicaragua-------------------------
Nicaragua <- emission.data %>% 
  filter(row_number()==153)

Nicaragua <- t(Nicaragua)

NicaraguaDF <- data.frame(Nicaragua)
colnames(NicaraguaDF)[1] <- "emisionGHG"

NicaraguaDT <- setDT(NicaraguaDF, keep.rownames = TRUE)[]
colnames(NicaraguaDT)[1] <- "year"

NicaraguaDT <- NicaraguaDT[-1:-230,]

NicaraguaDT$year <- sub("^.|.$","", NicaraguaDT$year)

NicaraguaDT$year <- as.numeric(NicaraguaDT$year)

NicaraguaDT$emisionGHG <- as.numeric(as.character(NicaraguaDT$emisionGHG))
NicaraguaDT$emisionGHG <- round((NicaraguaDT$emisionGHG / 1000000), digits = 1)

ggplot(NicaraguaDT, aes(x=NicaraguaDT$year, y=NicaraguaDT$emisionGHG)) +
  geom_line(color="blue")+
  geom_point(color="blue")+
  labs(x="Año", y="Toneladas de Gases invernadero emitido (Millones)", title="Emisiones de gases invernadero por año en Nicaragua")


#-----------------------Costa Rica-------------------------
CostaRica <- emission.data %>% 
  filter(row_number()==52)

CostaRica <- t(CostaRica)

CostaRicaDF <- data.frame(CostaRica)
colnames(CostaRicaDF)[1] <- "emisionGHG"

CostaRicaDT <- setDT(CostaRicaDF, keep.rownames = TRUE)[]
colnames(CostaRicaDT)[1] <- "year"

CostaRicaDT <- CostaRicaDT[-1:-230,]

CostaRicaDT$year <- sub("^.|.$","", CostaRicaDT$year)

CostaRicaDT$year <- as.numeric(CostaRicaDT$year)

CostaRicaDT$emisionGHG <- as.numeric(as.character(CostaRicaDT$emisionGHG))
CostaRicaDT$emisionGHG <- round((CostaRicaDT$emisionGHG / 1000000), digits = 1)

ggplot(CostaRicaDT, aes(x=CostaRicaDT$year, y=CostaRicaDT$emisionGHG)) +
  geom_line(color="blue")+
  geom_point(color="blue")+
  labs(x="Año", y="Toneladas de Gases invernadero emitido (Millones)", title="Emisiones de gases invernadero por año en Costa Rica")

#--------------------------------GRAFICO COMPARATIVO------------------------------------
ggplot()+
  geom_line(data = ElSalvadorDT, aes(x=ElSalvadorDT$year, y=ElSalvadorDT$emisionGHG), color = "#2c3e50", size = 2)+
  geom_line(data = GuatemalaDT, aes(x=GuatemalaDT$year, y=GuatemalaDT$emisionGHG), color = "#3498db", size = 2)+
  geom_line(data = HondurasDT, aes(x=HondurasDT$year, y=HondurasDT$emisionGHG), color = "#95a5a6", size = 2)+
  geom_line(data = NicaraguaDT, aes(x=NicaraguaDT$year, y=NicaraguaDT$emisionGHG), color = "#16a085", size = 2)+
  geom_line(data = CostaRicaDT, aes(x=CostaRicaDT$year, y=CostaRicaDT$emisionGHG), color = "#e74c3c", size = 2)+
  xlab("Año")+
  ylab("Toneladas de gases invernadero (Por millones)")
  





#----------Probando shit----------
sv <- data.frame(ElSalvadorDT)
colnames(sv)[2] <- "ElSalvador"
gt <- data.frame(GuatemalaDT)
hn <- data.frame(HondurasDT)
nc <- data.frame(NicaraguaDT)
cr <- data.frame(CostaRicaDT)

ca <- cbind(sv, gt$emisionGHG, hn$emisionGHG, nc$emisionGHG, cr$emisionGHG)
colnames(ca)[3] <- "Guatemala"
colnames(ca)[4] <- "Honduras"
colnames(ca)[5] <- "Nicaragua"
colnames(ca)[6] <- "CostaRica"

#----------------------El Salvador vs Costa Rica
svcr <- cbind(sv, cr$emisionGHG)
colnames(svcr)[3] <- "CostaRica"

ggplot()+
  geom_line(data = ElSalvadorDT, aes(x=ElSalvadorDT$year, y=ElSalvadorDT$emisionGHG), color = "#2c3e50", size = 2)+
  geom_line(data = CostaRicaDT, aes(x=CostaRicaDT$year, y=CostaRicaDT$emisionGHG), color = "#e74c3c", size = 2)+
  xlab("Año")+
  ylab("Toneladas de gases invernadero (Por millones)")

#Tonelada de gases emitidos por habitante
gasesPPsv <- svcr$ElSalvador[38] / 6.3
gasesPPcr <- svcr$CostaRica[38] / 4.9
